<?php
$router = $di->getRouter();
/**
 * Api Login controller routes
 */
$router->addPost(
    '/api/login',
    [
        'namespace'=>"Fluxflow\\Modules\\Api\\Controllers",
        'module'=>'api',
        'controller'=>'login',
        'action'=>'login'
    ]
);

$router->addPost(
    '/api/logout',
    [
        'namespace'=>"Fluxflow\\Modules\\Api\\Controllers",
        'module'=>'api',
        'controller'=>'login',
        'action'=>'logout'
    ]
);

