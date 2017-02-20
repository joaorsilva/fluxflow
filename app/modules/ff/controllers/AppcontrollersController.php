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

use Phalcon\Http\Request as Request;

class AppcontrollersController extends ControllerBase
{
    public $titleSinglular = "Controller";
    public $titlePlural = "Controllers";
    
    public function indexAction()
    {
        $this->tag->h3 = $this->titlePlural;
        $this->tag->title = $this->tag->h3 . " | ";
        $this->tag->h2 = "List of " . $this->titlePlural;
    }
    
    public function viewAction()
    {
        $this->tag->h3 = "View " . $this->titleSinglular;
        $this->tag->title = $this->tag->h3 . " | ";
        $this->tag->h2 = $this->titleSinglular;
    }
    
    public function editAction()
    {
        $this->tag->h3 = "Edit " . $this->titleSinglular;
        $this->tag->title = $this->tag->h3 . " | ";
        $this->tag->h2 = $this->titleSinglular;
    }
}
