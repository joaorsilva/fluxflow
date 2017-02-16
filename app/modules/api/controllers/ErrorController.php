<?php
namespace Fluxflow\Modules\Api\Controllers;

use Phalcon\Http\Response;

class ErrorController extends ControllerBase 
{
    public function showjson404Action()
    {
        $response = new Response();
        $response->setStatusCode(404);
        $data = [
            'status'    => 'NOT-FOUND',
        ];
        $response->setJsonContent($data);
        return $response;        
    }

    public function showjson401Action()
    {
        $response = new Response();
        $response->setStatusCode(401);
        $data = [
            'status'    => 'UNAUTHORIZED',
        ];
        $response->setJsonContent($data);
        return $response;        
    }
    
    public function showjson401tokenAction()
    {
        $response = new Response();
        $response->setStatusCode(401);
        $data = [
            'status'    => 'UNAUTHORIZED-TOKEN',
        ];
        $response->setJsonContent($data);
        return $response;        
    }
}
