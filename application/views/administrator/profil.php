<div class="main-panel">
    <link rel="stylesheet" href=<?=base_url().'assets/css/admin-detailkost.css'?>>
    <nav class="navbar navbar-expand-lg " color-on-scroll="500">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#"> Profil Admin </a>
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
        <div class="row">
        <?php if($admin['foto']!=null){?>
            <img src=<?=base_url()."assets/img/admin/".$admin['foto']?> height="200" class="ml-3 mb-3 mr-5" alt="">
        <?php }else{ ?>
            <img src=<?=base_url()."assets/img/profil.png"?> height="200" class="ml-3 mb-3 mr-5" alt="">  
        <?php }?>
            <table border="0" style="width: 60%">
                    <tr>
                        <th>Nama </th>
                        <td> : <?=$admin["nama"]?></td>
                    </tr>
                    <tr>
                        <th>Tanggal Lahir  </th>
                        <td> : <?=$admin["ttl"]?></td>
                    </tr>
                    <tr>
                        <th>Jenis Kelamin </th>
                        <td> :  <?=$admin["jenis_kelamin"]?></td>
                    </tr>
                    <tr>
                        <th>Email </th>
                        <td> : <?=$admin["email"]?></td>
                    </tr>
                    <tr>
                        <td><a href="<?=base_url().'administrator/profil/update_profil'?>"><button class="btn btn-primary mt-3">Edit</button></a></td>
                    </tr>
            </table></div>
            <div class="fullScreen hide">
                <i class="fa fa-close mr-2" id="closeMap"></i>
                <div id="map" class="mx-auto" ></div>
            </div>
        </div>
    </div>