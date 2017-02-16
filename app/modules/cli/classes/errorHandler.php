<?php
require_once __DIR__ . "/ErrorException.php";

function my_error_handler($err_severity, $err_msg, $err_file, $err_line, array $err_context)
{
    if (0 === error_reporting()) { return false;}
    
    $severityString = "";
    
    switch($err_severity)
    {
        case E_ERROR:               $severityString = "E_ERROR";                break;
        case E_WARNING:             $severityString = "E_WARNING";              break;
        case E_PARSE:               $severityString = "E_PARSE";                break;
        case E_NOTICE:              $severityString = "E_NOTICE";               break;
        case E_CORE_ERROR:          $severityString = "E_CORE_ERROR";           break;
        case E_CORE_WARNING:        $severityString = "E_CORE_WARNING";         break;
        case E_COMPILE_ERROR:       $severityString = "E_COMPILE_ERROR";        break;
        case E_COMPILE_WARNING:     $severityString = "E_COMPILE_WARNING";      break;
        case E_USER_ERROR:          $severityString = "E_USER_ERROR";           break;
        case E_USER_WARNING:        $severityString = "E_USER_WARNING";         break;
        case E_USER_NOTICE:         $severityString = "E_USER_NOTICE";          break;
        case E_STRICT:              $severityString = "E_STRICT";               break;
        case E_RECOVERABLE_ERROR:   $severityString = "E_RECOVERABLE_ERROR";    break;
        case E_DEPRECATED:          $severityString = "E_DEPRECATED";           break;
        case E_USER_DEPRECATED:     $severityString = "E_USER_DEPRECATED";      break;
        default:                    $severityString = "unknown";                break;
    }
    
    
    $message = "Template error: " . PHP_EOL .
               "Message:  " . $err_msg  . PHP_EOL .
               "File:     " . $err_file . PHP_EOL .
               "Line:     " . $err_line . PHP_EOL .
               "Severity: " . $severityString;
               
    echo("\033[1;31m" . "[ ERROR ] " . "" . $message . "\033[0m" . PHP_EOL);
    
    exit(1);
}


