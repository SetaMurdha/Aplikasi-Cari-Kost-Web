<link rel="stylesheet" href="<?= base_url() . 'assets/css/user_dashboard.css' ?>">
<div class="main-panel">
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg " color-on-scroll="500">
        <div class="container-fluid">
            <a class="navbar-brand" href="#"> Dashboard </a>
            <button href="" class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-bar burger-lines"></span>
                <span class="navbar-toggler-bar burger-lines"></span>
                <span class="navbar-toggler-bar burger-lines"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navigation">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href=<?= base_url() . 'login_controller/logout' ?>>
                            <i class="fa fa-sign-out mr-2"></i> Sign out
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- End Navbar -->
    <div class="content">
        <div class="form-inline mb-2">
            <input type="text" class="form-control col-md-6" id="searchField" placeholder="Ketik nama kost atau alamat" aria-describedby="emailHelp">
            <button class="btn btn-info ml-2" id="searchBtn">Cari</button>
        </div>
        <div class="filter mb-6">
            Filter by :
            <button type="button" class="btn btn-info ml-3 btn-sm pilihKota" data-toggle="modal" data-target="#pilihKota">Kota / Kabupaten : Semua</button>
            <button type="button" class="btn btn-info ml-1 btn-sm pilihPembayaran" data-toggle="modal" data-target="#pilihPembayaran">Pembayaran : Semua</button>
            <button type="button" class="btn btn-info ml-1 btn-sm pilihJenis" data-toggle="modal" data-target="#pilihJenis">Jenis : Semua</button>

        </div>
        <!-- Modal -->
        <div class="modal fade" id="pilihKota" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Pilih Kota</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="filterKota" id="exampleRadios1" value="Semua" checked>
                            <label class="form-check-label" for="exampleRadios1">
                                Semua
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="filterKota" id="exampleRadios1" value="Kota Malang">
                            <label class="form-check-label " for="exampleRadios1">Kota Malang
                            </label>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="pilihJenis" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Pilih Jenis</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="filterJenis" id="exampleRadios2" value="Semua" checked>
                            <label class="form-check-label" for="exampleRadios2">
                                Semua
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="filterJenis" id="exampleRadios2" value="Putra">
                            <label class="form-check-label" for="exampleRadios2">
                                Kost Putra
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="filterJenis" id="exampleRadios3" value="Putri">
                            <label class="form-check-label" for="exampleRadios3">
                                Kost Putri
                            </label>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="pilihPembayaran" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Pilih Pembayaran</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="filterPembayaran" id="exampleRadios2" value="Semua" checked>
                            <label class="form-check-label" for="exampleRadios2">
                                Semua
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="filterPembayaran" id="exampleRadios2" value="Bulanan">
                            <label class="form-check-label" for="exampleRadios2">
                                Bulanan
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="filterPembayaran" id="exampleRadios3" value="Setengah Tahun">
                            <label class="form-check-label" for="exampleRadios3">
                                Setengah Tahun
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="filterPembayaran" id="exampleRadios3" value="Tahunan">
                            <label class="form-check-label" for="exampleRadios3">
                                Tahunan
                            </label>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <img src="../../assets/img/gambar_kost/4f9ac69cf6d9fd2ecb0b05669d5f5089.png" height="200" alt="">



            <div id="map" class="mx-auto " style="height:500px;width:80%;border-radius:15px;"></div>

            <script>
                L.mapbox.accessToken = 'pk.eyJ1Ijoia3VybmlhMzEzIiwiYSI6ImNrbjc4dWg0djBsZWYybnFmb3R3eXNqcG8ifQ.8bBe577KnxhA934TRoXebQ';
                var map = L.mapbox.map('map')
                    .addControl(L.mapbox.geocoderControl('mapbox.places', {
                        autocomplete: true
                    }))
                    .setView([-7.9495459, 112.6066666], 15)
                    .addLayer(L.mapbox.styleLayer('mapbox://styles/mapbox/streets-v11'));

                var myLayer = L.mapbox.featureLayer().addTo(map);

                // The GeoJSON representing the two point features
                var geojson = {
                    type: 'FeatureCollection',
                    features: [<?php
                                foreach ($_peta as $row) :
                                    // while ($row = mysqli_fetch_assoc($result)) {
                                    $id = $row['id'];
                                    $nama = $row['nmkost'];
                                    $long = $row['longitude'];
                                    $lat = $row['latitude'];
                                    echo "{'type':'Feature',
                'properties':{
                  'title' : '$nama',
                  'marker-color':'#f86767',
                  'marker-size':'large',
                  'marker-symbol':'star-stroked',
                  'url' : 'http://localhost/Aplikasi-Cari-Kost-Web/user/dashboard/detail/$id'
                },
                'geometry':{
                  'type':'Point',
                  'coordinates':['$long','$lat'],
                },
              },";
                                // }
                                endforeach;
                                ?>]
                };

                // Pass features and a custom factory function to the map
                myLayer.setGeoJSON(geojson);
                myLayer.on('click', function(e) {
                    window.open(e.layer.feature.properties.url);
                });
            </script>
        </div>
    </div>
</div>


<script src="<?= base_url() . 'assets/js/user-dashboard.js' ?>"></script>