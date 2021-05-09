<div class="main-panel">
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg " color-on-scroll="500">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#"> Daftar Kost </a>
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
            <?php echo anchor('administrator/daftar_kost/input_kost', '<button class="btn btn-md btn-primary mb-3"><i class="fa fa-plus mr-2"></i>Tambah Kost</button>') ?>
            <table class="table table-bordered table-hover table-striped">
                <tr>
                    <th>No</th>
                    <th>Nama Kost</th>
                    <th>Alamat</th>
                    <th colspan="3">Aksi</th>
                </tr>
                <?php
                $no = 1;
                foreach ($kost as $dt) : ?>
                    <tr>
                        <td><?php echo $no++; ?></td>
                        <td><?php echo $dt['nmkost'] ?></td>
                        <td><?php echo $dt['alamat'] ?></td>
                        <td width="20px">
                            <div class="btn btn-sm btn-primary"><i class="fa fa-eye"></i></div>
                        </td>
                        <td width="20px">
                            <div class="btn btn-sm btn-info"><i class="fa fa-edit"></i></div>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </table>
        </div>
    </div>