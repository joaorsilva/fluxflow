<?php
namespace Fluxflow\Modules\Api\Library;

class ApiParamQuery 
{
    
    public static function prepareParams( array $params )
    {
        //var_dump($params);die;
        $conditions = "";
        $bind       = array();
        $order      = "";
        $offset     = $params['paging']['page'] * $params['paging']['page_size'];
        $limit      = $params['paging']['page_size'];
        
        $count = 1;
        
        foreach( $params['filter'] as $key => $value )
        {
            switch( $value['o'] ) 
            {
                case '=':
                case '!=':
                case '>':
                case '<':
                case '>=':
                case '<=':
                    $condition = $key . " " . $value['o'] . " ?" .$count . " AND ";
                    $bind[$count] = $value['v'];
                    break;
                case 'like':
                    $condition = $key . " " . strtoupper($value['o']) . " ('%?" . $count . "%') AND ";
                    $bind[$count] = $value['v'];
                    break;
                case 'in':
                case 'not in':
                    $vals = explode(',',$value['v']);
                    $condition = $key . " " . strtoupper($value['o']) . " ({?" . $count . ":array}) AND ";
                    $bind[$count] = $vals;
                    break;
                case 'between':
                    $vals = explode(',',$value['v']);
                    $condition = $key . " " . strtoupper($value['o']) . " ?" . $count . " AND ?" . ($count+1) . " AND ";
                    $bind[$count] = $vals[0];
                    $bind[$count+1] = $vals[1];
                    $count++;
                    break;
                default:
                    break;
            }

            if( $condition )
            {
                $conditions .= $condition;
                $count++;
            }
        }
        
        $queryParams = array();
        if( $conditions ) 
        {
            $conditions = substr($conditions, 0, -4);
            $queryParams['conditions'] = $conditions;
            $queryParams['bind'] = $bind;
        }
        
        foreach( $params['order'] as $key => $value )
        {
            $order = $key . " " . $value . ", ";
        }
        
        if( $order )
        {
            $order = substr($order, 0, -2);
            $queryParams['order'] = $order;
            $queryParams['offset'] = $offset;
            $queryParams['limit'] = $limit;
        }
        
        return $queryParams;
    }
    
}
