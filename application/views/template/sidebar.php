
<body>
    <div class="wrapper">
        <div class="sidebar" data-image="../assets/img/sidebar-5.jpg">
            <!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"

        Tip 2: you can also add an image using data-image tag
    -->
            <div class="sidebar-wrapper">
                <div class="logo">
                    <a href="<?php echo base_url('administrator/dashboard') ?>" class="simple-text">
                        Cari Kost
                    </a>
                </div>
                <ul class="nav">
                    <li class="nav-item">
                        <a class="nav-link" href="<?php echo base_url('administrator/dashboard') ?>">
                            <i class="nc-icon nc-chart-pie-35"></i>
                            <p>Dashboard</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="<?php echo base_url('administrator/profil') ?>">
                            <i class="nc-icon nc-circle-09"></i>
                            <p>Profil Pengguna</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="<?php echo base_url('administrator/daftar_kost') ?>">
                            <i class="nc-icon nc-notes"></i>
                            <p>Daftar Kost</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="<?php echo base_url('administrator/maps') ?>">
                            <i class="nc-icon nc-pin-3"></i>
                            <p>Lokasi Kost</p>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        