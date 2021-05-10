<div class="main-panel">
            <!-- Navbar -->
            <nav class="navbar navbar-expand-lg " color-on-scroll="500">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#"> Update Data Kost </a>
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
                        <form method="POST" action="<?=base_url().'administrator/daftar_kost/update_kost/'.$kost['id']?>">
                            <?=$this->session->flashdata('pesan')?>
                            <input type="hidden" name="idkost" value="<?php $kost['id']?>">
                            <div class="form-group">
                                <label>Nama Kost</label>
                                <input type="text" name="nm_kost" placeholder="Masukkan Nama Kost" class="form-control" value="<?=$kost['nmkost']?>">
                            </div>
                            <div class="form-group">
                                <label>Nama Lengkap Pemilik</label>
                                <input type="text" name="nm_pemilik" placeholder="Masukkan Nama Pemilik" class="form-control" value="<?=$kost['pemilik']?>">
                            </div>
                            <div class="form-group">
                                <label>Alamat Kost</label>
                                <input type="text" name="alamat" placeholder="Masukkan Alamat" class="form-control" value="<?=$kost['alamat']?>">
                            </div>
                            <div class="form-group">
                                <label>Nomer Telepon</label>
                                <input type="text" name="telepon" placeholder="Masukkan Nomer Telepon" class="form-control" value="<?=$kost['telepon']?>">
                            </div>
                            <div class="form-group">
                                <label>Jenis Kost</label>
                                <select name="jenis" class="form-control form-control">
                                    <?php if ($kost["jenis"]=="Putra"){?>
                                        <option value="Putra" selected>Putra</option>
                                        <option value="Putri">Putri</option>
                                    <?php }else{ ?>
                                        <option value="Putra">Putra</option>
                                        <option value="Putri"selected>Putri</option>
                                    <?php }?>
                                </select>
                            </div>   
                            <div class="form-group">
                                <label>Kota / Kabupaten</label>
                                <select name="id_kota_kab" class="form-control form-control">
                                    <?php $no=1;
                                    foreach($kota_kab as $dt):
                                        if($dt["nm_kota_kab"]==$kost["nm_kota_kab"]){
                                    ?>
                                        <option value=<?=$dt["id"]?> selected><?=$dt["nm_kota_kab"]?></option>
                                    <?php } else {?>
                                        <option value=<?=$dt["id"]?> selected><?=$dt["nm_kota_kab"]?></option>
                                    <?php } endforeach;?>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Biaya</label>
                                <input type="text" name="biaya" placeholder="Masukkan Biaya Kost" class="form-control" value="<?=$kost['harga']?>">
                                
                            </div>
                            <div class="form-group">
                                <label>Jenis Pembayaran</label>
                                <select name="pembayaran" class="form-control form-control">
                                    <?php if($kost["pembayaran"]=="Bulanan"){?>
                                        <option value="Bulanan" selected>Bulanan</option>
                                        <option value="Setengah Tahun">Setengah Tahun</option>
                                        <option value="Tahunan">Tahunan</option>
                                    <?php }else if($kost["pembayaran"]=="Setengah Tahun"){?>
                                        <option value="Bulanan">Bulanan</option>
                                        <option value="Setengah Tahun" selected>Setengah Tahun</option>
                                        <option value="Tahunan">Tahunan</option>
                                    <?php } else{?>
                                        <option value="Bulanan">Bulanan</option>
                                        <option value="Setengah Tahun">Setengah Tahun</option>
                                        <option value="Tahunan" selected>Tahunan</option>
                                    <?php }?>
                                </select>
                            </div>   
                            <div class="form-group">
                                <label>Longitude</label>
                                <input type="text" name="longitude" placeholder="Masukkan Longitude" class="form-control" value="<?=$kost['longitude']?>">
                                
                            </div>
                            <div class="form-group">
                                <label>Latitude</label>
                                <input type="text" name="latitude" placeholder="Masukkan Latitude" class="form-control" value="<?=$kost['latitude']?>">
                                <i>*Contoh penulisan longitude / latitude : 112.896857</i>
                            </div>
                            <button type="submit" class="btn btn-primary">Simpan</button>
                        </form>

                </div>
            </div>
            