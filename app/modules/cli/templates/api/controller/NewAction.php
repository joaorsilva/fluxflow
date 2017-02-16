    /**
     * <?php echo($vars['current_action']['full_name'])?>()
     * HTTP method <?php echo($vars['current_action']['method'])?> 
     * Creates a new resource
     */
    public function <?php echo($vars['current_action']['full_name'])?>()
    {
        
        $data = array();
        
        $post = $this->request->getJsonRawBody(TRUE);
        if( 
            !$post
<?php foreach($vars['not_null_fields'] as $field) {?>
            || !isset($post['<?php echo($field['field_name'])?>'])
<?php } ?>
        ) 
            $code = 400;
        
        $resource = new <?php echo($vars['model_name'])?>();
        $resource->setUserId($this->userId);
<?php foreach($vars['all_fields'] as $field) {?>
<?php   if($field['nullable'] == FALSE) {?>
        $resource-><?php echo($field['field_name'])?> = $post['<?php echo($field['field_name'])?>'];
<?php   } else {?>
        if(array_key_exists('<?php echo($field['field_name'])?>',$post))
        {
            if($post['<?php echo($field['field_name'])?>'] === "NULL")
            {
                $resource-><?php echo($field['field_name'])?> = NULL;
            }
            else 
            {
                $resource-><?php echo($field['field_name'])?> = $post['<?php echo($field['field_name'])?>'];
            }
        }
<?php   }?>
<?php } ?>
        $resource->active = 1;
        
        if( isset($post['active']) )
        {
            $resource->active = $post['active'];
        }
        
        if( $resource->create() === FALSE)
        {
            $code = 400;
            $data = ['messages'  => $resource->getMessages()];
        }
        else 
        {
            if( !$resource->id ) $code = 500;
            else 
            {
                $code = 201;
                $data = ['data' => $resource->toArray()];
            }
        }
        
        return $this->sendResponse($code,$data); 
    }

