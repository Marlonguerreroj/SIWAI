<?php

class Dao {

    var $servername;
    var $username;
    var $password;
    var $conn;

    function __construct() {
        $this->servername = "sandbox2.ufps.edu.co";
        $this->username = "ufps_63";
        $this->password = "ufps_82";
        $this->conn = null;
    }

    public function conectar() {

        try {
            $this->conn = new mysqli($this->servername, $this->username, $this->password, "ufps_63");
            if ($this->conn->connect_error) {
                die("Connection failed: " . $conn->connect_error);
            }
            echo "Connected successfully";

        } catch (PDOException $e) {
            echo "Connection failed: " . $e->getMessage();
        }

        return $this->conn;
    }

    public function getConn() {
        return $this->conn;
    }

}
