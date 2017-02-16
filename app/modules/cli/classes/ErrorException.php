<?php
namespace Fluxflow\Modules\Cli\Classes;

class ErrorException extends \Exception 
{
    protected $severity;
    protected $file;
    protected $line;
    
    public function __construct($message = "", $code = 0, $severity=0, $file="", $line = 0, \Exception $previous = null) 
    {
        echo("****************************************************");
        parent::__construct($message, $code, $previous);
        $this->severity = $severity;
        $this->file = $file;
        $this->line = $line;
    }
    
    public function getSeverity()
    {
        return $this->severity;
    }
    
    public function getExceptionFile()
    {
        return $this->file;
    }
    
    public function getExceptionLine()
    {
        return $this->line;        
    }
}
