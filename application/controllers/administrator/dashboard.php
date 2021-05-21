<?php 

class Dashboard extends CI_Controller{
	public function index(){
		$data['_peta']  = $this->auth_model->dataMap();
		$data["kost"] =$this->main_model->tampil_data_kost();
		$data["kota"] =$this->main_model->tampil_kota_kab();
		$data["user"] =$this->main_model->get_users();
		$id=$this->session->userdata("idadmin");
		if($id!=null){
		$this->load->view('template/header');
		$this->load->view('administrator/sidebar');
		$this->load->view('administrator/dashboard', $data);
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