<?php
namespace Fluxflow\Modules\Api\Plugins;

use Phalcon\Acl;
use Phalcon\Acl\Role;
use Phalcon\Acl\Resource;
use Phalcon\Events\Event;
use Phalcon\Mvc\User\Plugin;
use Phalcon\Mvc\Dispatcher;
use Phalcon\Acl\Adapter\Memory as AclList;
use Phalcon\Mvc\Model\Query;

/**
 * SecurityPlugin
 *
 * This is the security plugin which controls that users only have access to the modules they're assigned to
 */
class SecurityPlugin extends Plugin
{
    /**
     * Returns an existing or new access control list
     *
     * @returns AclList
     */
    public function getAcl()
    {
        if (!isset($this->persistent->acl)) 
        {
            $acl = new AclList();

            $acl->setDefaultAction(Acl::DENY);

            $permissions = $this->findResources();
            
            // Register roles
            foreach($permissions['secured'] as $key=>$value)
            {
                $acl->addRole(new Role($key,''));
            }

            foreach ($permissions['secured'] as $role => $modules)
            {
                foreach($modules as $module=>$controllers)
                {
                    foreach($controllers as $controller=>$actions) {
                        $mod = $module;
                        $ctrl = $controller;
                        $resourceName = $mod . "/" . $ctrl;
                        $resource = new Resource($resourceName);
                        $acl->addResource($resource, $actions);
                        //var_dump($resource);
                        foreach($actions as $action)
                        {
                            $acl->allow($role,$resourceName,$action);
                        }
                    }
                }
            }
            
            //The acl is stored in session, APC would be useful here too
            $this->persistent->acl = $acl;
        }

        return $this->persistent->acl;
    }
    
    /**
     * This action is executed before execute any action in the application
     *
     * @param Event $event
     * @param Dispatcher $dispatcher
     * @return bool
     */
    public function beforeDispatch(Event $event, Dispatcher $dispatcher)
    {
        $auth = $this->session->get('auth');
        
        $module =  $dispatcher->getModuleName();
        if($module == 'frontend') {
            //Frontend module dosen't need security
            return TRUE;
        }
        
        $controller = $dispatcher->getControllerName();
        $action = $dispatcher->getActionName();
        $resourceName = $module . "/" . $controller;

        $acl = $this->getAcl();
        
        $isResource = $acl->isResource($resourceName);
        if (!$isResource) {
            return TRUE;
        }
        
        $allowed = FALSE;
        foreach($auth['user']['organizations'][$auth['user']['currentorganization']] as $role)
        {
            $allowed = $acl->isAllowed($role, $resourceName, $action);
        }
        
        if(!$allowed) 
        {
            foreach($auth['user']['organizations'] as $organization => $role)
            {
                $auth['user']['organizationlist'] = array();
                $orgAllowed = $acl->isAllowed($role, $resourceName, $action);
                if($orgAllowed)
                {
                    $auth['user']['currentorganization'] = $organization;
                    $auth['user']['organizationlist'][$organization] = array();
                    $allowed = TRUE;
                }
            }            
        }
        if (!$allowed) 
        {
            if ( $module == "api" || $controller == "api")
            {
                $dispatcher->forward(array(
                    'module'        => 'api',
                    'controller'    => 'error',
                    'action'        => 'showjson401'
                ));
                
            } 
            else if($module == "ff" || $controller == "ff")
            {
                $dispatcher->forward([
                        'module'        => 'ff',
                        'controller'    => 'login',
                        'action'        => 'index'
                ]);
            }
            else 
            {
                $dispatcher->forward([
                        'module'        => 'frontend',
                        'controller'    => 'error',
                        'action'        => 'show401'
                ]);
            }
            
            $this->session->destroy();
            return FALSE;
        }
        else
        {
            $token = $this->cookies->get('token');
            //TODO: Compare token
            /*if ( !$token || $token != $auth['token'])
            {
                if ( $module == "api" )
                {
                    $dispatcher->forward(array(
                        'module'        => 'api',
                        'controller'    => 'error',
                        'action'        => 'showJson401Token'
                    ));            

                } 

                //TODO: Dispatch for HTML page
                
                $this->session->destroy();
                return false;
            }*/
            
            //$auth['token'] = md5($user->email . uniqid(gethostname(), TRUE));
            $this->session->set('auth',$auth);
            //$token = $this->cookies->set('token',$auth['token']);
        }
        //var_dump($module . " - " . $controller . " - " . $action);
        //var_dump($allowed);
        print_r($auth);
        die("aqui");

        return TRUE;
    }
    
    public function findResources()
    {
        $sql = "SELECT
                ur.unit_organizations_id,
                ur.name as role,
                am.name as module,
                ac.name as controller,
                aa.name as action,
                aa.secured,
                ur.active,
                ur.deleted
                FROM app_actions aa
                LEFT JOIN app_controllers ac ON (ac.app_modules_id = aa.app_modules_id AND ac.id = aa.app_controllers_id)
                LEFT JOIN app_modules am ON (am.id = ac.app_modules_id AND am.id = aa.app_modules_id)
                LEFT JOIN user_role_permissions urp ON (urp.app_modules_id = am.id AND urp.app_controllers_id AND urp.app_actions_id = aa.id)
                LEFT JOIN user_roles ur ON (urp.user_roles_id = ur.id)
                WHERE
                aa.active > 0
                AND aa.deleted = 0
                AND ac.active > 0
                AND ac.deleted = 0
                AND am.active > 0
                AND am.deleted = 0";
        
        $query = $this->db->query($sql);
        $query->setFetchMode(\Phalcon\Db::FETCH_ASSOC);
        $result = $query->fetchAll();

        $permissions = [
            'free'      => [],
            'secured'   => []
        ];
        
        foreach($result as $row)
        {
            if($row['secured'] == 0)
            {
                $key = 'free';
            } 
            else 
            {
                $key = 'secured';                
            }
            $permissions[$key][strtolower($row['module'])][strtolower($row['controller'])][strtolower($row['action'])] = [
                'organization'  => $row['unit_organizations_id'],
                'role'          => $row['role']
            ];
        }
        
        return $permissions;
    }    
}
