<?php echo("<?php") ?> 
$data = [
    "requests"  => [
<?php foreach($vars['controller_methods'] as $method) { ?>
<?php   switch(strtoupper($method)) {?>
<?php       case "GET":?>
        "GET" => [
            "description"   => "Gets one or more resources",
            "parameters-url"    => [
                "/:id"      => [
                    "description"   => "Returns a single record corresponding to the number in :id.",
                    "required"      => false,
                    "notes"         => "If this parameter is used the all other parameters are ignored."
                ],
                "paging"    => [
                    "page"  => [
                        "description"   => "Number of the page you want to fetch.",
                        "defaults"      => 0,
                        "required"      => false
                    ],
                    "page_size"     => [
                        "description"   => "Number of rows per page.",
                        "defaults"      => 10,
                        "required"      => false
                    ],
                    "required"  => false,
                ],
                "filter"  => [
                    "description"   =>  "Array containing the filter fields to be used.",
                    ":field"    => [
                        "o" => [
                            "description"   => "Logical operation",
                            "possible-values"   => "=, !=, >, <, >= ,<= ,like ,in ,not in ,between",
                            "required"  =>true
                            ],
                        "v" => [
                            "description"   => "Value to compare (for list operation separate the values with comma).",
                            "required"  => true
                        ]
                    ],
                    "required"  => false
                ],
                "order" => [
                    "description"   => "Array containing the result order.",
                    ":field"    => [
                        "description"   => "Field order",
                        "possible-values"   => "asc, desc",
                        "default"   => "asc"
                    ],
                    "required"  => false
                ]
            ]
        ],
<?php
                break;
            case "POST":
?>        
        "POST"  => [
            "description"   => "Creates a resource.",
            "parameters-body"    => [
                "name",
                "active"
            ]
        ],
<?php
                break;
            case "PUT":
?>        
        "PUT"   => [
            "description"   => "Updates a resource.",
            "parameters-url"    => [
                "/:id" => [
                    "description"   => "Resource id to be updated.",
                    "required"  => true

                ]
            ],
            "parameters-body"    => [
                "name",
                "active"
            ],
        ],
<?php
                break;
            case "DELETE":
?>        
        "DELETE"   => [
            "description"   => "Updates a resource.",
            "parameters-url"    => [
                "/:id" => [
                    "description"   => "Resource id to be deleted.",
                    "required"  => true
                ]
            ]
        ],
<?php
                break;
            case "OPTIONS":
?>        
        "OPTIONS"   => [
            "description"   => "Returns the options headers and this information.",
        ]
    ],
<?php
                break;
?>            
<?php   } //switch?>
<?php } //foreach($vars['controller_methods']) ?>     
    "resource-format"     => [
        "id"    => [
            "description"   => "Resource id.",
            "type"  =>  "integer",
            "signed"    => false,
            "size"  =>  10,
            "read-only"   => true
        ],
<?php foreach($vars['all_fields'] as $field) { ?>
        "<?php echo($field['field_name']) ?>"  =>  [
            "description"   => "Field.",<?php 
        switch(trim(str_replace("unsigned","",strtolower($field['type']))))
        {
            case "char":
            case "varchar":
            case "nvarchar":
            case "json":
            case "text":
            case "mediumtext":
            case "longtext":
            case "tinytext":
                $type = "string";
                break;
            case "int":
            case "mediumint":
            case "smallint":
            case "bigint":
                $type = "integer";
                break;
            case "tinyint":
                $type = "boolean";
                break;
            case "real":
            case "double":
            case "decimal":
                $type = "double";
                break;
            case "date":
                $type = "date";
                break;
            case "datetime":
            case "timestamp":
                $type = "datetime";
                break;
        }
?>            
            "type"  =>  "<?php echo($type)?>",
            "size"  =>  "<?php if($field['size'])echo($field['size']); else echo("0"); ?>",
            "required"  => <?php if($field['nullable'])echo("false"); else echo("true"); ?>,
            "unique-key-part"    => <?php 
$unique = "false";            
if(isset($vars['keys'][$field['field_name']]))
{
    foreach($vars['keys'][$field['field_name']] as $val)
    {
        if($val === true)
        {
            $unique = "true";
            break;
        }
    }
}
echo($unique);
?>,
            "read-only"   => false
        ],
<?php } //foreach($vars['all_fields'] as $field)?>
        "active"    => [
            "description"   => "Resource is active?",
            "type"  => "boolean",
            "size"  => 1,
            "possible-values"   => "0 - inactive, 1 - active",
            "read-only"   => false
        ],
        "created_by"    => [
            "description"   => "Resource created by user id.",
            "type"  =>  "integer",
            "signed"    => false,
            "size"  =>  10,
            "read-only"   => true                    
        ],
        "created_date"  => [
            "description"   => "Resource creation timestamp.",
            "type"  =>  "datetime",
            "read-only"   => true,
            "format"    => "Y-m-d H:i:s"
        ],
        "updated_by"    => [
            "description"   => "Resource last updated by user id.",
            "type"  =>  "integer",
            "signed"    => false,
            "size"  =>  10,
            "read-only"   => true                    
        ],
        "updated_date"  => [
            "description"   => "Resource last updated timestamp.",
            "type"  =>  "datetime",
            "read-only"   => true,
            "format"    => "Y-m-d H:i:s"
        ],
        "deleted_by"    => [
            "description"   => "Resource last deleted by user id.",
            "type"  =>  "integer",
            "signed"    => false,
            "size"  =>  10,
            "read-only"   => true                    
        ],
        "deleted_date"  => [
            "description"   => "Resource last deleted timestamp.",
            "type"  =>  "datetime",
            "read-only"   => true,
            "format"    => "Y-m-d H:i:s"
        ],
        "deleted"   => [
            "description"   => "Resource was deleted?",
            "type"  => "boolean",
            "size"  => 1,
            "possible-values"   => "0 - not deleted, 1 - deleted",
            "read-only"   => true                    
        ]
    ]
];

