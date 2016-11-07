<?php

require_once __DIR__.'/vendor/autoload.php';
require_once __DIR__.'/db/DBInterface.php';
require_once __DIR__.'/db/CreateDB.php.php';
require_once 'configuration.php';


   $db = new CreateDB(SERVER,USER,PASS,DBNAME);


/*
    $names =  $db->select('*','names');
    echo'<pre>';
    print_r($names);
    echo'</pre>';
    //$db->insert('names', array('NULL','Влад'));
    $db->closeConnection();
*/