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
        /*if (!isset($this->persistent->acl)) 
        {*/
            $acl = new AclList();

            $acl->setDefaultAction(Acl::DENY);

            $permissions = $this->findResources();
            $roles = $this->findRoles();
            $organizations = $this->findOrganizations();
            
            // Register roles
            foreach($roles as $role)
            {
                $acl->addRole(new Role($role['unit_organizations_id'] . strtolower($role['name']),$role['description']));
            }

            foreach ($permissions['secured'] as $module => $controllers)
            {
                foreach($controllers as $controller => $actions)
                {
                    foreach($actions as $action=>$roles) 
                    {
                        $resourceName = $module . "/" . $controller;
                        
                        $resource = new Resource($resourceName);
                        
                        foreach($organizations as $org)
                        {
                            $acl->addResource($resource, $action);
                        }

                        foreach($roles as $role)
                        {
                            if($role['organization'] == NULL || $role['role'] == NULL)
                                continue;
                            
                            $acl->allow($role['organization'] . $role['role'],$resourceName,$action);
                        }
                    }
                }
            }
            //The acl is stored in session, APC would be useful here too
            $this->persistent->acl = $acl;
        //}
        
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
        //print_r($module);die("aqui");
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
        $auth['user']['autorized']['condition'] = FALSE;
        $auth['user']['autorized']['path'] = $resourceName . "/" . $action;
        foreach($auth['user']['organizations'][$auth['user']['currentorganization']] as $role)
        {
            $allowed = $acl->isAllowed($auth['user']['currentorganization'].$role, $resourceName, $action);
            if($allowed) {
                $auth['user']['autorized']['role'] = $role;
                $auth['user']['autorized']['organization'] = $auth['user']['currentorganization'];
                $auth['user']['autorized']['condition'] = TRUE;
                break;
            }
        }
        
        if(!$allowed) 
        {
            foreach($auth['user']['organizations'] as $organization => $role)
            {
                $orgAllowed = $acl->isAllowed($organization.$role, $resourceName, $action);
                if($orgAllowed)
                {
                    $auth['user']['currentorganization'] = $organization;
                    $auth['user']['organizationlist'][$organization] = array();
                    $auth['user']['autorized']['role'] = $role;
                    $auth['user']['autorized']['organization'] = $organization;
                    $auth['user']['autorized']['condition'] = TRUE;
                    $allowed = TRUE;
                }
            }            
        }
        //print_r($auth);die;
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
                if($auth['user']) 
                {
                    //echo("401");die;
                    $dispatcher->forward([
                            'module'        => 'ff',
                            'controller'    => 'error',
                            'action'        => 'show401'
                    ]);
                }
                else
                {
                    //echo("login");die;
                    $dispatcher->forward([
                            'module'        => 'ff',
                            'controller'    => 'login',
                            'action'        => 'index'
                    ]);
                    $this->session->destroy();
                }
            }
            else 
            {
                $dispatcher->forward([
                        'module'        => 'frontend',
                        'controller'    => 'error',
                        'action'        => 'show401'
                ]);
            }
            
            //
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
        //print_r($auth);
        //die("aqui");

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
            $permissions[$key][strtolower($row['module'])][strtolower($row['controller'])][strtolower($row['action'])][] = [
                'organization'  => $row['unit_organizations_id'],
                'role'          => strtolower($row['role'])
            ];
        }
        //print_r($permissions);die;
        return $permissions;
    }

    public function findRoles()
    {
        $sql = "SELECT
                name, description, unit_organizations_id
                FROM 
                user_roles
                WHERE
                active > 0
                AND deleted = 0";
        
        $query = $this->db->query($sql);
        $query->setFetchMode(\Phalcon\Db::FETCH_ASSOC);
        return $query->fetchAll();
    }
    
    public function findOrganizations()
    {
        $sql = "SELECT
                id
                FROM 
                unit_organizations
                WHERE
                active > 0
                AND deleted = 0";
        
        $query = $this->db->query($sql);
        $query->setFetchMode(\Phalcon\Db::FETCH_ASSOC);
        return $query->fetchAll();        
    }
}
