<?php
namespace Fluxflow\Modules\Api\Controllers;

use Phalcon\Http\Response;
use Fluxflow\Modules\Api\Models\UserUsers;
use Fluxflow\Modules\Api\Models\UserAssignedOrganizations;
use Fluxflow\Modules\Api\Models\UserAssingnedRoles;
use Fluxflow\Modules\Api\Models\UserRoles;

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
                        $organizationList[$org->unit_organizations_id] = array();
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
                //print_r($auth);die;
                $date = (new \DateTime())->format("Y-m-d H:i:s");
                $user->last_login = $date;
                $user->last_operation = $date;
                
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
    
}
