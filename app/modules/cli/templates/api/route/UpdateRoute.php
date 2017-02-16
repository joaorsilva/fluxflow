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


