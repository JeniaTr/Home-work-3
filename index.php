<?php

require_once __DIR__.'/vendor/autoload.php';
require_once 'configuration.php';

//require_once __DIR__.'/src/DataBase/CreateDB.php';
//require_once __DIR__.'/src/DataBase/DBInterface.php';
// ($server, $user, $pass, $dbname )


     $configuration = array(
        'server'=>'localhost',
        'database' => 'university111',
        'user' => 'jenia',
        'password' => '1q2w3e$R',
    );

    $db = new CreateDB(
        $configuration['server'],
        $configuration['user'],
        $configuration['password'],
        $configuration['database']
    );

    $db -> createDatabase();

?>

<h1>Add database</h1>

