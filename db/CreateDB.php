<?php


class CreateDB implements DBInterface
{
    private $server, $user, $pass, $dbname, $connection;

    function __construct($server, $user, $pass, $dbname)
    {
        $this->server = $server;
        $this->user = $user;
        $this->pass = $pass;
        $this->dbname = $dbname;
        $this->connect();
    }


    public function connect($dbName = null)
    {
        if ($dbName === null)
            $this->connection = @mysqli_connect($this->server, $this->user, $this->pass);
        else {
            $this->connection = @mysqli_connect($this->server, $this->user, $this->pass, $dbName);
        }

    }

    public function close(){
        mysqli_close($this->connection);
        $this->connection = null;
    }

    public function createDatabase($dbName = 'univer')
    {
        $this -> connect();
        $sql = "CREATE DATABASE ".$dbName;
        $result = "Database ".$dbName." created successfully";
        if (!mysqli_query($this->connection, $sql)) {
            $result = "Database ".$dbName." already exist";
        }
        $this->close();
        return $result;

    }
}


/*
    mysql_connect("mysql.myhost.com", "user", "sesame") or die(mysql_error());
	mysql_query("CREATE DATABASE mydatabase") or die(mysql_error());
	mysql_close();



$link=mysql_connect("mysqlserver","usr","pass") or die ("Cannot connect");
      mysql_select_db("db_name") or die ("Cannot open DB");

            mysqli_query('SET NAMES UTF8');


        if ($connection) {
            $selectDB = @mysqli_select_db($this->dbname, $connection);

        }




*/