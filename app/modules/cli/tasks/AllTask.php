<?php
namespace Fluxflow\Modules\Cli\Tasks;

use Fluxflow\Modules\Cli\Tasks\ControllerTask;
use Fluxflow\Modules\Cli\Tasks\ModelTask;
use Fluxflow\Modules\Cli\Tasks\RouteTask;

class AllTask extends TaskBase 
{
    public $taskName = "All";
    private $tables = array();
    private $console;
    
    public $validParams = array(
        'module'          => array('Application module name.'),
        'api'             => array('Generate with normal or RestAPI verbs'),
        'table'           => array('Table from wich generate the structure.'),
        'all-tables'      => array('Generate for all tables.'),
        'controllers'     => array('Generate controller file.'),
        'routes'          => array('Generate routes file.'),
        'models'          => array('Generate api model file for table.'),
        'actions'         => array('Controller actions to generate.'),
        'force'           => array('Force file generation even if they exist.'),
        'controller-path' => array('Module path (default: app/modules/[module]/controllers) .'),
        'route-path'      => array('Routes path (default: app/config/routes) .'),
        'model-path'      => array('Models path (default: app/modules/[module]/models) .')
    );

    public function createAction (array $params = array())
    {
        $timeStart = microtime(true);
        if( !$this->parseParams($params) )
            return FALSE;
                
        $this->tables = $this->getTables();
        $this->console = $this->di['console'];

        

        if(!$this->params['all-tables']['value'])
        {
            $this->tables = [];
            $this->tables[] = $this->params['table']['value'];
        }
        
        $tablePos = 0;
        $a=0;
        foreach($params as $param)
        {
            if(substr($param,0,  strlen("table") == "table"))
            {
                $tablePos = $a;
            }
            $a++;
        }
        
        $a=0;
        if($tablePos == 0)
        {
            if(substr($param,0,  strlen("all-tables") == "all-tables"))
            {
                $tablePos = $a;
            }
            $a++;            
        }

        $controllerCount=0;
        $routeCount=0;
        $modelCount=0;
        
        foreach($this->tables as $table)
        {   
            
            $params[$tablePos] = "--table=" . $table;
            if($this->params['controllers']['value'])
            {
                $this->console->handle(
                    [
                    "task" => "controller",
                    "action" => "create",
                    "params"=>$params
                    ]
                );
                $controllerCount++;
            }

            if($this->params['routes']['value'])
            {
                $this->console->handle(
                    [
                    "task" => "route",
                    "action" => "create",
                    "params"=>$params
                    ]
                );
                $routeCount++;
            }

            if($this->params['models']['value'])
            {
                $this->console->handle(
                    [
                    "task" => "model",
                    "action" => "create",
                    "params"=>$params
                    ]
                ); 
                $modelCount++;
            }
        }
        
        $timeEnd = microtime(true);
        
        $apiDocsCount = 0;
        if($this->params['api']['value'])
        {
            $apiDocsCount = $controllerCount;
        }
        $this->printMessage(TaskBase::MSG_SUCCESS, $controllerCount . " controllers genarated!");
        $this->printMessage(TaskBase::MSG_SUCCESS, $apiDocsCount . " api docs genarated!");
        $this->printMessage(TaskBase::MSG_SUCCESS, $routeCount . " routes genarated!");
        $this->printMessage(TaskBase::MSG_SUCCESS, $controllerCount . " models genarated!");
        
        $totalFiles = $controllerCount+$apiDocsCount+$routeCount+$controllerCount;
        
        $this->printMessage(TaskBase::MSG_SUCCESS, "All " . $totalFiles . " files genarated in " . number_format($timeEnd-$timeStart,3) . " secs!");        
    }
}
