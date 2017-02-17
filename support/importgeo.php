<?php
$db = mysqli_connect("localhost", "root", "cma32nil", "fluxflow");
if(!$db)
{
    echo(mysqli_connect_error() . PHP_EOL);
    die("Failed to connect to database!".PHP_EOL);
}

mysqli_set_charset($db,"utf8");


/**
 * Insert/Update countries
 */
/*$countriesFile = __DIR__ . "/2016-2 CountryCodes.csv";
$fd = fopen($countriesFile,"r");
if(!$fd)
{
    die("Failed to open " . $countriesFile ."!".PHP_EOL);
}

while(!feof($fd)) {
    $line = fgets($fd);
    $fields = explode(",",$line);
    
    if(!$fields[0])
        continue;
    
    if(count($fields) > 2)
        $fields[1] .= $fields[2];
    
    $fields[1] = str_replace("\"","",$fields[1]);
    
    $sql = "SELECT * FROM geo_countries WHERE code_1='" . $fields[0] . "'";
    $result = mysqli_query($db, $sql);
    $rows = mysqli_fetch_assoc($result);
    
    $date = new DateTime();
    
    if(count($rows) > 0) {
        $sql = "UPDATE geo_countries SET ".
                "name = \"" . trim($fields[1]) . "\"," .
                "updated_by = 1," .
                "updated_date = \"" . $date->format("Y-m-d H:i:s") . "\" " .
                "WHERE id=" . $rows['id'];
    } else {
        $sql = "INSERT INTO geo_countries(" .
                "name," . 
                "code_1," . 
                "active," . 
                "created_by," . 
                "created_date," . 
                "updated_by," . 
                "updated_date" . 
                ") VALUES (" .
                "\"" . trim($fields[1]) . "\"," . 
                "\"" . trim($fields[0]) . "\"," . 
                "1,1," . 
                "\"" . $date->format("Y-m-d H:i:s") . "\"," . 
                "1," . 
                "\"" . $date->format("Y-m-d H:i:s") . "\")"; 
    }
    
    echo("Country " . trim($fields[1]) . " inserted." . PHP_EOL);
    
    if(!mysqli_query($db, $sql))
    {
        echo("ERROR: " . $sql . PHP_EOL . mysqli_error($db) . PHP_EOL);
        die;
    }
    
}
fclose($fd);*/

/**
 * Insert/Update countries
 */
/*
$statesFile = __DIR__ . "/2016-2 SubdivisionCodes.csv";
$fd = fopen($statesFile,"r");
if(!$fd)
{
    die("Failed to open " . $countriesFile ."!".PHP_EOL);
}

while(!feof($fd)) {
    $line = fgets($fd);
    $fields = explode(",",$line);
    
    if(!$fields[0])
        continue;
    $fields[0] = str_replace("\"","",$fields[0]);
    $fields[1] = str_replace("\"","",$fields[1]);
    $fields[2] = str_replace("\"","",$fields[2]);
    $fields[3] = str_replace("\"","",$fields[3]);
    
    $sql = "SELECT * FROM geo_countries WHERE code_1='" . $fields[0] . "'";
    $result = mysqli_query($db, $sql);
    $country = mysqli_fetch_assoc($result);
    if(count($country) == 0)
    {
        echo("ERROR: Country code " . $fields[0] . " not found!" .PHP_EOL );
        continue;
    }
    
    $sql = "SELECT * FROM geo_provinces WHERE geo_countries_id=" . $country['id'] . " AND name=\"" . trim($fields[2]) . "\"";
    $result = mysqli_query($db, $sql);
    $state = mysqli_fetch_assoc($result);
    
    $date = new DateTime();
    
    if(count($state) > 0)
    {
        continue;
        $sql = "UPDATE geo_provinces SET " .
                "geo_countries_id=" . $country['id'] . ", " .
                "name = \"" . trim($fields[2]) . "\"," .
                "code = \"" . trim($fields[1]) . "\"," .
                "type = \"" . trim($fields[3]) . "\"," .
                "updated_by = 1," .
                "updated_date = \"" . $date->format("Y-m-d H:i:s") . "\" " .
                "WHERE id=" . $state['id'];
    } else {
        $sql = "INSERT INTO geo_provinces(" .
                "geo_countries_id," . 
                "name," . 
                "code," . 
                "type," . 
                "active," . 
                "created_by," . 
                "created_date," . 
                "updated_by," . 
                "updated_date" . 
                ") VALUES (" .
                $country['id'] . ",".
                "\"" . trim($fields[2]) . "\"," . 
                "\"" . trim($fields[1]) . "\"," . 
                "\"" . trim($fields[3]) . "\"," . 
                "1,1," . 
                "\"" . $date->format("Y-m-d H:i:s") . "\"," . 
                "1," . 
                "\"" . $date->format("Y-m-d H:i:s") . "\")"; 
        
    }
    
    echo("State " . $fields[0] . " - " . trim($fields[2]) . " inserted." . PHP_EOL);
    
    if(!mysqli_query($db, $sql))
    {
        echo("ERROR: " . $sql . PHP_EOL . mysqli_error($db) . PHP_EOL);
        die;
    }
}
fclose($fd);
*/
$cityFiles = array(
    __DIR__ . "/2016-2 UNLOCODE CodeListPart1.csv",
    __DIR__ . "/2016-2 UNLOCODE CodeListPart2.csv",
    __DIR__ . "/2016-2 UNLOCODE CodeListPart3.csv"
);

foreach($cityFiles as $cityFile)
{
    $fd = fopen($cityFile,"r");
    if(!$fd)
    {
        die("Failed to open " . $cityFile ."!".PHP_EOL);
    }
    $lineCount = 0;
    while(!feof($fd)) {
        $line = fgets($fd);
        $fields = explode(",",$line);
        
        if(!$fields[1])
            continue;
        $fields[1] = str_replace("\"","",$fields[1]);
        $fields[3] = str_replace("\"","",$fields[3]);
        $fields[4] = str_replace("\"","",$fields[4]);
        $fields[5] = str_replace("\"","",$fields[5]);
        $fields[10] = str_replace("\"","",$fields[10]);
        $field10 = explode(" ",$fields[10]);
        if(count($field10) !=2)
        {
            $field10[0] = "";
            $field10[1] = "";
        }

        $sql = "SELECT * FROM geo_countries WHERE code_1='" . $fields[1] . "'";
        $result = mysqli_query($db, $sql);
        $country = mysqli_fetch_assoc($result);
        if(count($country) == 0)
        {
            echo("ERROR: Country code " . $fields[0] . " not found!" .PHP_EOL );
            continue;
        }

        if(trim($fields[5]))
        {            
            $sql = "SELECT * FROM geo_provinces WHERE geo_countries_id=" . $country['id'] . " AND code=\"" . trim($fields[5]) . "\"";
            //print_r($sql);
            $result = mysqli_query($db, $sql);
            $state = mysqli_fetch_assoc($result);
            if($state && count($state)) {
                $s= "=" . $state['id'];
            } else {
                $state = array();
                $state['id'] = "NULL";
                $s = " IS " . $state['id'];                
            }
        } else {
            $state = array();
            $state['id'] = "NULL";
            $s = " IS " . $state['id'];
        }
        
        $sql = "SELECT * FROM geo_cities WHERE geo_countries_id=" . $country['id'] . " AND geo_provinces_id" . $s . " AND name=\"" . trim($fields[4]) . "\"";
        
        $result = mysqli_query($db, $sql);
        if(!$result) {
            echo("ERROR: " . $sql . PHP_EOL . mysqli_error($db) . PHP_EOL);
            die;            
        }
        $city = mysqli_fetch_assoc($result);            
        
        $date = new DateTime();

        if(count($city) > 0)
        {
            continue;
            $sql = "UPDATE geo_cities SET " .
                    "geo_countries_id=" . $country['id'] . ", " .
                    "geo_provinces_id=" . $state['id'] . ", " .
                    "name = \"" . trim($fields[3]) . "\"," .
                    "latitude = \"" . trim($field10[0]) . "\"," .
                    "longitude = \"" . trim($field10[1]) . "\"," .
                    "updated_by = 1," .
                    "updated_date = \"" . $date->format("Y-m-d H:i:s") . "\" " .
                    "WHERE id=" . $state['id'];
        } else {
            $sql = "INSERT INTO geo_cities(" .
                    "geo_countries_id," . 
                    "geo_provinces_id," . 
                    "name," . 
                    "latitude," . 
                    "longitude," . 
                    "active," . 
                    "created_by," . 
                    "created_date," . 
                    "updated_by," . 
                    "updated_date" . 
                    ") VALUES (" .
                    $country['id'] . ",".
                    "" . $state['id'] . "," .
                    "\"" . trim($fields[3]) . "\"," .                    
                    "\"" . trim($field10[0]) . "\"," . 
                    "\"" . trim($field10[1]) . "\"," . 
                    "1,1," . 
                    "\"" . $date->format("Y-m-d H:i:s") . "\"," . 
                    "1," . 
                    "\"" . $date->format("Y-m-d H:i:s") . "\")"; 

        }

        echo("City " . $fields[1] . " - " . trim($fields[4]) . " inserted." . PHP_EOL);

        if(!mysqli_query($db, $sql))
        {
            echo("ERROR: " . $sql . PHP_EOL . mysqli_error($db) . PHP_EOL);
            die;
        }
    }
    fclose($fd);    
}