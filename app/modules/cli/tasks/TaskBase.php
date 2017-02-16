<?php
namespace Fluxflow\Modules\Cli\Tasks;

use Phalcon\Cli\Task;

require_once __DIR__ . '/../classes/errorHandler.php';

class TaskBase extends Task 
{
    /**
     * Mesage types
     */
    const MSG_DEFAULT   = 0;
    const MSG_INFO      = 1;
    const MSG_SUCCESS   = 2;
    const MSG_WARN      = 3;
    const MSG_ERROR     = 4;
    const MSG_DEBUG     = 5;
    
    /**
     * Message colors
     * @var array 
     */
    public $msgColors = [
        TaskBase::MSG_DEFAULT   => "\033[0m",
        TaskBase::MSG_INFO      => "\033[1;34m",
        TaskBase::MSG_SUCCESS   => "\033[1;32m",
        TaskBase::MSG_WARN      => "\033[1;33m",
        TaskBase::MSG_ERROR     => "\033[1;31m",
        TaskBase::MSG_DEBUG     => "\033[1;35m"
    ];
    
    /**
     * Message text
     * @var array 
     */
    public $msgTypes = [
        TaskBase::MSG_DEFAULT   => "",
        TaskBase::MSG_INFO      => "[ INFO  ]",
        TaskBase::MSG_SUCCESS   => "[SUCCESS]",
        TaskBase::MSG_WARN      => "[WARNING]",
        TaskBase::MSG_ERROR     => "[ ERROR ]",
        TaskBase::MSG_DEBUG     => "[ DEBUG ]"
    ];
    
    /**
     * Possible parameters
     * @var array 
     */
    public $params = [
        'module'            => [
            'description'   => "Module name.",
            'required'      => TRUE,
            'value'         => FALSE,
            'parameter'     => TRUE
            ],
        'api'               => [
            'description'   => "RestAPI methods interface.",
            'required'      => FALSE,
            'value'         => FALSE,
            'parameter'     => FALSE
            ],
        'table'             => [
            'description'   => "Table to be process.",
            'required'      => TRUE,
            'value'         => FALSE,
            'parameter'     => TRUE
            ],
        'all-tables'             => [
            'description'   => "Process all tables.",
            'required'      => FALSE,
            'value'         => FALSE,
            'parameter'     => FALSE
            ],
        'actions'           => [
            'description'   => "Actions to generate (coma separated).",
            'required'      => TRUE,
            'value'         => FALSE,
            'parameter'     => TRUE,
            'isarray'       => TRUE
            ],
        'extends'           => [
            'description'   => "Controller extends from.",
            'required'      => FALSE,
            'value'         => FALSE,
            'parameter'     => TRUE,
            'isarray'       => FALSE
            ],
        'force'             => [
            'description'   => "Atomatically replace file(s) if it exists.",
            'required'      => FALSE,
            'value'         => FALSE,
            'parameter'     => FALSE
            ],
        'help'              => [
            'description'   => "Displays help information.",
            'required'      => FALSE,
            'value'         => FALSE,
            'parameter'     => FALSE
            ], 
        'controllers'       => [
            'description'   => "Generates controller file (only to all).",
            'required'      => FALSE,
            'value'         => FALSE,
            'parameter'     => FALSE
            ],
        'routes'            => [
            'description'   => "Generates route files (only to all).",
            'required'      => FALSE,
            'value'         => FALSE,
            'parameter'     => FALSE
            ],
        'models'            => [
            'description'   => "Generates model files (only to all).",
            'required'      => FALSE,
            'value'         => FALSE,
            'parameter'     => FALSE
            ],
        'controller-path'   => [
            'description'   => "Controller's directory name (Default: app/modules/[module]/controllers)",
            'required'      => FALSE,
            'value'         => FALSE,
            'parameter'     => TRUE
            ],
        'route-path'        => [
            'description'   => "Controller's directory name (Default: app/config/routes",
            'required'      => FALSE,
            'value'         => FALSE,
            'parameter'     => TRUE
            ],
        'model-path'        => [
            'description'   => "Controller's directory name (Default: app/modules/[module]/models",
            'required'      => FALSE,
            'value'         => FALSE,
            'parameter'     => TRUE
            ],
        'test'            => [
            'description'   => "Test if everything is corrent (Don't create any files).",
            'required'      => FALSE,
            'value'         => FALSE,
            'parameter'     => FALSE
            ],
        'verbose'            => [
            'description'   => "Generate more (information) output.",
            'required'      => FALSE,
            'value'         => FALSE,
            'parameter'     => FALSE
            ],
        'debug'            => [
            'description'   => "Generate debug information output.",
            'required'      => FALSE,
            'value'         => FALSE,
            'parameter'     => FALSE
            ],
        'noheader'            => [
            'description'   => "Don't print header to screen.",
            'required'      => FALSE,
            'value'         => FALSE,
            'parameter'     => FALSE
            ],
    ];
    
    /**
     * Meta fields (present on all tables)
     * @var array 
     */
    public $methaFields = [
        'id',
        'active',
        'created_by',
        'created_date',
        'updated_by',
        'updated_date',
        'deleted_by',
        'deleted_date',
        'deleted'
    ];
    
    /**
     * Name of the running task
     * @var string
     */
    public $taskName = "";
    
    /**
     * Phalcon database connection
     * @var object
     */
    public $connection;
    
    /**
     * Base template location
     * @var object
     */
    public $templateDirectory = __DIR__ . "/../templates/[module]";
    
    /**
     * Header already printed?
     * @var boolean
     */
    public $headerPrinted = FALSE;
    
    /**
     * Initializes the class
     */
    public function initialize()
    {
        $di = self::getDI();
        $this->connection = $di->get('db');
    }

    /**
     * Parse the command line parameters
     * @param array $params
     * @return boolean
     */
    public function parseParams(array $params=array())
    {
        $this->printHeader();
        if( !$params )
            return FALSE;
        
        if( array_search('--help', $params) )
            $this->help();
        
        $tempParams = $this->params;
        
        foreach($params as $param) 
        {
            $temp = explode("=", $param);
            $temp[0] = trim($temp[0]);
            $paramName = str_replace("--", "", $temp[0]);
            
            if( array_key_exists($paramName, $tempParams) === FALSE)
                continue;
            
            $numParams = count($temp);
            if($numParams == 1)
            {
                $tempParams[$paramName]['value'] = TRUE;
            } 
            else if ( $numParams == 2) 
            {
                if(
                     isset($tempParams[$paramName]['isarray'])
                     && $tempParams[$paramName]['isarray']
                )
                {
                    $tempParams[$paramName]['value'] = explode(",", $temp[1]);
                } 
                else 
                {
                    $paramValue = trim($temp[1]);
                    $tempParams[$paramName]['value'] = $paramValue;
                }
            }
        }
        
        $missing = $this->missingMandatory($tempParams);
        if( $missing )
        {
            $message = "Mandatory param " . $missing . " not defined!";
            $this->printMessage(TaskBase::MSG_ERROR, $message);
            exit(1);
        }
        
        $this->params = $tempParams;
        
        return TRUE;
    }

    /**
     * Check which mandatory field is missing 
     * @param array $params
     * @return mixed
     */
    protected function missingMandatory( array $params )
    {
        foreach($this->params as $key=>$param)
        {
            if( 
                ! isset($params[$key]) 
                || ( $params[$key]['required']
                     && !$params[$key]['value'] 
                )
            )
            {
                if($this->taskName == "Model" &&  $key == "actions")
                    continue;
                if($this->taskName == "All" && $key == "table" && $params['all-tables']['value'])
                    continue;
                /*if($key == "table") {
                    var_dump($this->taskName);
                    var_dump($key);
                    var_dump($this->params['all-tables']);
                    die;
                }*/
                return $key;                
            }
                
        }
        return FALSE;
    }
    
    /**
     * Gets the table structure from the database
     * @return array
     */
    public function getTableStructure()
    {
        $sql = "DESCRIBE " . $this->params['table']['value'];
        $result = $this->connection->query($sql);
        $result->setFetchMode(\Phalcon\Db::FETCH_ASSOC);
        $rows = $result->fetchALl();
        
        $newRows = array();
        
        foreach($rows as $row)
        {
            if(array_search($row['Field'], $this->methaFields) !== FALSE)
                continue;
            $newRow = array();
            $newRow['field_name'] = $row['Field'];
            $temp = explode('(',$row['Type']);
            $newRow['type'] = $temp[0];
            $newRow['size'] = "";
            if(isset($temp[1]) && $temp[1])
            {
                $newRow['size'] = str_replace(')', "", $temp[1]);
            }
            $newRow['nullable'] = false;
            if($row['Null'] == "YES")
            {
                $newRow['nullable'] = true;
            }
            $newRows[]=$newRow;
        }
        
        return $newRows;
    }
    
    public function getTableKeys()
    {
        $sql = "SHOW KEYS FROM " . $this->params['table']['value'];
        $result = $this->connection->query($sql);
        $result->setFetchMode(\Phalcon\Db::FETCH_ASSOC);
        $rows = $result->fetchALl();
        $newRows = array();
        
        foreach($rows as $row)
        {
            $val= FALSE;
            if($row['Non_unique'] == 0)
                $val = TRUE;
            $newRows[$row['Column_name']][] = $val;
        }
        return $newRows;
    }
    
    public function getForeignKeys()
    {
        $descriptor = $this->connection->getDescriptor();
        
        $final = [
            'references'    => [],
            'referenced_by' => [],
        ];
    
        $sql = "SELECT " . 
               "TABLE_NAME, COLUMN_NAME, REFERENCED_TABLE_NAME, REFERENCED_COLUMN_NAME FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE " .
               "WHERE " . 
                "REFERENCED_TABLE_SCHEMA IS NOT NULL " .
                "AND TABLE_SCHEMA='" . $descriptor['dbname'] . "' ";
        $result = $this->connection->query($sql);
        $result->setFetchMode(\Phalcon\Db::FETCH_ASSOC);
        $rows = $result->fetchALl();

        foreach($rows as $row) {
            if($row['TABLE_NAME'] == $this->params['table']['value'])
            {
                $final['references'][$row['REFERENCED_TABLE_NAME']] = $row['COLUMN_NAME'];
            }
            if($row['REFERENCED_TABLE_NAME'] == $this->params['table']['value'])
            {
                $final['referenced_by'][$row['TABLE_NAME']] = $row['COLUMN_NAME'];
            }            
        }
        return $final;
    }
    
    public function parsePath($path)
    {
        $path = str_replace ('[module]', $this->params['module']['value'],$path);
        return $path;
    }
    
    public function getActionsData($templatePath,$suffix)
    {
        $actions = array();
        foreach($this->params['actions']['value'] as $action)
        {
            $fullName = strtolower($this->camelize($action)) . $suffix;
            $method = "";
            
            if($this->params['api']['value'])
            {
                switch($action)
                {
                    case "new":
                        $method="POST";
                        break;
                    case "update":
                        $method="PUT";
                        break;
                    case "delete":
                        $method="DELETE";
                        break;
                    case "index":
                        $method="OPTIONS";
                        break;
                    case "get";
                    default:
                        $method="GET";
                }
            } else {
                $method="GET";
            }
            
            $file = ucfirst($fullName) . ".php";
            if( !file_exists ($templatePath . "/" . $file))
            {
                $file = "Default" . $suffix . ".php";
                if( !file_exists ($templatePath . "/" . $file) )
                {
                    $this->printMessage(TaskBase::MSG_ERROR, "Couldn't find template file for action " . $fullName . "!");
                    exit(1);
                }
            }
            
            $actions[$action] = [
                "full_name"     => $fullName,
                "method"        => $method,
                "teplate_name"  => $file
            ];
        }
        return $actions;
    }
    
    public function getMandatoryDatabaseFields($rows)
    {
        $fields = [];
        foreach($rows as $field)
        {
            if($field['nullable'])
                continue;
            $fields[] = $field;
        }
        return $fields;
    }
    
    /**
     * Camelize a string
     * @return string
     */
    public function camelize($str)
    {
        $temp = ucwords($str," -_");
        return str_replace(array(" ","-","_"), "", $temp);
    }
    
    /**
     * Get the table names available in the database
     * @return array
     */
    public function getTables()
    {
        $sql = "SHOW TABLES ";
        $result = $this->connection->query($sql);
        $result->setFetchMode(\Phalcon\Db::FETCH_NUM);
        $rows = $result->fetchALl();
        
        $newRows = array();
        
        foreach($rows as $row)
        {
            $newRows[] = $row[0];
        }
        
        return $newRows;
    }
    
    /**
     * Prints the help information to the screeen
     */
    public function help()
    {
        echo(PHP_EOL);
        $this->printMessage(TaskBase::MSG_DEFAULT,"USAGE: ./run [ --all | --controller | --model | --route ] --module=[modulename] --table=[tablename] --actions=[action[,]...]");
        $latest = 0;
        foreach($this->params as $key => $value) {
            $temp = strlen($key);
            if( $temp > $latest)
                $latest = $temp;
        }

        $latest++;
        echo(PHP_EOL);
        $this->printMessage(TaskBase::MSG_DEFAULT,"OPTIONS:");
        foreach($this->params as $key => $value) 
        {
            $required = $value['required'] ? "Yes" : "No";
            $parameter = $value['parameter'] ? "Yes" : "No";
            $this->printMessage(TaskBase::MSG_DEFAULT,"  --" . str_pad($key, $latest," ") . $value['description']);
            $this->printMessage(TaskBase::MSG_DEFAULT,"    " . str_pad("", $latest," ") . "Required:      " . $required);
            $this->printMessage(TaskBase::MSG_DEFAULT,"    " . str_pad("", $latest," ") . "Has parameter: " . $parameter . PHP_EOL);
        }
        echo(PHP_EOL);
        exit(0);
    }
    
    /**
     * Prints the header information to the screen
     */
    public function printHeader()
    {
        if($this->params['noheader'])
            return;
        echo(PHP_EOL);
        $this->printMessage(TaskBase::MSG_DEFAULT, "Flux Flow " . ucfirst($this->taskName) . " Generator");
        $this->printMessage(TaskBase::MSG_DEFAULT, "Copyright (c) 2017 Flux Flow");
        $this->printMessage(TaskBase::MSG_DEFAULT, "Author:  Joao L. Ribeiro da Silva <joao.r.silva@gmail.com>");
        $this->printMessage(TaskBase::MSG_DEFAULT, "Licence: GPL v3.0 <https://www.gnu.org/licenses/gpl-3.0.en.html>");
    }
    
    /**
     * Processes the template module 
     * @param type $file
     * @param type $vars
     * @return string
     */
    public function processTemplate($file,$vars) 
    {
        if(!file_exists($file))
        {
            $this->printMessage(TaskBase::MSG_ERROR, "The template file" . $file . " doesn't exist!");
            exit(1);            
        }

        if(!ob_start())
        {
            $this->printMessage(TaskBase::MSG_ERROR, " The output buffer failed to start!");
            exit(1);            
        }

        @set_error_handler(my_error_handler);
        
        include $file;
        
        restore_error_handler();
        
        return ob_get_clean();
    }
    
    /**
     * Prints a message to the console screen
     * @param int $type
     * @param string $message
     */
    public function printMessage($type, $message)
    {
        if($type < 0 || $type > TaskBase::MSG_DEBUG)
            return;
        
        if( !$this->params['verbose']['value'] && $type == TaskBase::MSG_INFO)
            return;
        
        if( !$this->params['debug']['value'] && $type == TaskBase::MSG_DEBUG)
            return;
        
        $task = " " . $this->taskName . ": ";
        if($type == TaskBase::MSG_DEFAULT)
            $task = "";
        
        echo($this->msgColors[$type] . $this->msgTypes[$type] . "" . $task . $message . $this->msgColors[TaskBase::MSG_DEFAULT] . PHP_EOL);
    }
    
    public function printArray(array $arr,$ident="    ")
    {
        $str = "";
        foreach($arr as $key=>$val)
        {
            if(is_object($val)) {
                $str .= $ident . "[" . $key . "] => object(#" . get_class($val) . ")" . PHP_EOL;
            } else if (is_array($val)) {
                $str .= $ident . "[" . $key . "] => [ " . PHP_EOL . $this->printArray($val,$ident . "    ") . $ident . "]"  . PHP_EOL;
            } else {
                if(is_bool($val))
                {
                    $val = $val?"TRUE":"FALSE";
                }
                $str .= $ident . "[" . $key . "] => " . $val  . PHP_EOL;
            }
        }
        return $str;
    }
}

