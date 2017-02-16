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

$router = $di->getRouter();
/**
 * Api Zhistunitorganizations controller routes
 */
$cdata = [
    'namespace'=>   "Fluxflow\Modules\Api\Controllers",
    'module'=>      "api",
    'controller'=>  "zhistunito"
];

$route = '/' . $cdata['module'] . '/' . $cdata['controller'];

$router->addGet(
    $route . '/:params',
    [
        'namespace'=>$cdata['namespace'],
        'module'=>$cdata['module'],
        'controller'=>$cdata['controller'],
        'action'=>'get',
        'params'=>1
    ]
);

$router->addGet(
    $route . '/([0-9]+)',
    [
        'namespace'=>$cdata['namespace'],
        'module'=>$cdata['module'],
        'controller'=>$cdata['controller'],
        'action'=>'get',
        'id'=>1
    ]
);


$router->addPost(
    $route,
    [
        'namespace'=>$cdata['namespace'],
        'module'=>$cdata['module'],
        'controller'=>$cdata['controller'],
        'action'=>'new'
    ]
);


$router->addPut(
    $route . '/([0-9]+)',
    [
        'namespace'=>$cdata['namespace'],
        'module'=>$cdata['module'],
        'controller'=>$cdata['controller'],
        'action'=>'update',
        'id'=>1
    ]
);



$router->addDelete(
    $route . '/([0-9]+)',
    [
        'namespace'=>$cdata['namespace'],
        'module'=>$cdata['module'],
        'controller'=>$cdata['controller'],
        'action'=>'delete',
        'id'=>1
    ]
);

$router->addOptions(
    $route . '/:params',
    [
        'namespace'=>$cdata['namespace'],
        'module'=>$cdata['module'],
        'controller'=>$cdata['controller'],
        'action'=>'index',
        'params'=>1
    ]
 );



