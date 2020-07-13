<!doctype html>
<html>
    <head>
        <title></title>
        <link rel="stylesheet" href="<?php echo base_url('assets/bootstrap/css/bootstrap.min.css') ?>"/>
        <style>
            .word-table {
                border:1px solid black !important; 
                border-collapse: collapse !important;
                width: 100%;
            }
            .word-table tr th, .word-table tr td{
                border:1px solid black !important; 
                padding: 0px 0px;
				font-size:10px;
            }
        </style>
    </head>
    <body>
        <h2>Sales_order List</h2>
        <table class="word-table" style="margin-bottom: 10px">
            <tr>
                <th>No</th>
		<th>Id Prospek</th>
		<th>Id Customer</th>
		<th>Nama</th>
		<th>Alamat</th>
		<th>Tanggal</th>
		<th>No Ktp</th>
		<th>No Hp</th>
		<th>Kode Barang</th>
		<th>Nama Barang</th>
		<th>Jumlah</th>
		<th>Jenis Pembelian</th>
		<th>Harga</th>
		<th>Tenor</th>
		<th>Angsuran</th>
		<th>Status</th>
		<th>Nik Sales</th>
		
            </tr><?php
            foreach ($sales_order_data as $sales_order_data)
            {
                ?>
                <tr>
		      <td><?php echo ++$start ?></td>
		      <td><?php echo $sales_order_data->id_prospek ?></td>
		      <td><?php echo $sales_order_data->id_customer ?></td>
		      <td><?php echo $sales_order_data->nama ?></td>
		      <td><?php echo $sales_order_data->alamat ?></td>
		      <td><?php echo $sales_order_data->tanggal ?></td>
		      <td><?php echo $sales_order_data->no_ktp ?></td>
		      <td><?php echo $sales_order_data->no_hp ?></td>
		      <td><?php echo $sales_order_data->kode_barang ?></td>
		      <td><?php echo $sales_order_data->nama_barang ?></td>
		      <td><?php echo $sales_order_data->jumlah ?></td>
		      <td><?php echo $sales_order_data->jenis_pembelian ?></td>
		      <td><?php echo $sales_order_data->harga ?></td>
		      <td><?php echo $sales_order_data->tenor ?></td>
		      <td><?php echo $sales_order_data->angsuran ?></td>
		      <td><?php echo $sales_order_data->status ?></td>
		      <td><?php echo $sales_order_data->nik_sales ?></td>	
                </tr>
                <?php
            }
            ?>
        </table>
	
        <table style="margin-left:650px;">
            <tr>
                <td>Jambi,</td>
                <td><?php echo tgl_indo(date('Y-m-d'))?></td>
            </tr>
        </table>
        <table style="margin-left:650px;">
            <tr>
                <td>Kepala Cabang</td>
            </tr>
        </table>
        <br>
        <br>
        <br>
        <br>
        <table style="margin-left:650px;">
            <tr>
                <td>Wenes Krisandi</td>
            </tr>
        </table>
    </body>
</html>