<?php 

class Daftar_kost extends CI_Controller{
	public function index(){
		$this->load->view('template/header');
		$this->load->view('template/sidebar');
		$this->load->view('administrator/daftar_kost');
		$this->load->view('template/footer');
	}

	public function input_kost(){
			$this->load->view('template/header');
		$this->load->view('template/sidebar');
		$this->load->view('administrator/daftar_kost_form');
		$this->load->view('template/footer');
	}
}