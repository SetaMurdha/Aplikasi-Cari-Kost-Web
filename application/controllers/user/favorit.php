<?php 

class Favorit extends CI_Controller{
	public function index(){
		$id=$this->session->userdata('iduser');
		if($id!=null){
		$this->load->model('main_model');
		$data["user"]=$this->main_model->get_user_where($id);
		$data["favorit"]=$this->main_model->get_favorit_where($id);
		$this->load->view('template/header');
		$this->load->view('user/sidebar');
		$this->load->view('user/favorit',$data);
		$this->load->view('template/footer');
		}else{
			redirect("login_controller/index");
		}
	}
	public function tambah_favorit(){
        $this->load->model('main_model');
        $id_user=$this->input->post('id_user');
        $id_kost=$this->input->post('id_kost');
        $data=[
            "id_user"=>$id_user,
            "id_kost"=>$id_kost
        ];
        $this->main_model->tambah_favorit($data);
        redirect("user/favorit");
    }

	public function hapus_favorit(){
        $this->load->model('main_model');
        $id_user=$this->input->post('id_user');
        $id_kost=$this->input->post('id_kost');
        $data=[
            "id_user"=>$id_user,
            "id_kost"=>$id_kost
        ];
        $this->main_model->hapus_favorit($data);
        redirect("user/favorit");
    }
}