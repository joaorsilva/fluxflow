<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace Fluxflow\Modules\Api\Library\Validator;

use Phalcon\Validation\Message;
use Phalcon\Mvc\Model;
class UniqueValidator
{   
    
    public function validate(Model $model, $uniqueFields)
    {
        //var_dump($attribute);
        var_dump($model);
        die;
    }
}
