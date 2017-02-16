<?php
namespace Fluxflow\Modules\Cli\Tasks;

class ControllerTask extends TaskBase 
{
    public $taskName = "Controller";
    
    public $controllerPath =  "app/modules/[module]/controllers";
    public $controllerNamespace =  "Fluxflow\\Modules\\[module]\\Controllers";
    
    public $validParams = array(
        'module'            => array('Application module name.'),
        'api'               => array('Generate with normal or RestAPI verbs'),
        'table'             => array('Table from wich generate the api controller.'),
        'actions'           => array('Controller actions to generate.'),
        'force'             => array('Force file generation even if they exist.'),
        'controller-path'   => array('Module path (default: $this->controllerPath)'),
        'help'              => array('Displays the help information.'),
    );
    
    public function createAction (array $params = array())
    {
        $this->printMessage(TaskBase::MSG_DEBUG, "Parsing parameters!");
        if( !$this->parseParams($params) )
            return FALSE;
        
        $this->printMessage(TaskBase::MSG_DEBUG, "Parsing controller's path!");
        $path = $this->parsePath($this->controllerPath);
        if(isset($this->params['controller-path']['value']) && $this->params['controller-path']['value'])
        {
            $path = $this->parsePath($this->params['controller-path']['value']);
        }
        
        $this->printMessage(TaskBase::MSG_DEBUG, "Checking if the controller's path exist!");
        if(!is_dir($path))
        {
            $this->printMessage(TaskBase::MSG_ERROR, "The controllers directory " . $path . " doesn't exist!");
            exit(1);            
        }
        
        $this->printMessage(TaskBase::MSG_DEBUG, "Getting table " . $this->params['table']['value'] . " structure!");
        $tableStructure = $this->getTableStructure();
        if(!$tableStructure)
        {
            $this->printMessage(TaskBase::MSG_ERROR, "No " . $this->params['table']['value'] . " table structure found!");
            exit(1);
        }
        
        $tableKeys = $this->getTableKeys();
        $foreignKeys = $this->getForeignKeys();
        
        $this->printMessage(TaskBase::MSG_DEBUG, "Determine model name.");
        $modelName = $this->camelize($this->params['table']['value']);

        $this->printMessage(TaskBase::MSG_DEBUG, "Determine controller name.");
        $controllerName = ucfirst(strtolower($this->camelize($this->params['table']['value']))) . "Controller";
        
        $this->printMessage(TaskBase::MSG_DEBUG, "Determine controller namespace.");
        $controllerNameSpace = str_replace("[module]",ucfirst($this->params['module']['value']),$this->controllerNamespace);
        
        $this->printMessage(TaskBase::MSG_DEBUG, "Determine controller extends class.");
        $controllerExtend = "";
        if($this->params['extends']['value'])
        {
            $controllerExtend = "extends " . $this->params['extends']['value'];
        }
        
        $this->printMessage(TaskBase::MSG_DEBUG, "Determine controller full path.");
        $controllerFile = $path . "/" . $controllerName . ".php";
        $docFile = $path . "/docs/" . $controllerName . ".php";

        $this->printMessage(TaskBase::MSG_DEBUG, "Checking force value!");        
        $force = $this->params['force']['value'];
        if( !$force )
        {
            $this->printMessage(TaskBase::MSG_DEBUG, "Force option isn't set so check if the controller already exists.");
            if(file_exists($controllerFile))
            {
                $this->printMessage(TaskBase::MSG_ERROR, "The controller file" . $controllerFile . " already exists and no force option was specified!");
                exit(1);
            }
            $this->printMessage(TaskBase::MSG_DEBUG, "Controller doesn't exist. Not force required.");
        } 
        else 
        {
            $this->printMessage(TaskBase::MSG_DEBUG, "Force option set. We'll replace the controller file as needed.");
        }
        
        $this->printMessage(TaskBase::MSG_DEBUG, "Determine template diretory.");
        $templatePath = $this->parsePath($this->templateDirectory) . "/controller";
        
        $this->printMessage(TaskBase::MSG_DEBUG, "Determine controller's actions and HTTP methods.");
        $actions = $this->getActionsData($templatePath,"Action");
        
        $controllerMethods = array();
        foreach($actions as $action)
        {
            $controllerMethods[] = $action['method'];
        }
        $controllerMethods = array_unique($controllerMethods);
        
        
        $this->printMessage(TaskBase::MSG_DEBUG, "Determine non nullable database fields.");
        $notNullFields = $this->getMandatoryDatabaseFields($tableStructure);
        
        $variables = [
            "namespace"             => $controllerNameSpace,
            "controller_name"       => $controllerName,
            "controller_file"       => $controllerFile,
            "model_name"            => $modelName,
            "extends"               => $controllerExtend,
            "template_path"         => $templatePath,
            "controller_methods"    => $controllerMethods,
            "not_null_fields"       => $notNullFields,
            "keys"                  => $tableKeys,
            "foreign_keys"          => $foreignKeys,
            "all_fields"            => $tableStructure,
            "args"                  => $this->params,
            "current_action"        => array()
        ];        
        
        $templateHeaderFile = $templatePath . "/Header.php";
        $templateFooterFile = $templatePath . "/Footer.php";
        
        $this->printMessage(TaskBase::MSG_DEBUG, "Template data " .PHP_EOL . $this->printArray($variables));
        
        $this->printMessage(TaskBase::MSG_INFO, "Building controller " . $controllerName . " source code.");        
        $this->printMessage(TaskBase::MSG_INFO, "Processing template file Header.php.");

        $result = $this->processTemplate($templateHeaderFile, $variables);
        if($result === FALSE)
        {
            exit(1);
        }
        $code = $result;
        foreach($actions as $key=>$action)
        {
            $this->printMessage(TaskBase::MSG_INFO, "Processing template file " . $action["teplate_name"] . ".");
            $variables["current_action"] = $actions[$key];
            $result = $this->processTemplate($templatePath . "/" . $action["teplate_name"], $variables);
            if($result === FALSE)
            {
                exit(1);
            }
            $code .= $result;
        }
        
        $this->printMessage(TaskBase::MSG_INFO, "Processing template file Footer.php.");

        $result = $this->processTemplate($templateFooterFile, $variables);
        if($result === FALSE)
        {
            exit(1);
        }
        $code .= $result;
        
        if(!$this->params['test']['value']) 
        {
            if(!file_put_contents($controllerFile, $code))
            {
                $this->printMessage(TaskBase::MSG_ERROR, "Error writing file" . $controllerFile . "!");
                exit(1);
            }
            $this->printMessage(TaskBase::MSG_SUCCESS, "Controller class file: " . $controllerFile);
        } 
        
        $docCode = "";
        
        if($this->params['api']['value'])
        {
            $docTemplate = $templatePath . "/docs/index.php";
            if(file_exists($docTemplate))
            {
                $result = $this->processTemplate($docTemplate, $variables);
                if($result === FALSE)
                {
                    exit(1);
                }
                if(!$this->params['test']['value']) 
                {
                    if(!file_put_contents($docFile, $result))
                    {
                        $this->printMessage(TaskBase::MSG_ERROR, "Error writing documentation file " . $docFile . "!");
                        $this->printMessage(TaskBase::MSG_INFO, "Deleting generated controller.");
                        unlink($controllerFile);
                        exit(1);
                    }
                    $this->printMessage(TaskBase::MSG_SUCCESS, "Documentation file: " . $controllerFile);
                }
                $docCode = $result;
            }
        }
        
        $message = 
            "Generated code:" . PHP_EOL .
            "********************BEGIN********************" . PHP_EOL .
            $code . PHP_EOL . 
            "*********************END*********************" . PHP_EOL;
        $this->printMessage(TaskBase::MSG_DEBUG, $message);
        
        if($docCode)
        {
            $message = 
                "Generated API documentation code:" . PHP_EOL .
                "********************BEGIN********************" . PHP_EOL .
                $docCode . PHP_EOL . 
                "*********************END*********************" . PHP_EOL;
            $this->printMessage(TaskBase::MSG_DEBUG, $message);
        }
        
        $this->printMessage(TaskBase::MSG_SUCCESS, "The controller " . $controllerName . " was generated successfully!");
        
        return TRUE;
    }
}
