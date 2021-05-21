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
	public function update_profil(){
		$id = $this->session->userdata("iduser");
		if($id!=null){
		$this->load->model('main_model');
		$data['user'] = $this->main_model->get_user_where(["id"=>$id]);
		$this->load->view('template/header');
		$this->load->view('user/sidebar');
		$this->load->view('user/update', $data);
		$this->load->view('template/footer');
		}else{
			redirect("login_controller/index");
		}
	}

	public function send_profil(){
		$id = $this->session->userdata("iduser");
		$nama = $this->input->post('nama');
		$email = $this->input->post('email');
		$ttl = $this->input->post('ttl');
		$jenis_kelamin =$this->input->post('kelamin');
		$nmfoto = $this->input->post('nmfoto');
		$foto = $_FILES['foto'];

		if($foto!=null){
			$config["upload_path"]="./assets/img/user";
			$config["allowed_types"]="jpg|png|jpeg";
			$config["max_size"]=500;
			$config["encrypt_name"]=true;
			$this->load->library('upload',$config);
			if($this->upload->do_upload('foto')){
				$nmfoto=$this->upload->data('file_name');
			}
		}

		$data=[
			"nama"=>$nama,
			"ttl"=>$ttl,
			"jenis_kelamin"=>$jenis_kelamin,
			"email"=>$email,
			"foto"=>$nmfoto
		];

		$this->main_model->update_user(["id"=>$id],$data);
		redirect("user/profil");
	}
}