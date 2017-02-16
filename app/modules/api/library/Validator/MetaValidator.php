<?php

namespace Fluxflow\Modules\Api\Library\Validator;

use Phalcon\Validation;
use Phalcon\Validation\Validator\InclusionIn;
use Phalcon\Validation\Validator\Digit as DigitValidator;
use Phalcon\Validation\Validator\Date as DateValidator;

class MetaValidator extends Validation
{
    public function initialize()
    {
        //Active field
        $this->add(
                'active',
                new InclusionIn(
                    [
                        'message'   => "The active field must be 1 or 0",
                        'domain'    => array(0,1),
                    ]
                )
            );
        
        //Created_by field
        $this->add(
                'created_by',
                new DigitValidator(
                    [
                        'message'   => "The created_by field must be a numeric value",
                    ]
                )
            );
        
        //Created_date field
        $this->add(
                'created_date',
                new DateValidator(
                    [
                        'format'    => "Y-m-d H:i:s",
                        'message'   => "Invalid date",
                    ]
                )
            );
        
        //Updated_by field
        $this->add(
                'updated_by',
                new DigitValidator(
                    [
                        'message'   => "The updated_by field must be a numeric value",
                    ]
                )
            );
        
        //Updated_date field
        $this->add(
                'updated_date',
                new DateValidator(
                    [
                        'format'    => "Y-m-d H:i:s",
                        'message'   => "Invalid date",
                    ]
                )
            );
    }
}
