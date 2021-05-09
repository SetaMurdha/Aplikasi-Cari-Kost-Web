<?php
class Login_controller extends CI_Controller
{
	public function index()
	{
		$this->form_validation->set_rules('email', 'Email', 'trim|required|valid_email');
		$this->form_validation->set_rules('password', 'Password', 'trim|required|min_length[8]');
		if ($this->form_validation->run() == false) {
			$this->load->view('template/header');
			$this->load->view('administrator/login');
		}else{
			$this->_login();
		}
	}

	private function _login(){
		$email = $this->input->post('email');
		$password = $this->input->post('password');
		$user = $this->db->get_where('user', ['email' => $email])->row_array();
		$admin = $this->db->get_where('admin', ['email' => $email])->row_array();
		if($user!=null){
			if(password_verify($password, $user['password'])){
				$this->session->set_userdata("iduser",$user["id"]);
				redirect('user/dashboard');
			}else{
				$this->session->set_flashdata('pesan',"<div class='alert alert-danger alert-dismissible' role='alert'>
				<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>
				<strong>Username atau Passworrd Salah !!!</strong>
			  	</div>");
				redirect("login_controller/index");
			}
		}
		else if($admin!=null){
				if(password_verify($password, $admin['password'])){
					$this->session->set_userdata("idadmin",$admin["id"]);
					redirect('administrator/dashboard');
				}else{
					$this->session->set_flashdata('pesan',"<div class='alert alert-danger alert-dismissible' role='alert'>
					<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>
					<strong>Username atau Passworrd Salah !!!</strong>
					</div>");
					redirect("login_controller/index");
				}
		}else{
			$this->session->set_flashdata('pesan',"<div class='alert alert-danger alert-dismissible' role='alert'>
			<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>
			<strong>Akun tidak ditemukan !!!</strong>
			</div>");
			redirect("login_controller/index");
		}
	}

	public function logout(){
		$this->session->unset_userdata("iduser");
		$this->session->unset_userdata("idadmin");
		redirect("login_controller/");
	}
}
