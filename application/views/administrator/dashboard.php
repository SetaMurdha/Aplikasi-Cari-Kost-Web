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








    <body>
        <script src='https://api.mapbox.com/mapbox.js/plugins/leaflet-fullscreen/v1.0.1/Leaflet.fullscreen.min.js'></script>
        <link href='https://api.mapbox.com/mapbox.js/plugins/leaflet-fullscreen/v1.0.1/leaflet.fullscreen.css' rel='stylesheet' />
        <div class="wrap mx-auto mt-4 mb-3" style="width:80%;height:100px;display:flex;flex-direction:row;justify-content:space-evenly;flex-wrap:wrap;margin-bottom:100px">
            <div class="column">
                <i class="fa fa-home text-primary ml-4" style="font-size:90px;margin:auto"></i>
                <h1 class="mx-auto h3" style="font-weight:600;">Kost : <?= count($kost) ?></h1>
            </div>
            <div class="column">
                <i class="fa fa-map-marker text-primary ml-4" style="font-size:90px;margin:auto"></i>
                <h1 class="mx-auto h3" style="font-weight:600;">Kota : <?= count($kota) ?></h1>
            </div>
            <div class="column">
                <i class="fa fa-users text-primary ml-4" style="font-size:90px;margin:auto"></i>
                <h1 class="mx-auto h3" style="font-weight:600;">Users : <?= count($user) ?></h1>
            </div>
        </div>
    </body>

    <div id="map" class="mx-auto " style="height:500px;width:80%;border-radius:15px;margin-top:80px"></div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
    <script>
        L.mapbox.accessToken = 'pk.eyJ1Ijoia3VybmlhMzEzIiwiYSI6ImNrbjc4dWg0djBsZWYybnFmb3R3eXNqcG8ifQ.8bBe577KnxhA934TRoXebQ';
        var map = L.mapbox.map('map')
            .setView([-7.9495459, 112.6066666], 15)
            .addLayer(L.mapbox.styleLayer('mapbox://styles/mapbox/streets-v11'))
            .addControl(L.mapbox.geocoderControl('mapbox.places', {
                autocomplete: true
            }));


        L.control.fullscreen().addTo(map);


        var myLayer = L.mapbox.featureLayer().addTo(map);
        var geojson = {
            "type": "FeatureCollection",
            "features": [
                <?php
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
                  'url' : 'http://localhost/Aplikasi-Cari-Kost-Web/administrator/daftar_kost/update_kost/$id'
                },
                'geometry':{
                  'type':'Point',
                  'coordinates':['$long','$lat'],
                },
              },";
                // }
                endforeach;
                ?>
            ]
        };


        myLayer.setGeoJSON(geojson);
        myLayer.on('click', function(e) {
            window.open(e.layer.feature.properties.url);
        });
    </script>