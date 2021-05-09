<?php
class Main_model extends CI_Model{
    public function tampil_data_kost(){
        return $this->db->get('data_kost')->result_array();
    }
    public function tampil_kota_kab(){
        return $this->db->get('kota_kab')->result_array();
    }
    public function input_kost($data){
        $this->db->insert("data_kost",$data);
    }
}
?>