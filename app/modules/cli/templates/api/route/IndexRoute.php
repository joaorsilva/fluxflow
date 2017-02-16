
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

