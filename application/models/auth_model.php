<?php
class Auth_model extends CI_Model{
    public function register($table,$data){
        $this->db->insert($table,$data);
    } 
}
?>