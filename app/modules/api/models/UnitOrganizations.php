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

class UnitOrganizations extends \Phalcon\Mvc\Model
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
     * @Column(type="integer", length=10, nullable=true)
     */
    public $parent_id;
    
    
    /**
     *
     * @var integer 
     * @Column(type="integer", length=10, nullable=false)
     */
    public $unit_organization_types_id;
    
    
    /**
     *
     * @var integer 
     * @Column(type="integer", length=10, nullable=true)
     */
    public $cnt_contacts_id;
    
    
    /**
     *
     * @var string 
     * @Column(type="string", length=128, nullable=false)
     */
    public $name;
    
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
        $this->belongsTo('cnt_contacts_id', '\CntContacts', 'id', ['alias' => 'CntContacts']);
        $this->belongsTo('parent_id', '\UnitOrganizations', 'id', ['alias' => 'UnitOrganizations']);
        $this->belongsTo('unit_organization_types_id', '\UnitOrganizationTypes', 'id', ['alias' => 'UnitOrganizationTypes']);
        $this->hasMany('id', 'CntAddresses', 'unit_organizations_id', ['alias' => 'CntAddresses']);
        $this->hasMany('id', 'CntContactTypes', 'unit_organizations_id', ['alias' => 'CntContactTypes']);
        $this->hasMany('id', 'CntContacts', 'unit_organizations_id', ['alias' => 'CntContacts']);
        $this->hasMany('id', 'CntEmails', 'unit_organizations_id', ['alias' => 'CntEmails']);
        $this->hasMany('id', 'CntPhones', 'unit_organizations_id', ['alias' => 'CntPhones']);
        $this->hasMany('id', 'FluxBoards', 'unit_organizations_id', ['alias' => 'FluxBoards']);
        $this->hasMany('id', 'FluxEventTypes', 'unit_organizations_id', ['alias' => 'FluxEventTypes']);
        $this->hasMany('id', 'FluxFieldTypes', 'unit_organizations_id', ['alias' => 'FluxFieldTypes']);
        $this->hasMany('id', 'FluxFlows', 'unit_organizations_id', ['alias' => 'FluxFlows']);
        $this->hasMany('id', 'FluxFluxes', 'unit_organizations_id', ['alias' => 'FluxFluxes']);
        $this->hasMany('id', 'FluxMessages', 'unit_organizations_id', ['alias' => 'FluxMessages']);
        $this->hasMany('id', 'FluxOrigins', 'unit_organizations_id', ['alias' => 'FluxOrigins']);
        $this->hasMany('id', 'FluxPriorities', 'unit_organizations_id', ['alias' => 'FluxPriorities']);
        $this->hasMany('id', 'FluxStatus', 'unit_organizations_id', ['alias' => 'FluxStatus']);
        $this->hasMany('id', 'FluxStepFields', 'unit_organizations_id', ['alias' => 'FluxStepFields']);
        $this->hasMany('id', 'FluxSteps', 'unit_organizations_id', ['alias' => 'FluxSteps']);
        $this->hasMany('id', 'FluxSubjects', 'unit_organizations_id', ['alias' => 'FluxSubjects']);
        $this->hasMany('id', 'UnitOrganizationHierarchy', 'unit_organizations_id', ['alias' => 'UnitOrganizationHierarchy']);
        $this->hasMany('id', 'UnitOrganizations', 'parent_id', ['alias' => 'UnitOrganizations']);
        $this->hasMany('id', 'UserAssignedOrganizations', 'unit_organizations_id', ['alias' => 'UserAssignedOrganizations']);
        $this->hasMany('id', 'UserAssingnedRoles', 'unit_organizations_id', ['alias' => 'UserAssingnedRoles']);
        $this->hasMany('id', 'UserRoles', 'unit_organizations_id', ['alias' => 'UserRoles']);
        $this->hasMany('id', 'UserUsers', 'unit_organizations_id', ['alias' => 'UserUsers']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'unit_organizations';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return UnitOrganizations[]|UnitOrganizations     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return UnitOrganizations     */
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
            'parent_id' => 'parent_id',
            'unit_organization_types_id' => 'unit_organization_types_id',
            'cnt_contacts_id' => 'cnt_contacts_id',
            'name' => 'name',
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
