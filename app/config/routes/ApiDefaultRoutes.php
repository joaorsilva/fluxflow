<?php
/**
 * Routes default configuration
 */
$router = $di->getRouter();

$router->setDefaultModule("frontend");
$router->setDefaultNamespace("Fluxflow\\Modules\\Frontend\\Controllers");
$router->setDefaultController("index");
$router->setDefaultAction("index");
$router->removeExtraSlashes(TRUE);
$router->setDefaults(
    [
        "controller" => "index",
        "action"     => "index",
    ]
);


