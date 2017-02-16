<?php

use Phalcon\Loader;

$loader = new Loader();

/**
 * Register Namespaces
 */
$loader->registerNamespaces([
    'Fluxflow\Models' => APP_PATH . '/common/models/',
    'Fluxflow'        => APP_PATH . '/common/library/',
]);

/**
 * Register module classes
 */
$loader->registerClasses([
    'Fluxflow\Modules\Frontend\Module' => APP_PATH . '/modules/frontend/Module.php',
    'Fluxflow\Modules\Ff\Module'      => APP_PATH . '/modules/ff/Module.php',
    'Fluxflow\Modules\Cli\Module'      => APP_PATH . '/modules/cli/Module.php',
    'Fluxflow\Modules\Api\Module'      => APP_PATH . '/modules/api/Module.php',
]);

$loader->register();
