<?php
namespace Fluxflow\Modules\Api\Controllers;

use Phalcon\Http\Response;
use Fluxflow\Modules\Api\Models\UserUsers;
use Fluxflow\Modules\Api\Models\UserAssignedOrganizations;
use Fluxflow\Modules\Api\Models\UserAssingnedRoles;
use Fluxflow\Modules\Api\Models\UserRoles;
use Fluxflow\Modules\Api\Models\UnitOrganizationHierarchy;

class LoginController extends ControllerBase {
    
    public function indexAction()
    {
        
    }
    
    public function loginAction()
    {
        $response = new Response();
        
        $post = $this->request->getJsonRawBody(TRUE);
        if( 
            !isset($post['email']) || 
            !isset($post['password']) || 
            !$post['email'] || 
            !$post['password']
        ) 
        {
            $code = 400;
            $data = [
                        "status"    => "BAD-REQUEST",
                    ];
            $response->setStatusCode($code);
            $response->setJsonContent($data);
        
            return $response;
        }
        
        $email = $post['email'];
        $password = md5($post['password']);
        
        $user = UserUsers::findLogin($email, $password);
        
        //var_dump($user);
        //var_dump($password);
        
        if ( !$user )
        {
            $code = 404;
            $data = [
                        "status"    => "NOT-FOUND",
                    ];
        } 
        else 
        {
            $roles = [];
            $organizationList = [];
            $userOrganizations = UserAssignedOrganizations::findUserOrganizations($user->id);
            foreach($userOrganizations as $org) 
            {
                $userRoles = UserAssingnedRoles::findUserRoles($org->unit_organizations_id,$user->id);
                if(count($userRoles) > 0)
                {
                    foreach($userRoles as $role)
                    {
                        $r = UserRoles::findFirst($role->user_roles_id);
                        $roles[$org->unit_organizations_id][] = strtolower($r->name);
                        $organizationList[$org->unit_organizations_id] = UnitOrganizationHierarchy::findHierarchy($org->unit_organizations_id);
                    }
                }
            }
            
            /**
             * We regect the login if a user account is inactive
             * or if it isn't assigned to an organization
             * or if it isn't assigned to a role
             */
            
            if( $user->active == 0 || count($userOrganizations) == 0 || count($roles) == 0)
            {
                $code = 401;
                $data = [
                            "status"    => "UNAUTHORIZED",
                        ];
            } 
            else 
            {
                $auth = array(
                    'user'  => null,
                    'token' => md5($user->email . uniqid(gethostname(), TRUE))
                );
                
                $auth['user'] = $user->toArray();
                $auth['user']['password'] = "secret";
                $auth['user']['organizations'] = $roles;
                $auth['user']['currentorganization'] = $auth['user']['unit_organizations_id'];
                $auth['user']['organizationlist'] = $organizationList;
                $auth['user']['permissions'] = $this->findPermissions($auth['user']['id']);
                //print_r($auth);die;
                $date = (new \DateTime())->format("Y-m-d H:i:s");
                $user->last_login = $date;
                $user->last_operation = $date;
                $user->setUser($auth['user']);
                
                if( $user->update() == FALSE)
                {
                    $code = 500;
                    $data = [
                                "status"    => "INTERNAL-SERVER-ERROR",
                            ];                    
                } 
                else 
                {
                    $this->session->set('auth', $auth);
                    $code = 200;
                    $data = [
                                "status"    => "OK",
                            ];                    
                    $this->cookies->set(
                        "token",
                        $auth['token'],
                        0
                    );
                }
            }
        }
        
        
        $response->setStatusCode($code);
        $response->setJsonContent($data);
        
        return $response;        
        
    }

    public function logoutAction()
    {
        
        $this->cookies->set(
            "token",
            "",
            0
        );
        
        $this->session->destroy();
        $code = 200;
        $data = [
                    "status"    => "OK",
                ];
        
        $response = new Response();
        $response->setStatusCode($code);
        $response->setJsonContent($data);
        
        return $response;        
    }
    
    protected function findPermissions($userId)
    {
        $sql = "SELECT
            urp.unit_organizations_id,
            am.name as module, 
            ac.name as controller, 
            aa.name as action
            FROM
            user_assingned_roles uar
            INNER JOIN user_role_permissions urp ON (urp.unit_organizations_id = uar.unit_organizations_id AND urp.user_roles_id = uar.user_roles_id)
            INNER JOIN app_modules am ON (urp.app_modules_id = am.id)
            INNER JOIN app_controllers ac ON (urp.app_controllers_id = ac.id)
            INNER JOIN app_actions aa ON (urp.app_actions_id = aa.id)
            WHERE
            uar.user_users_id =2
            AND uar.active > 0
            AND uar.deleted = 0
            AND urp.active > 0
            AND urp.deleted = 0
            AND am.active > 0
            AND am.deleted = 0
            AND ac.active > 0
            AND ac.deleted = 0
            AND aa.active > 0
            AND aa.deleted = 0
            AND am.id=3
            AND aa.secured = 1";
        $query = $this->db->query($sql);
        $query->setFetchMode(\Phalcon\Db::FETCH_ASSOC);
        $res = $query->fetchAll();        
        
        $permissions = [];
        foreach($res as $row)
        {
            $permissions[$row['unit_organizations_id']][strtolower($row['module']) . "/" . strtolower($row['controller']) . "/" . strtolower($row['action'])] = TRUE;
        }
        
        return $permissions;
        
        
    }
    
}
