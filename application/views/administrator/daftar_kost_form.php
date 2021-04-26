<div class="main-panel">
            <!-- Navbar -->
            <nav class="navbar navbar-expand-lg " color-on-scroll="500">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#pablo"> Daftar Kost </a>
                    <button href="" class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-bar burger-lines"></span>
                        <span class="navbar-toggler-bar burger-lines"></span>
                        <span class="navbar-toggler-bar burger-lines"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-end" id="navigation">
                        <ul class="nav navbar-nav mr-auto">
                            <li class="nav-item">
                                <a href="#" class="nav-link" data-toggle="dropdown">
                                    <i class="nc-icon nc-palette"></i>
                                    <span class="d-lg-none">Daftar Kost</span>
                                </a>
                            </li>
                            <li class="dropdown nav-item">
                                <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
                                    <i class="nc-icon nc-planet"></i>
                                    <span class="notification">5</span>
                                    <span class="d-lg-none">Notification</span>
                                </a>
                                <ul class="dropdown-menu">
                                    <a class="dropdown-item" href="#">Notification 1</a>
                                    <a class="dropdown-item" href="#">Notification 2</a>
                                    <a class="dropdown-item" href="#">Notification 3</a>
                                    <a class="dropdown-item" href="#">Notification 4</a>
                                    <a class="dropdown-item" href="#">Another notification</a>
                                </ul>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="nc-icon nc-zoom-split"></i>
                                    <span class="d-lg-block">&nbsp;Cari Kost</span>
                                </a>
                            </li>
                        </ul>
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="<?php echo base_url('administrator/profil') ?>">
                                    <span class="no-icon">Profil</span>
                                </a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="no-icon">Dropdown</span>
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                    <a class="dropdown-item" href="#">Action</a>
                                    <a class="dropdown-item" href="#">Another action</a>
                                    <a class="dropdown-item" href="#">Something</a>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                    <div class="divider"></div>
                                    <a class="dropdown-item" href="#">Separated link</a>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#pablo">
                                    <span class="no-icon">Log out</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- End Navbar -->
            <div class="content">
                <div class="container-fluid">
                        <form method="POST" action="<?php echo base_url('administrator/kelas/tambah_kelas_aksi') ?>">
                            <div class="form-group">
                                <label>Pemilik Kost</label>
                                <input type="text" name="" placeholder="Masukkan Nama Pemilik" class="form-control">
                                
                            </div>
                            <div class="form-group">
                                <label>Alamat Kost</label>
                                <input type="text" name="" placeholder="Masukkan Alamat" class="form-control">
                                
                                <br>
                                <input type="text" name="" placeholder="Masukkan Kota" class="form-control">
                                
                                <br>
                                <input type="text" name="" placeholder="Masukkan Provinsi" class="form-control">
                                
                            </div>
                            <div class="form-group">
                                <label>Harga Sewa</label>
                                <input type="text" name="" placeholder="Masukkan Harga Sewa" class="form-control">
                                
                            </div>
                            <div class="form-group">
                                <label>Longitude</label>
                                <input type="text" name="" placeholder="Masukkan Longitude" class="form-control">
                                
                            </div>
                            <div class="form-group">
                                <label>Latitude</label>
                                <input type="text" name="" placeholder="Masukkan Latitude" class="form-control">
                                
                            </div>
                            <button type="submit" class="btn btn-primary">Simpan</button>
                        </form>

                </div>
            </div>
            