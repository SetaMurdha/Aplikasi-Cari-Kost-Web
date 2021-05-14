<?php 

class Profil extends CI_Controller{
	public function index(){
		$id = $this->session->userdata("iduser");
		if($id!=null){
		$this->load->model('main_model');
		$data['user'] = $this->main_model->get_user_where(["id"=>$id]);
		$this->load->view('template/header');
		$this->load->view('user/sidebar');
		$this->load->view('user/profil', $data);
		$this->load->view('template/footer');
		}else{
			redirect("login_controller/index");
		}
	}
}