    /**
     * <?php echo($vars['current_action']['full_name'])?>() 
     * HTTP method <?php echo($vars['current_action']['method'])?> 
     * Returns resources according to parameters
     */
    public function <?php echo($vars['current_action']['full_name'])?>($id)
    {
        $requestSetting = array();
        $data = array();
        
        if( !$this->validateParams( $this->request->getQuery(), $this->validParams ) )
             $code = 400;
        
        if($id)
        {
            //Single record
            $record = <?php echo($vars['model_name'])?>::findFirst($id);
            if( !$record) 
                $code = 404;
            else
            {
                $code = 200;
                $data = ["data" => $record->toArray()];
            }
        }
        else 
        {
            //Recordset to find
            $requestSetting = $this->parseSettings( $this->request, <?php echo($vars['model_name'])?> );
            
            $struct = <?php echo($vars['model_name'])?>::findStructured($requestSetting);

            if( count($struct['result']) == 0)
                $code = 404;
            else
            {
                $code = 200;
                $data = ["data" => $struct];    
            }
        }
        
        return $this->sendResponse($code,$data);        
    }
    
