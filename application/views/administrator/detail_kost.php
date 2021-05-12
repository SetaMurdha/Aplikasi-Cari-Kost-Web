<div class="main-panel">
    <link rel="stylesheet" href=<?=base_url().'assets/css/admin-detailkost.css'?>>
    <nav class="navbar navbar-expand-lg " color-on-scroll="500">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#"> Detail Kost </a>
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
        <h3 class="mb-3"><?=$kost["nmkost"]?></h3>
        <div class="row">
        <img 
        <?php if($kost["foto"]==null){?>
        src="<?=base_url().'assets/img/Home.png'?>"
        <?php }else{?>
            src="<?=base_url().'assets/img/gambar_kost/'.$kost['foto']?>"
            <?php }?>
            height="300" class="ml-3 mb-3 mr-5" alt="">
            <table border="0" style="width: 60%">
                    <tr>
                        <th>Pemilik Kost </th>
                        <td> : <?=$kost["pemilik"]?></td>
                    </tr>
                    <tr>
                        <th>Jenis </th>
                        <td> : Kost <?=$kost["jenis"]?></td>
                    </tr>
                    <tr>
                        <th>Pembayaran </th>
                        <td> :  <?=$kost["pembayaran"]?></td>
                    </tr>
                    <tr>
                        <th>Harga </th>
                        <td> : Rp <?=number_format($kost["harga"],0,',','.')?></td>
                    </tr>
                    <tr>
                        <th>Nomer Telepon </th>
                        <td> : <?=$kost["telepon"]?></td>
                    </tr>
                    <tr>
                        <th>Alamat </th>
                        <td> : <?=$kost["alamat"]?></td>
                    </tr>
                    <tr>
                        <th>Latitude </th>
                        <td> : <?=$kost["latitude"]?></td>
                    </tr>
                    <tr>
                        <th>Longitude </th>
                        <td> : <?=$kost["longitude"]?></td>
                    </tr>
                    <tr>
                        <td><button class="btn btn-info mt-3 btn-sm" id="showMap">Lihat Peta</button></td>
                    </tr>
            </table></div>
            <div class="fullScreen hide">
                <i class="fa fa-close mr-2" id="closeMap"></i>
                <div id="map" class="mx-auto" ></div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(()=>{
            

            $("#showMap").click(()=>{
               $(".fullScreen").removeClass("hide");
               var map = L.map('map').setView([<?=$kost["latitude"]?>, <?=$kost["longitude"]?>], 18);
               L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoicGFyYW1hYWRtYWphIiwiYSI6ImNrbjNyeGh5dTFraDgybm5ucDd2aDJ3MWIifQ.gnRXF2tLkHif9r-N2f236Q', {
                attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
                maxZoom: 18,
                id: 'mapbox/streets-v11',
                tileSize: 512,
                zoomOffset: -1,
                accessToken: 'your.mapbox.access.token'
            }).addTo(map);

            L.marker([<?=$kost["latitude"]?>, <?=$kost["longitude"]?>]).addTo(map)
                .bindPopup("<?='<center><b>'.$kost['nmkost'].'</center></b>'.'<center>'.$kost['alamat'].'</center>'?>").openPopup();
            });
            $("#closeMap").click(()=>{
                $(".fullScreen").addClass("hide");
            });
        });
        

        // L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        //     attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
        // }).addTo(map);

       
    </script>