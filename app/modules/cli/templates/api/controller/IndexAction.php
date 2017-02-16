    /**
     * <?php echo($vars['current_action']['full_name'])?>()
     * HTTP method <?php echo($vars['current_action']['method'])?> 
     * Returns the controller API documentation and HTTP Header options
     */
    public function <?php echo($vars['current_action']['full_name'])?>()
    {
        $data = array();
        
        $docFile = __DIR__ . "/docs/<?php echo($vars['controller_name'])?>.php";
        if(file_exists($docFile)) {
            include $docFile;
        }
        <?php
            $allow = implode(",",$vars['controller_methods']);
        ?>
        $response = new Response();
        $response->setStatusCode(200);
        $response->setHeader("Allow", "<?php echo($allow)?>");
        $response->setJsonContent($data, JSON_FORCE_OBJECT);
        
        return $response;
    }

