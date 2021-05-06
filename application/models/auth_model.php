<?php
class Auth_model extends CI_Model{
    public function register($table,$data){
        $this->db->insert($table,$data);
    } 

    public function tampil_data(){
        return $this->db->get('data_kost')->result_array();
    }
    public function dataMap(){
        return $this->db->get("data_kost")->result_array();
    }
}
?>