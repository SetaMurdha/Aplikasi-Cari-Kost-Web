<?php 

class Maps extends CI_Controller{
	public function index(){
		$map['map'] = $this->auth_model->dataMap();
		$this->load->view('template/header');
		$this->load->view('template/sidebar');
		$this->load->view('administrator/maps',$map);
		$this->load->view('template/footer');
	}
}