<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href=<?=base_url()."assets/css/account_registration.css"?>>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 

</head>
<body>
<div class="login-form">
    <form action=<?=base_url()."registration/send_admin_data"?> method="post">
        <h2 class="text-center">Halaman Daftar Akun Admin</h2>
        <?=$this->session->flashdata('message')?>
        <div class="form-group">
        	<input type="text" class="form-control" name="nama" placeholder="Nama Lengkap" required>
        </div>
        <div class="form-group">
        	<input type="date" class="form-control" name="ttl" placeholder="Tanggal Lahir" required>
        </div>
        <div class="form-group">
            <select name="jenis_kelamin">
                <option value="Laki-laki">Laki-laki</option>
                <option value="Perempuan">Perempuan</option>
            </select>
        </div>
        <div class="form-group">
        	<input type="text" class="form-control" name="email" placeholder="Email" required>
        </div>
		<div class="form-group">
            <input type="password" class="form-control" name="password" placeholder="Password" required>
        </div>        
        <div class="form-group">
            <button type="submit" class="btn btn-primary btn-lg btn-block">Submit</button>
        </div>
		<center><h5><a href=<?=base_url()."login_controller/"?>  style="color:#702edb">Kembali ke login</a></h5></center>
	</form>
</div>
</body>
</html>                            