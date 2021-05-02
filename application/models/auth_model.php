<?php
class Auth_model extends CI_Model{
    public function register($data){
        $this->db->insert('user',$data);
    } 
}
?>