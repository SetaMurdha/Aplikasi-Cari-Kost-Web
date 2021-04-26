<?php 

class Maps extends CI_Controller{
	public function index(){
		$this->load->view('template/header');
		$this->load->view('template/sidebar');
		$this->load->view('administrator/maps');
		$this->load->view('template/footer');
	}
}