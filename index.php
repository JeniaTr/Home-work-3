<?php

require_once __DIR__.'/vendor/autoload.php';
require_once 'configuration.php';

    use \CreateDB;

// ($server, $user, $pass, $dbname )

$db = new CreateDB(
        $configuration['server'],
        $configuration['database'],
        $configuration['user'],
        $configuration['password']
    );


/*
    $names =  $db->select('*','names');
    echo'<pre>';
    print_r($names);
    echo'</pre>';
    //$db->insert('names', array('NULL','Влад'));
    $db->closeConnection();
*/