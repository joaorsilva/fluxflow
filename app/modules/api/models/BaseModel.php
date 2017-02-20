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

namespace Fluxflow\Modules\Api\Models;

use Fluxflow\Modules\Api\Library\ApiParamQuery;

class BaseModel extends \Phalcon\Mvc\Model
{
    /**
     *
     * @var array 
     */
    protected static $_user;
    
    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return UserUsers[]|UserUsers     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return UserUsers     */
    public static function findFirst($parameters = null, $relations = FALSE)
    {
        $row = parent::findFirst($parameters);
        
        if($row && $relations) {
            $row = static::findRelated($row);
        }
        return $row;
    }

    /**
     * Finds a group of rows based on a criteria
     * 
     * @param array $params
     * @return array
     */
    
    public static function findStructured( array $params, $relations = FALSE )
    {
        $queryParams = ApiParamQuery::prepareParams( $params );
        
        $countParams = array(
            'conditions'    => $queryParams['conditions'],
            'bind'          => $queryParams['bind']
        );
        
        $total_rows = parent::count( $countParams );
        
        $params['paging']['total_pages'] = ceil($total_rows / $params['paging']['page_size']);
        $params['result'] = parent::find( $queryParams );
        
        if(count($params['result']))
        {
            if($relations)
            {
                $temp = [];
                foreach($params['result'] as $row)
                {
                    $temp[] = static::findRelated($row);  
                }
                $params['result'] = $temp;
            }
            
        }
        
        return $params;
    }

    /**
     * Sets information about the user performing the operation
     * @param array $user
     * @return \Fluxflow\Modules\Api\Models\BaseModel
     */
    public static function setUser($user)
    {
        self::$_user = $user;
        return self;
    }
    
    public function beforeValidation()
    {
        $date = (new \DateTime())->format('Y-m-d H:i:s');
        
        if(!$this->id)
        {
            $this->created_by = self::$_user['id'];
            $this->created_date = $date;
        }
        $this->updated_by = self::$_user['id'];
        $this->updated_date = $date;
        return TRUE;
    }
    
    public function toArray()
    {
        $array = parent::toArray();
        $columnMap = $this->getModelsMetaData()->getColumnMap($this);
        $objectVars = get_object_vars($this);
        $diff = array_diff_key($objectVars, $columnMap);
        $manager = $this->getModelsManager();
        foreach($diff as $key => $value) {
            if($manager->isVisibleModelProperty($this, $key)) {
                $array += [$key => $value];
            }
        }
        
        return $array;
    }    
}
