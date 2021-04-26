<?php 
class Auth extends CI_Controller{
	public function index(){
		$this->load->view('template/header');
		$this->load->view('administrator/login');
	}
}