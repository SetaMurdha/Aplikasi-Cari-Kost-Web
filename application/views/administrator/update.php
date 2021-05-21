<div class="main-panel">
            <!-- Navbar -->
            <nav class="navbar navbar-expand-lg " color-on-scroll="500">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#"> Update Profil </a>
                    <button href="" class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-bar burger-lines"></span>
                        <span class="navbar-toggler-bar burger-lines"></span>
                        <span class="navbar-toggler-bar burger-lines"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-end" id="navigation">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item">
                                <a class="nav-link" href=<?=base_url().'login_controller/logout'?>>
                                <i class="fa fa-sign-out mr-2"></i> Sign out
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- End Navbar -->
            <div class="content">
                <div class="container-fluid">
                        <?=form_open_multipart("administrator/profil/send_profil")?>
                            <?=$this->session->flashdata('pesan')?>
                            <div class="form-group">
                                <label>Nama </label>
                                <input type="text" name="nama" placeholder="Masukkan Nama Lengkap" value="<?=$admin['nama']?>" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Tanggal Lahir</label>
                                <input type="date" name="ttl"  class="form-control" value="<?=$admin['ttl']?>">
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <input type="text" name="email" placeholder="Masukkan Email" class="form-control" value="<?=$admin['email']?>">
                            </div>
                            <div class="form-group">
                                <label>Jenis Kelamin</label>
                                <select name="kelamin" class="form-control form-control">
                                <?php if($admin['jenis_kelamin']=="Laki-laki"){?>
                                    <option value="Laki-laki" selected>Laki - laki</option>
                                    <option value="Perempuan">Perempuan</option>
                                    <?php }else{?>
                                    <option value="Laki-laki">Laki - laki</option>
                                    <option value="Perempuan" selected>Perempuan</option>
                                <?php }?>
                                </select>
                            </div>
                            <input type="file" name="foto">
                            <input type="hidden" name="nmfoto" value="<?= $admin['foto']?>">
                            <button type="submit" class="btn btn-primary">Simpan</button>
                        <?=form_close()?>

                </div>
            </div>
            