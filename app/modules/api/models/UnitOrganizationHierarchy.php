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
use Fluxflow\Modules\Api\Models\BaseModel;

class UnitOrganizationHierarchy extends BaseModel
{
    /**
     *
     * @var integer
     * @Primary
     * @Identity
     * @Column(type="integer", length=10, nullable=false)
     */
    public $id;

    
    /**
     *
     * @var integer 
     * @Column(type="integer", length=10, nullable=false)
     */
    public $unit_organizations_id;
    
    
    /**
     *
     * @var integer 
     * @Column(type="integer", length=10, nullable=false)
     */
    public $unit_parent_child_id;
    
    
    /**
     *
     * @var integer 
     * @Column(type="integer", length=1, nullable=false)
     */
    public $direction;
    
    /**
     *
     * @var integer
     * @Column(type="integer", length=1, nullable=false)
     */
    public $active;

    /**
     *
     * @var integer
     * @Column(type="integer", length=10, nullable=false)
     */
    public $created_by;

    /**
     *
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $created_date;

    /**
     *
     * @var integer
     * @Column(type="integer", length=10, nullable=false)
     */
    public $updated_by;

    /**
     *
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $updated_date;

    /**
     *
     * @var integer
     * @Column(type="integer", length=10, nullable=true)
     */
    public $deleted_by;

    /**
     *
     * @var string
     * @Column(type="string", nullable=true)
     */
    public $deleted_date;

    /**
     *
     * @var integer
     * @Column(type="integer", length=1, nullable=false)
     */
    public $deleted;
    
    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("fluxflow");
        $this->belongsTo('unit_organizations_id', '\UnitOrganizations', 'id', ['alias' => 'UnitOrganizations']);
    }

    public function getSource()
    {
        return 'unit_organization_hierarchy';
    }

    public static function findHierarchy($unit_organizations_id)
    {
        $res = [
            "top"   => null,
            "higher"    => [],
            "lower"     => []
        ];
        
        $result = self::findFirst(
                [
                    "conditions"    => "unit_organizations_id = ?1 AND unit_parent_child_id = ?2",
                    "bind"  => [
                        1   => $unit_organizations_id,
                        2   => 1
                    ]
                ]
                );
        if(!$result)
            return FALSE;
        
        $res['top'] = $result->id;
        $others = self::find(
                [
                    "conditions"    => "unit_organizations_id = ?1 AND deleted = ?2",
                    "bind"  => [
                        1   => $unit_organizations_id,
                        2   => 0
                    ]
                ]
                );
        
        foreach($others as $org)
        {
            if($org->direction == 0)
            {
                $res['higher'][] = $org->unit_parent_child_id;
                continue;
            }
            $res['lower'][] = $org->unit_parent_child_id;
        }
        
        return $res;
        
    }

    /**
     * Independent Column Mapping.
     * Keys are the real names in the table and the values their names in the application
     *
     * @return array
     */
    public function columnMap()
    {
        return [
            'id' => 'id',
            'unit_organizations_id' => 'unit_organizations_id',
            'unit_parent_child_id' => 'unit_parent_child_id',
            'direction' => 'direction',
            'active' => 'active',
            'created_by' => 'created_by',
            'created_date' => 'created_date',
            'updated_by' => 'updated_by',
            'updated_date' => 'updated_date',
            'deleted_by' => 'deleted_by',
            'deleted_date' => 'deleted_date',
            'deleted' => 'deleted'
        ];
    }
}
