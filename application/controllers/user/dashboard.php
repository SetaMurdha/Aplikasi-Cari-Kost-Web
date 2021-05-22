<?php 

class Dashboard extends CI_Controller{
	public function index(){
		$data['_peta']  = $this->auth_model->dataMap();
		$id=$this->session->userdata('iduser');
		if($id!=null){
		$this->load->view('template/header');
		$this->load->view('user/sidebar');
		$this->load->view('user/dashboard',$data);
		$this->load->view('template/footer');
		}else{
			redirect("login_controller/index");
		}
	}
	public function detail($idkost){
		$id = $this->session->userdata("iduser");
		if($id!=null){
			$this->load->model('main_model');
			$data["user"]=$this->main_model->get_user_where(["id"=>$id]);
			$data["kost"]=$this->main_model->tampil_kost_where(["id"=>$idkost]);
			$where=[
				"id_user"=>$id,
				"id_kost"=>$idkost
			];
			$data["favorit"]=$this->main_model->cek_favorite($where);
			$this->load->view('template/header');
			$this->load->view('user/sidebar');
			$this->load->view('user/detail_kost',$data);
			$this->load->view('template/footer');
		}else{
			redirect("login_controller/index");
		}
	}
}