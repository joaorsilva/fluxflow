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

class FluxSubjects extends \Phalcon\Mvc\Model
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
     * @var string 
     * @Column(type="string", length=64, nullable=false)
     */
    public $name;
    
    
    /**
     *
     * @var string 
     * @Column(type="string", length=45, nullable=false)
     */
    public $description_key;
    
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
        $this->hasMany('id', 'FluxFluxes', 'flux_subjects_id', ['alias' => 'FluxFluxes']);
        $this->hasMany('id', 'FluxStepFields', 'flux_subjects_id', ['alias' => 'FluxStepFields']);
        $this->hasMany('id', 'FluxSteps', 'flux_subjects_id', ['alias' => 'FluxSteps']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'flux_subjects';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return FluxSubjects[]|FluxSubjects     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return FluxSubjects     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

    /**
     * Finds a group of rows based on a criteria
     * 
     * @param array $params
     * @return array
     */
    public static function findStructured( array $params )
    {
        $queryParams = ApiParamQuery::prepareParams( $params );
        
        $countParams = array(
            'conditions'    => $queryParams['conditions'],
            'bind'          => $queryParams['bind']
        );
        
        $total_rows = parent::count( $countParams );
        
        $params['paging']['total_pages'] = ceil($total_rows / $params['paging']['page_size']);
        $params['result'] = parent::find( $queryParams );

        return $params;
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
            'name' => 'name',
            'description_key' => 'description_key',
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
