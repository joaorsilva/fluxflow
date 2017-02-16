<?php 
echo("<?php");
?> 
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

<?php
if( !function_exists('camelize')) 
{
    function camelize($str)
    {
        $temp = ucwords($str," -_");
        return str_replace(array(" ","-","_"), "", $temp);
    }
}
?> 
namespace <?php echo($vars['namespace'])?>;

use Fluxflow\Modules\Api\Library\ApiParamQuery;

class <?php echo($vars['model_name'])?> extends \Phalcon\Mvc\Model
{
    /**
     *
     * @var integer
     * @Primary
     * @Identity
     * @Column(type="integer", length=10, nullable=false)
     */
    public $id;

<?php foreach($vars['all_fields'] as $field) {?>
<?php
        switch(strtolower($field['type']))
        {
            case "char":
            case "varchar":
            case "nvarchar":
            case "json":
            case "text":
            case "mediumtext":
            case "longtext":
            case "tinytext":
            case "date":
            case "datetime":
            case "timestamp":
                $type = "string";
                break;
            case "int":
            case "mediumint":
            case "smallint":
            case "bigint":
            case "tinyint":
                $type = "integer";
                break;
            case "real":
            case "double":
            case "decimal":
                $type = "float";
                break;
        }
        
        $size = trim(str_replace("unsigned","",strtolower($field['size'])));
?>
    
    /**
     *
     * @var <?php echo($type)?> 
     * @Column(type="<?php echo($type)?>", length=<?php echo($size)?>, nullable=<?php if($field['nullable']) { echo("true"); } else { echo("false"); }?>)
     */
    public $<?php echo($field['field_name'])?>;
    
<?php } ?>
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
<?php
    foreach($vars['foreign_keys']['references'] as $key=>$value) {
?>
        $this->belongsTo('<?php echo($value)?>', '\<?php echo(camelize($key))?>', 'id', ['alias' => '<?php echo(camelize($key))?>']);
<?php        
    }
    foreach($vars['foreign_keys']['referenced_by'] as $key=>$value) {
?>
        $this->hasMany('id', '<?php echo(camelize($key))?>', '<?php echo($value)?>', ['alias' => '<?php echo(camelize($key))?>']);
<?php        
    }
?>
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return '<?php echo($vars['table_name'])?>';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return <?php echo($vars['model_name'])?>[]|<?php echo($vars['model_name'])?>
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return <?php echo($vars['model_name'])?>
     */
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
<?php foreach($vars['all_fields'] as $field) {?>
            '<?php echo($field['field_name'])?>' => '<?php echo($field['field_name'])?>',
<?php } ?>
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
<?php


