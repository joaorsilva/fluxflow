<?php
namespace Fluxflow\Modules\Cli\Tasks;

class ModelTask extends TaskBase
{
    public $taskName = "Model";
    
    public $modelPath =  "app/modules/[module]/models";
    public $modelNamespace =  "Fluxflow\\Modules\\[module]\\Models";
    
    public $validParams = array(
        'module'        => array('Application module name.'),
        'table'         => array('Table from wich generate the api controller.'),
        'force'         => array('Force file generation even if they exist.'),
        'model-path'    => array('Models path (default: app/modules/[module]/models) .')
    );
    
    public function createAction (array $params = array())
    {
        if( !$this->parseParams($params) )
            return FALSE;

        $this->printMessage(TaskBase::MSG_DEBUG, "Parsing model's path!");
        $path = $this->parsePath($this->modelPath);
        if(isset($this->params['model-path']['value']) && $this->params['model-path']['value'])
        {
            $path = $this->parsePath($this->params['model-path']['value']);
        }
        
        $this->printMessage(TaskBase::MSG_DEBUG, "Checking if the model's path exist!");
        if(!is_dir($path))
        {
            $this->printMessage(TaskBase::MSG_ERROR, "The model's directory " . $path . " doesn't exist!");
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
        
        $this->printMessage(TaskBase::MSG_DEBUG, "Determine model's name.");
        $modelName = $this->camelize($this->params['table']['value']);

        $this->printMessage(TaskBase::MSG_DEBUG, "Determine model's namespace.");
        $modelNameSpace = str_replace("[module]",ucfirst($this->params['module']['value']),$this->modelNamespace);
        
        $this->printMessage(TaskBase::MSG_DEBUG, "Determine model full path.");
        $modelFile = $path . "/" . $modelName . ".php";
        
        $this->printMessage(TaskBase::MSG_DEBUG, "Checking force value!");        
        $force = $this->params['force']['value'];
        if( !$force )
        {
            $this->printMessage(TaskBase::MSG_DEBUG, "Force option isn't set so check if the model already exists.");
            if(file_exists($modelFile))
            {
                $this->printMessage(TaskBase::MSG_ERROR, "The model file" . $modelFile . " already exists and no force option was specified!");
                exit(1);
            }
            $this->printMessage(TaskBase::MSG_DEBUG, "Model doesn't exist. Not force required.");
        } 
        else 
        {
            $this->printMessage(TaskBase::MSG_DEBUG, "Force option set. We'll replace the model file as needed.");
        }
        
        $this->printMessage(TaskBase::MSG_DEBUG, "Determine template diretory.");
        $templatePath = $this->parsePath($this->templateDirectory) . "/model";
        
        $variables = [
            "namespace"             => $modelNameSpace,
            "table_name"            => $this->params['table']['value'],
            "model_name"            => $modelName,
            "model_file"            => $modelFile,
            "template_path"         => $templatePath,
            "keys"                  => $tableKeys,
            "foreign_keys"          => $foreignKeys,
            "all_fields"            => $tableStructure,
            "args"                  => $this->params
        ];        
        
        $templateModelFile = $templatePath . "/Model.php";
        
        $this->printMessage(TaskBase::MSG_DEBUG, "Template data " .PHP_EOL . $this->printArray($variables));
        
        $this->printMessage(TaskBase::MSG_INFO, "Building model " . $modelName . " source code.");        
        $this->printMessage(TaskBase::MSG_INFO, "Processing template file Model.php.");
        
        $result = $this->processTemplate($templateModelFile, $variables);
        if($result === FALSE)
        {
            exit(1);
        }
        $code = $result;

        if(!$this->params['test']['value']) 
        {
            if(!file_put_contents($modelFile, $code))
            {
                $this->printMessage(TaskBase::MSG_ERROR, "Error writing file" . $modelFile . "!");
                exit(1);
            }
            $this->printMessage(TaskBase::MSG_SUCCESS, "Model class file: " . $modelFile);
        } 
        
        $message = 
            "Generated code:" . PHP_EOL .
            "********************BEGIN********************" . PHP_EOL .
            $code . PHP_EOL . 
            "*********************END*********************" . PHP_EOL;
        $this->printMessage(TaskBase::MSG_DEBUG, $message);
        
        $this->printMessage(TaskBase::MSG_SUCCESS, "The model " . $modelName . " was generated successfully!");
        
        return TRUE;
        
    }
    
}
