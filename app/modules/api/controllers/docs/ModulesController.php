<?php
$data = [
    "requests"  => [
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
                    "description"   =>  "Array containg the filter fields to be used.",
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
        "POST"  => [
            "description"   => "Creates a resource.",
            "parameters-body"    => [
                "name",
                "active"
            ]
        ],
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
        "DELETE"   => [
            "description"   => "Updates a resource.",
            "parameters-url"    => [
                "/:id" => [
                    "description"   => "Resource id to be deleted.",
                    "required"  => true
                ]
            ]
        ],
        "OPTIONS"   => [
            "description"   => "Returns the options headers and this information.",
        ]
    ],
    "resource-format"     => [
        "id"    => [
            "description"   => "Resource id.",
            "type"  =>  "integer",
            "signed"    => false,
            "size"  =>  10,
            "read-only"   => true
        ],
        "name"  =>  [
            "description"   => "Field.",
            "type"  =>  "string",
            "size"  =>  128,
            "required"  => true,
            "unique-key-part"    => true,
            "read-only"   => false
        ],
        "key"  =>  [
            "description"   => "Field.",
            "type"  =>  "string",
            "size"  =>  32,
            "read-only"   => true
        ],
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

