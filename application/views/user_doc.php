<!doctype html>
<html>
    <head>
        <title>harviacode.com - codeigniter crud generator</title>
        <link rel="stylesheet" href="<?php echo base_url('assets/bootstrap/css/bootstrap.min.css') ?>"/>
        <style>
            .word-table {
                border:1px solid black !important; 
                border-collapse: collapse !important;
                width: 100%;
            }
            .word-table tr th, .word-table tr td{
                border:1px solid black !important; 
                padding: 5px 10px;
            }
        </style>
    </head>
    <table>
             <tr>
               <td></td>
             </tr>
           </table>
         <br><br><p style="font-size:15px;text-align: center;">PD. HAKASIMA
           <br>KOTA JAMBI</p>
          <br>
          <br>
        
           <hr>      
           
           <br>
           <div style="text-align: center;font-size: 13pt"><b> Laporan Data User</b></div>  
		   <br>
    <body>
        <h2>User List</h2>
        <table class="word-table" style="margin-bottom: 10px">
            <tr>
                <th>No</th>
		<th>Nama</th>
		<th>Username</th>
		<th>Password</th>
		<th>Role</th>
		
            </tr><?php
            foreach ($user_data as $user)
            {
                ?>
                <tr>
		      <td><?php echo ++$start ?></td>
		      <td><?php echo $user->nama ?></td>
		      <td><?php echo $user->username ?></td>
		      <td><?php echo $user->password ?></td>
		      <td><?php echo $user->role ?></td>	
                </tr>
                <?php
            }
            ?>
        </table>
        <br><br>
        <br><br>
        <table style="margin-left:350px;">
            <tr>
                <td>Jambi,</td>
                <td><?php echo tgl_indo(date('Y-m-d'))?></td>
            </tr>
        </table>
        <table style="margin-left:350px;">
            <tr>
                <td>Kepala Cabang</td>
            </tr>
        </table>
        <br>
        <br>
        <br><br>
        <br>
        <table style="margin-left:350px;">
            <tr>
                <td>Wenes Krisandi</td>
            </tr>
        </table>
    </body>
</html>