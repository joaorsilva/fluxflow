<?php
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

namespace Fluxflow\Modules\Ff\Controllers;

class UserusersController extends ControllerBase {

    public function initialize()
    {
        parent::initialize();
    }
    
    public function viewAction($id)
    {
        $this->tag->title = "User Profile | Flux Flow";
        $this->view->css = [
            "/vendors/bootstrap-daterangepicker/daterangepicker.css"
        ];
        $this->view->js = [
            "/vendors/raphael/raphael.min.js",
            "/vendors/morris.js/morris.min.js",
            "/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js",
            "/vendors/moment/min/moment.min.js",
            "/vendors/bootstrap-daterangepicker/daterangepicker.js",
            "/build/js/custom.min.js",
            "/js/modules/ff/userusers/view.js"
        ];
        $this->view->params = [
            'userId'  => $this->user['id'],
            'resourceId' => $id
        ];
    }
    
}
