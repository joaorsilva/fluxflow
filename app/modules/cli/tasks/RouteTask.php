<?php
namespace Fluxflow\Modules\Cli\Tasks;

class RouteTask extends TaskBase 
{
    public $taskName = "Route";
    
    public $routePath =  "app/config/routes";
    public $controllerNamespace =  "Fluxflow\\Modules\\[module]\\Controllers";    
    
    public $validParams = array(
        'module'            => array('Application module name.'),
        'api'               => array('Generate with normal or RestAPI verbs'),
        'table'             => array('Table from wich generate the api controller.'),
        'actions'           => array('Controller actions to generate.'),
        'force'             => array('Force file generation even if they exist.'),
        'route-path'        => array('Routes path (default: app/config/routes) .'),
        'help'              => array('Module path (default: $this->controllerPath)'),
    );
    
    public function createAction (array $params = array())
    {
        $this->printMessage(TaskBase::MSG_DEBUG, "Parsing parameters!");
        if( !$this->parseParams($params) )
            return FALSE;

        $this->printMessage(TaskBase::MSG_DEBUG, "Parsing route's path!");
        $path = $this->routePath;
        if(isset($this->params['route-path']['value']) && $this->params['route-path']['value'])
        {
            $path = $this->parsePath($this->params['route-path']['value']);
        }
        
        $this->printMessage(TaskBase::MSG_DEBUG, "Determine controller name.");
        $controllerName = ucfirst(strtolower($this->camelize($this->params['table']['value']))) . "Controller";
        $this->printMessage(TaskBase::MSG_DEBUG, "Determine controller namespace.");
        $controllerNameSpace = str_replace("[module]",ucfirst($this->params['module']['value']),$this->controllerNamespace);
        $routeName = ucfirst($this->params['module']['value']) . ucfirst($this->camelize($this->params['table']['value'])) . "Routes";
        $routeFile = $path . "/" . $routeName . ".php";
        
        $this->printMessage(TaskBase::MSG_DEBUG, "Checking force value!");
        $force = $this->params['force']['value'];
        if( !$force )
        {
            $this->printMessage(TaskBase::MSG_DEBUG, "Force option isn't set so check if the route already exists.");
            if(file_exists($routeFile))
            {
                $this->printMessage(TaskBase::MSG_ERROR, "The route file" . $routeFile . " already exists and no force option was specified!");
                exit(1);
            }
            $this->printMessage(TaskBase::MSG_DEBUG, "Route doesn't exist. Not force required.");
        } 
        else 
        {
            $this->printMessage(TaskBase::MSG_DEBUG, "Force option set. We'll replace the route file as needed.");
        }

        $this->printMessage(TaskBase::MSG_DEBUG, "Determine template diretory.");
        $templatePath = $this->parsePath($this->templateDirectory) . "/route";
        
        $this->printMessage(TaskBase::MSG_DEBUG, "Determine controller's actions and HTTP methods.");
        $actions = $this->getActionsData($templatePath,"Route");
        
        $controllerMethods = array();
        foreach($actions as $action)
        {
            $controllerMethods[] = $action['method'];
        }
        $controllerMethods = array_unique($controllerMethods);
        
        $variables = [
            "namespace"             => $controllerNameSpace,
            "controller_name"       => $controllerName,
            "template_path"         => $templatePath,
            "controller_methods"    => $controllerMethods,
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
            if(!file_put_contents($routeFile, $code))
            {
                $this->printMessage(TaskBase::MSG_ERROR, "Error writing file" . $routeFile . "!");
                exit(1);
            }
            $this->printMessage(TaskBase::MSG_SUCCESS, "Route file: " . $routeFile);
        } 
        
        $message = 
            "Generated code:" . PHP_EOL .
            "********************BEGIN********************" . PHP_EOL .
            $code . PHP_EOL . 
            "*********************END*********************" . PHP_EOL;
        $this->printMessage(TaskBase::MSG_DEBUG, $message);
        
        $this->printMessage(TaskBase::MSG_SUCCESS, "The route " . $routeName . " was generated successfully!");
        
        return TRUE;
    }    
}
