<?php 

class Daftar_kost extends CI_Controller{
	public function index(){
		$id = $this->session->userdata("idadmin");
		if($id!=null){
		$this->load->model('main_model');
		$data['kost'] = $this->main_model->tampil_data_kost();
		$this->load->view('template/header');
		$this->load->view('administrator/sidebar');
		$this->load->view('administrator/daftar_kost', $data);
		$this->load->view('template/footer');
		}else{
			redirect("login_controller/index");
		}
	}

	public function input_kost(){
		$id = $this->session->userdata("idadmin");
		if($id!=null){
			$this->form_validation->set_rules("nm_kost","Nama Pemilik","required");
			$this->form_validation->set_rules("nm_pemilik","Nama Pemilik","required");
			$this->form_validation->set_rules("alamat","Alamat","required");
			$this->form_validation->set_rules("biaya","Biaya","required");
			$this->form_validation->set_rules("longitude","Longitude","required|decimal");
			$this->form_validation->set_rules("latitude","Latitude","required|decimal");
			if($this->form_validation->run()==false){
				$this->load->model('main_model');
				$data["kota_kab"]=$this->main_model->tampil_kota_kab();
				$this->load->view('template/header');
				$this->load->view('administrator/sidebar');
				$this->load->view('administrator/daftar_kost_form',$data);
				$this->load->view('template/footer');
			}else{
				$this->_send_data_kost();
			}
		}else{
			redirect("login_controller/index");
		}
	}

	private function _send_data_kost(){
		$nm_kost = $this->input->post("nm_kost");
		$nm_pemilik = $this->input->post("nm_pemilik");
		$alamat = $this->input->post("alamat");
		$telepon= $this->input->post("tlepon");
		$kota_kab = $this->input->post("id_kota_kab");
		$jenis = $this->input->post("jenis");
		$pembayaran =  $this->input->post("pembayaran");
		$biaya = $this->input->post("biaya");
		$lat = $this->input->post("latitude");
		$long = $this->input->post("longitude");

		$data = [
			"nmkost"=>$nm_kost,
			"pemilik"=>$nm_pemilik,
			"alamat"=>$alamat,
			"telepon"=>$telepon,
			"id_kota_kab"=>$kota_kab,
			"jenis"=>$jenis,
			"pembayaran"=>$pembayaran,
			"harga"=>$biaya,
			"latitude"=>$lat,
			"longitude"=>$long
		];

		$this->main_model->input_kost($data);
		$this->session->set_flashdata('pesan',"<div class='alert alert-success alert-dismissible' role='alert'>
				<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>
				<strong>Berhasil Input</strong>
			  	</div>");
		redirect("administrator/daftar_kost/input_kost");
	}
}