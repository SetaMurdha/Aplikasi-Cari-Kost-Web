<?php 

class Dashboard extends CI_Controller{
	public function index(){
		$peta['_peta']  = $this->auth_model->dataMap();
		$id=$this->session->userdata("idadmin");
		if($id!=null){
		$this->load->view('template/header');
		$this->load->view('administrator/sidebar');
		$this->load->view('administrator/dashboard', $peta);
		$this->load->view('template/footer');
		}else{
			redirect("login_controller/index");
		}
	}
	public function data_kost($key=null){
		$this->load->model('main_model');
		$data = $this->main_model->get_kost($key);
		echo json_encode($data);
	}

	
}