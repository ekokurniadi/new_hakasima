<!doctype html>
<html>
    <head>
        <title>harviacode.com - codeigniter crud generator</title>
        <link rel="stylesheet" href="<?php echo base_url('assets/bootstrap/css/bootstrap.min.css') ?>"/>
        <style>
            body{
                padding: 15px;
            }
        </style>
    </head>
    <body>
        <h2 style="margin-top:0px">Tentang Read</h2>
        <table class="table">
	    <tr><td>Tentang Kami</td><td><?php echo $tentang_kami; ?></td></tr>
	    <tr><td>Nama Bank</td><td><?php echo $nama_bank; ?></td></tr>
	    <tr><td>Atas Nama</td><td><?php echo $atas_nama; ?></td></tr>
	    <tr><td>No Rekening</td><td><?php echo $no_rekening; ?></td></tr>
	    <tr><td></td><td><a href="<?php echo site_url('tentang') ?>" class="btn btn-default">Cancel</a></td></tr>
	</table>
        </body>
</html>