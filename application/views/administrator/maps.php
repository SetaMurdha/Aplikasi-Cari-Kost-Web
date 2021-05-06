<div class="main-panel">
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg " color-on-scroll="500">
        <div class="container-fluid">
            <a class="navbar-brand" href="#pablo"> Lokasi </a>
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
                            <span class="d-lg-none">Lokasi</span>
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
    <link href="https://api.mapbox.com/mapbox-gl-js/v2.2.0/mapbox-gl.css" rel="stylesheet">
    <script src="https://api.mapbox.com/mapbox-gl-js/v2.2.0/mapbox-gl.js"></script>
    <div class="content">
        <div class="container-fluid">
            <div class="alert alert-success" role="alert">
                Lokasi Kost
            </div>
            <center>
                <div class="map-container">
                    <div id='map' style='width: 800px; height: 600px;'></div>
                    <script>
                        mapboxgl.accessToken = 'pk.eyJ1Ijoia3VybmlhMzEzIiwiYSI6ImNrbjc4dWg0djBsZWYybnFmb3R3eXNqcG8ifQ.8bBe577KnxhA934TRoXebQ';
                        var map = new mapboxgl.Map({
                            container: 'map',
                            style: 'mapbox://styles/mapbox/streets-v11',
                            center: [-96, 37.8],
                            zoom: 3
                        });

                        map.on('load', function() {
                            // Add an image to use as a custom marker
                            map.loadImage(
                                'https://docs.mapbox.com/mapbox-gl-js/assets/custom_marker.png',
                                function(error, image) {
                                    if (error) throw error;
                                    map.addImage('custom-marker', image);
                                    // Add a GeoJSON source with 2 points
                                    map.addSource('points', {
                                        'type': 'geojson',
                                        'data': {
                                            'type': 'FeatureCollection',
                                            'features': [{
                                                    // feature for Mapbox DC
                                                    'type': 'Feature',
                                                    'geometry': {
                                                        'type': 'Point',
                                                        'coordinates': [
                                                            -77.03238901390978,
                                                            38.913188059745586
                                                        ]
                                                    },
                                                    'properties': {
                                                        'title': 'Mapbox DC'
                                                    }
                                                },
                                                {
                                                    // feature for Mapbox SF
                                                    'type': 'Feature',
                                                    'geometry': {
                                                        'type': 'Point',
                                                        'coordinates': [-122.414, 37.776]
                                                    },
                                                    'properties': {
                                                        'title': 'Mapbox SF'
                                                    }
                                                }
                                            ]
                                        }
                                    });

                                    // Add a symbol layer
                                    map.addLayer({
                                        'id': 'points',
                                        'type': 'symbol',
                                        'source': 'points',
                                        'layout': {
                                            'icon-image': 'custom-marker',
                                            // get the title name from the source's "title" property
                                            'text-field': ['get', 'title'],
                                            'text-font': [
                                                'Open Sans Semibold',
                                                'Arial Unicode MS Bold'
                                            ],
                                            'text-offset': [0, 1.25],
                                            'text-anchor': 'top'
                                        }
                                    });
                                }
                            );
                        });


                        map.addControl(new mapboxgl.NavigationControl());
                    </script>

                </div>
            </center>
        </div>
    </div>
</div>