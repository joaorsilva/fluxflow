<?php
$router = $di->getRouter();

/**
 * ------------------------------------------------------
 * Routes loader
 * ------------------------------------------------------
 */

$routeFiles = array();
//TODO: Add persistency for performance gain.
if ($handle = opendir(__DIR__ . "/routes/")) {

    while (false !== ($entry = readdir($handle))) {

        if ($entry != "." && $entry != "..") {

            $routeFiles[] = $entry;
        }
    }

    closedir($handle);
}

foreach($routeFiles as $routeFile)
{
    $routeFilePath = __DIR__ . "/routes/" . $routeFile;
    if( !file_exists($routeFilePath) )
    {
        throw new \Exception("Route file loader: Route file '" . $routeFilePath . "' not found!");
    }
    require_once $routeFilePath;
}

/**
 * Login routes
 */
$router->addPost(
    "/api/login",
    [
        "namespace"     => "Fluxflow\Modules\Api\Controllers",
        "module"        => "api",
        "controller"    => "login",
        "action"        => "login"
    ]
);

$router->addPost(
    "/api/login/index",
    [
        "namespace"     => "Fluxflow\Modules\Api\Controllers",
        "module"        => "api",
        "controller"    => "login",
        "action"        => "login"
    ]
);

$router->addGet(
    "/api/login/logout",
    [
        "namespace"     => "Fluxflow\Modules\Api\Controllers",
        "module"        => "api",
        "controller"    => "login",
        "action"        => "logout"
    ]
);

/**
 * Ff routes
 */

$router->add(
    "/ff/:params",
    [
        "namespace"     => "Fluxflow\Modules\Ff\Controllers",
        "module"        => "ff",
        "controller"    => "index",
        "action"        => "index",
        "params"        => 1,
    ]
);

$router->add(
    "/ff/:controller/:params",
    [
        "namespace"     => "Fluxflow\Modules\Ff\Controllers",
        "module"        => "ff",
        "controller"    => 1,
        "action"        => "index",
        "params"        => 2,
    ]
);

$router->add(
    "/ff/:controller/edit/([0-9]+)",
    [
        "namespace"     => "Fluxflow\Modules\Ff\Controllers",
        "module"        => "ff",
        "controller"    => 1,
        "action"        => "edit",
        "id"            => 2,
    ]
);

$router->add(
    "/ff/:controller/view/([0-9]+)",
    [
        "namespace"     => "Fluxflow\Modules\Ff\Controllers",
        "module"        => "ff",
        "controller"    => 1,
        "action"        => "view",
        "id"            => 2,
    ]
);

$router->add(
    "/ff/:controller/:action/:params",
    [
        "namespace"     => "Fluxflow\Modules\Ff\Controllers",
        "module"        => "ff",
        "controller"    => 1,
        "action"        => 2,
        "params"        => 3,
    ]
);
