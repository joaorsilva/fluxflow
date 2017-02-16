<?php echo("<?php")?> 
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
 * Api <?php echo(str_replace("Controller","",$vars['controller_name']))?> controller routes
 */
$cdata = [
    'namespace'=>   "<?php echo( $vars['namespace']); ?>",
    'module'=>      "<?php echo($vars['args']['module']['value'])?>",
    'controller'=>  "<?php echo(substr(strtolower($vars['controller_name']), 0, strlen('controller')))?>"
];

$route = '/' . $cdata['module'] . '/' . $cdata['controller'];
