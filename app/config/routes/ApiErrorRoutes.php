<?php
$router = $di->getRouter();
/**
 * Api error controller routes
 */

$cdata = [
    'namespace'=>   "Fluxflow\\Modules\\Api\\Controllers",
    'module'=>      "api",
    'controller'=>  "error"
];

$route = '/' . $cdata['module'] . '/' . $cdata['controller'] . '/';

$router->add(
    $route . 'showjson401',
        [
            'namespace'=>$cdata['namespace'],
            'module'=>$cdata['module'],
            'controller'=>$cdata['controller'],
            'action'=>'showjson401'
        ]        
);

$router->add(
    $route . 'showJson404',
        [
            'namespace'=>$namespace,
            'module'=>$module,
            'controller'=>$controller,
            'action'=>'showjson404'
        ]        
);

