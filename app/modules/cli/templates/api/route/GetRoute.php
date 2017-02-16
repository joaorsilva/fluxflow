
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


