<?php
class Login_controller extends CI_Controller
{
	public function index()
	{
		$this->form_validation->set_rules('nama', 'Nama', 'trim|required');
		$this->form_validation->set_rules('password', 'Password', 'trim|required');
		if ($this->form_validation->run() == false) {
			$this->load->view('template/header');
			$this->load->view('administrator/login');
		}else{
			$this->_login();
		}
	}

	private function _login(){
		$nama = $this->input->post('nama');
		$password = $this->input->post('password');

		$user = $this->db->get_where('user', ['nama' => $nama])->row_array();
		// var_dump($user);
		// die;
		if($user){

			if(password_verify($password, $user['password'])){
				// if($password == $user['password']){  <-- untuk password yg tidak dienskripsi
				$data = [
					'ttl' => $user['ttl'],
					'email'=> $user['email'],
					'jenis_kelamin' => $user['jenis_kelamin'],
					'nama' => $nama['nama'],
					'foto' => $nama['foto']
				];

				$this->session->set_userdata($data);
				redirect('administrator/dashboard');
			}else{
				$this->session->set_flashdata('pesan','Password salah');
				redirect();
			}
		}else{
			$this->session->set_flashdata('pesan','username tidak terdaftar');
			redirect();
		}
	}
}
