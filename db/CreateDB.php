<?php


class CreateDB implements DBInterface
{
    private $server,$user,$pass,$dbname,$db;

    function __construct($server,$user,$pass,$dbname)
    {
        $this->server = $server;
        $this->user = $user;
        $this->pass = $pass;
        $this->dbname = $dbname;
        $this->openConnection();
    }


    public function openConnection()
    {
        if(!$this->db)
        {
            $connection = @mysqli_connect($this->server,$this->user,$this->pass);
            if($connection)
            {
                $selectDB = @mysqli_select_db($this->dbname,$connection);
                if($selectDB)
                {
                    $this->db = true;
                    mysqli_query('SET NAMES UTF8');
                    return true;
                }
                else
                {
                    return false;
                }
            } else
            {
                return false;
            }
        } else
        {
            return true;
        }
    }
}
