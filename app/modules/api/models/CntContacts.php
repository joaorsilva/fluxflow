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

class CntContacts extends BaseModel
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
     * @Column(type="integer", length=10, nullable=true)
     */
    public $user_users_id;
        
    /**
     *
     * @var string 
     * @Column(type="string", length=128, nullable=true)
     */
    public $company_name;
    
    
    /**
     *
     * @var string 
     * @Column(type="string", length=45, nullable=false)
     */
    public $name;
    
    
    /**
     *
     * @var string 
     * @Column(type="string", length=128, nullable=false)
     */
    public $surename;
    
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
        $this->setSource('cnt_contacts');
        
        $this->belongsTo('unit_organizations_id', '\UnitOrganizations', 'id', ['alias' => 'UnitOrganizations']);
        $this->belongsTo('user_users_id', '\UserUsers', 'id', ['alias' => 'UserUsers']);
        $this->hasMany('id', 'CntAddresses', 'cnt_contacts_id', ['alias' => 'CntAddresses']);
        $this->hasMany('id', 'CntEmails', 'cnt_contacts_id', ['alias' => 'CntEmails']);
        $this->hasMany('id', 'CntPhones', 'cnt_contacts_id', ['alias' => 'CntPhones']);
        $this->hasMany('id', 'FluxMessages', 'destination_id', ['alias' => 'FluxMessages']);
        $this->hasMany('id', 'UnitOrganizations', 'cnt_contacts_id', ['alias' => 'UnitOrganizations']);
    }

    public function getSource()
    {
        return 'cnt_contacts';
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
            'user_users_id' => 'user_users_id',
            'company_name' => 'company_name',
            'name' => 'name',
            'surename' => 'surename',
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
    
    public function findRelated($row)
    {
        if($row->unit_organizations_id) 
        {
            $row->unit_organizations_id = UnitOrganizations::findFirst($row->unit_organizations_id);
            
            $row->cnt_addresses = NULL;
            $addresses = CntAddresses::findFirst(
                    [
                        "conditions" => "unit_organizations_id = ?1 AND cnt_contacts_id = ?2 AND primary > ?3",
                        "bind" => [
                            1   => $row->unit_organizations_id->id,
                            2   => $row->id,
                            3   => 0
                        ]
                    ],TRUE
                    );
            if( count($addresses) )
            {
                $row->cnt_addresses = $addresses;
            }
            
            $row->cnt_phones = NULL;
            $phones = CntPhones::findFirst(
                    [
                        "conditions" => "unit_organizations_id = ?1 AND cnt_contacts_id = ?2 AND primary > ?3",
                        "bind" => [
                            1   => $row->unit_organizations_id->id,
                            2   => $row->id,
                            3   => 0
                        ]
                    ]
                    );
            if( count($phones) )
            {
                $row->cnt_phones = $phones;
            }
            
            $row->cnt_emails = NULL;
            $emails = CntEmails::findFirst(
                    [
                        "conditions" => "unit_organizations_id = ?1 AND cnt_contacts_id = ?2 AND primary > ?3",
                        "bind" => [
                            1   => $row->unit_organizations_id->id,
                            2   => $row->id,
                            3   => 0
                        ]
                    ]
                    );
            if( count($emails) )
            {
                $row->cnt_emails = $emails;
            }
            
        }
        return $row;
    }    
}
