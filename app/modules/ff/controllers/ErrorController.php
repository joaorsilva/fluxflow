<?php
/*
 * Flux Flow
 * Copyright (C) 2017  Joao L. Ribeiro da Silva <joao.r.silva@gmail.com>
 * 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

namespace Fluxflow\Modules\Ff\Controllers;

use Phalcon\Http\Response;

class ErrorController extends ControllerBase
{
    public function initialize()
    {
        $this->view->area = "error";
        parent::initialize();
    }
    public function show404Action()
    {
    }
    
    public function show401Action()
    {
        
    }
    
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
