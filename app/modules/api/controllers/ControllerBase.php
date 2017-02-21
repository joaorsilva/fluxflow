<?php
namespace Fluxflow\Modules\Api\Controllers;

use Phalcon\Mvc\Controller;
use Phalcon\Http\Request as Request;
use Phalcon\Http\Response;

class ControllerBase extends Controller
{
    /**
     * @var integer Default return list page size 
     */
    const DEFAULT_PAGE_SIZE = 10;
    
    /**
     * @var integer Max rows per page 
     */
    const MAX_PAGE_SIZE = 100;
    
    /**
     * @var array Possible filter operator 
     */
    private $operators = array(
        '='         => 'equal',
        '!='        => 'not equal',
        '>'         => 'bigger than',
        '<'         => 'smaller than',
        '>='        => 'bigger or equal to',
        '<='        => 'smaller or equal to',
        'like'      => 'like',
        'in'        => 'in',
        'not in'    => 'not in',
        'between'   => 'between'
    );

    /**
     * @var array Paging data 
     */
    private $paging = array(
        'page'          => 0,
        'page_size'     => ControllerBase::DEFAULT_PAGE_SIZE,
        'total_pages'   => 0
    );
    
    /**
     * @var array Data filter array 
     */
    private $filter = array(
        'deleted'       => array(
            'operator'  => '=',
            'value'     => 0
        )
    );

    /**
     * @var array Data sort array 
     */
    private $order = array(
        'id'         => 'ASC',
    );
    
    /**
     * @var array Data setting array. Contains all other data related arrays 
     */
    private $settings = array();
    
    /**
     * @var string Controller class name calling the ControllerBase 
     */
    private $className = "";
    
    private $userId = 0;
    /**
     * Initializes the base controller with the default data
     * 
     * @param string $className Child class name (controller).
     * @return 
     */
    public function initialize( string $className = "" )
    {
        if( !$className )
        {
            return;
        }
        $this->className = $className;
        $this->settings = array(
            'paging'    => $this->paging,
            'filter'    => $this->filter,
            'order'     => $this->order
        );
        //$this->session->destroy();die;
        if ( $this->session->has( $className ) ) {
            $this->settings = $this->session->get( $className );
        } else {
            $this->session->set( $className, $this->settings );
        }
        
        $this->userId = 1;
    }
    
    /**
     * Parses the request information and sanitises the request data. 
     * @param Phalcon\Http\Request $request The request object
     * @param \Phalcon\Mvc\Model $model The model
     * @return type 
     */
    public function parseSettings( Request $request, $model ) 
    {
        $val = $request->getQuery( 'paging' );

        if(isset($val['page']))
        {    
            $this->settings['paging']['page'] = (int)$val['page'];
        }
        
        if(isset($val['page_size']))
        {   
            if( $val['page_size'] > ControllerBase::MAX_PAGE_SIZE )
            {
                $val['page_size'] = ControllerBase::MAX_PAGE_SIZE;
            }
            $this->settings['paging']['page_size'] = (int)$val['page_size'];
        }
        
        $val = $request->getQuery( 'filter');
        if( !is_null( $val ) && is_array( $val ) )
        {
            $this->settings['filter'] = $this->validateFieldArray( $val , "Fluxflow\\Modules\\Api\\Models\\" . $model );
        }
        
        $val = $request->getQuery('order');
        if( !is_null( $val ) && is_array( $val ) )
        {
            $this->settings['order'] = $this->validateFieldArray( $val , "Fluxflow\\Modules\\Api\\Models\\" . $model );
        }
        
        $this->session->set( $this->className, $this->settings );
        
        //var_dump($this->settings);die;
        
        return $this->settings;
    }
    
    /**
     * Validates the filter and order array returning an array containing only
     * valid data.
     * 
     * @param array $fieldArray filter or order array.
     * @param Model $model The model
     * @return array filter or order array.
     * @throws Exception if model does not implement a valid columnMap() method
     */
    public function validateFieldArray( array $fieldArray , $model ) 
    {
        try 
        {
            $columnMap = $model::columnMap();
        }
        catch ( Exception $e ) 
        {
            $columnMap = NULL;
        }

        if( !$columnMap )
        {
            throw new Exception('Model ' . get_class($model) . ' does not implement a columnMap() method!');
        }
        
        $newArray = array();
        foreach( $fieldArray as $key => $value ) 
        {    
            if( array_search( $key , $columnMap ) ) 
            {
                
                if( !$value )
                    continue;
                
                if( is_array( $value ) )
                {
                    if( array_key_exists( 'v' , $value ) && array_key_exists( 'o' , $value ) ) 
                    {
                        if( !$this->validateFilterOperator( $value ) )
                        {
                            continue;
                        }
                    }
                } 
                else if( is_string ( $value ) ) 
                {
                    if( strtolower( $value ) == 'asc' || strtolower( $value ) == 'desc' )
                    {
                        $newArray[$key] = $value;
                        continue;
                    }
                }
                
                $newArray[$key] = $value;
            }
        }
        
        return $newArray;
    }
    
    /**
     * Validates the filter field operand
     * @param array $value filter field array
     * @return boolean TRUE if the operand exists and it's valid FALSE otherwise.
     */
    public function validateFilterOperator( array $value )
    {
        if( array_key_exists('o',  $value ) && array_key_exists( $value['o'] , $this->operators ) )
        {
            return TRUE;
        }
        
        return FALSE;
    }        
    
    public function validateParams( array $params, array $validParams )
    {
        if( !$params )
        {
            return TRUE;
        }
        
        if(array_key_exists('_url', $params))
        {
            $paramKeys = array_keys($params);
        } else {
            $paramKeys = $params;
        }
        
        foreach($paramKeys as $key)
        {
            if( array_search( $key , $validParams ) === FALSE)
            {
                return FALSE;
            }
        }
        
        return TRUE;
    }
    
    public function sendResponse($statusCode=200, $data=array())
    {
        $statusText = "";
        
        switch($statusCode)
        {
            case 200:
                $statusText = "OK";
                break;
            case 201;
                $statusText = "CREATED";
                break;
            case 400:
                $statusText = "BAD-REQUEST";
                break;
            case 404:
                $statusText = "NOT-FOUND";
                break;
            case 500:
                $statusText = "INTERNAL-SERVER-ERROR";
                break;
        }
        
        $temp_data = array_merge(array("status"=>$statusText), $data);
        
        $response = new Response();
        $response->setStatusCode($statusCode);
        $response->setJsonContent($temp_data);
        
        return $response;
    }
    
    public function getSettings()
    {
        return $this->settings;
    }
}
