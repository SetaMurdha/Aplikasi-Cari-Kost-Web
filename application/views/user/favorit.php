<link rel="stylesheet" href="<?=base_url().'assets/css/user_dashboard.css'?>">
<div class="main-panel">
            <!-- Navbar -->
            <nav class="navbar navbar-expand-lg " color-on-scroll="500">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#"> Favorit</a>
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
                <div class="container">
                    <?php
                        foreach($favorit as $x){
                    ?>
                    <a href="<?=base_url().'user/dashboard/detail/'.$x['id_kost']?>">
                        <div class="item mt-3">
                            <div class="image">
                                <img src="<?=base_url().'/assets/img/gambar_kost/'.$x["foto"]?>" height="200" alt="">
                            </div>
                            <div class="contents ml-4">
                                <h1><?=$x["nmkost"]?></h1>
                                <button class="btn btn-sm btn-success"><?=$x["pembayaran"]?></button><button class="btn btn-sm ml-2 btn-success"><?=$x["jenis"]?></button>
                                <h3><?=$x["nm_kota_kab"]?></h3>
                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
                            </div>
                            <div class="harga">
                                <h3>Rp <?=number_format($x["harga"],0,',','.')?></h3>
                            </div>
                        </div></a>
                    <?php } ?>
                </div>
            </div>
            