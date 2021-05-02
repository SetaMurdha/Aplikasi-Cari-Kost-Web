<?php
class Registration extends CI_Controller{
    public function user_registration(){
        $this->load->model('auth_model');
        $this->load->view('template/header');
		$this->load->view('administrator/user_reg');
    }
    public function admin_registration(){
        $this->load->model('auth_model');
        $this->load->view('template/header');
		$this->load->view('administrator/admin_reg');
    }
    public function send_user_data(){
        $nama = $this->input->post('nama');
        $ttl = $this->input->post('ttl');
        $email = $this->input->post('email');
        $jenis_kelamin = $this->input->post('jenis_kelamin');
        $password = $this->input->post('password');

        $data = [
            "nama"=>$nama,
            "ttl"=>$ttl,
            "jenis_kelamin"=>$jenis_kelamin,
            "email"=>$email,
            "password"=>password_hash($password,PASSWORD_DEFAULT),
        ];

        $this->auth_model->register('user',$data);
        $this->session->set_flashdata('message',"<div class='alert alert-success alert-dismissible fade show' role='alert'>
        Berhasil membuat akun !!! silahkan kembali ke halaman login.
        <button type='button' class='close' data-dismiss='alert' aria-label='Close'>
            <span aria-hidden='true'>&times;</span>
        </button>
        </div>");
        redirect("Registration/user_registration");
    }

    public function send_admin_data(){
        $nama = $this->input->post('nama');
        $ttl = $this->input->post('ttl');
        $email = $this->input->post('email');
        $jenis_kelamin = $this->input->post('jenis_kelamin');
        $password = $this->input->post('password');

        $data = [
            "nama"=>$nama,
            "ttl"=>$ttl,
            "jenis_kelamin"=>$jenis_kelamin,
            "email"=>$email,
            "password"=>password_hash($password,PASSWORD_DEFAULT),
        ];

        $this->auth_model->register('admin',$data);
        $this->session->set_flashdata('message',"<div class='alert alert-success alert-dismissible fade show' role='alert'>
        Berhasil membuat akun !!! silahkan kembali ke halaman login.
        <button type='button' class='close' data-dismiss='alert' aria-label='Close'>
            <span aria-hidden='true'>&times;</span>
        </button>
        </div>");
        redirect("Registration/admin_registration");
    }
}
?>