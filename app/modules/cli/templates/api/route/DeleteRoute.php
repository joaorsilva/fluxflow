
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
