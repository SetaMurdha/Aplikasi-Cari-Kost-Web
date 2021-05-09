<?php 

class Dashboard extends CI_Controller{
	public function index(){
		$id=$this->session->userdata("idadmin");
		if($id!=null){
		$this->load->view('template/header');
		$this->load->view('administrator/sidebar');
		$this->load->view('administrator/dashboard');
		$this->load->view('template/footer');
		}else{
			redirect("login_controller/index");
		}
	}
}