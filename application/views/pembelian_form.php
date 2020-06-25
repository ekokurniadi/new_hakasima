
<!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Pembelian 
        <small>Control panel</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="<?php echo base_url(); ?>dashboard"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Pembelian</li>
      </ol>
    </section>


<!-- column -->
        <div class="col-md-12">
          <!-- Horizontal Form -->
          <div class="box box-info">
            <div class="box-header with-border">
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form action="<?php echo $action; ?>" method="post" class="form-horizontal">
	   
    <div class="box-body"> 
        <div class="form-group">
            <label class="col-sm-2 control-label" for="varchar">Kode Pembelian <?php echo form_error('kode_pembelian') ?></label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="kode_pembelian" id="kode_pembelian" placeholder="Kode Pembelian" value="<?php echo $kode_pembelian; ?>" readonly/>
            </div>
        </div>
    </div>
	   
    <div class="box-body"> 
        <div class="form-group">
            <label class="col-sm-2 control-label" for="date">Tanggal <?php echo form_error('tanggal') ?></label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="tanggal" id="tanggal" placeholder="Tanggal" value="<?php echo $tanggal; ?>" readonly/>
            </div>
        </div>
    </div>
	   
    <div class="box-body"> 
        <div class="form-group">
            <label class="col-sm-2 control-label" for="varchar">Customer Id <?php echo form_error('customer_id') ?></label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="customer_id" id="customer_id" placeholder="Customer Id" value="<?php echo $customer_id; ?>" readonly/>
            </div>
        </div>
    </div>
	    
    <div class="box-body">
        <div class="form-group">
            <label class="col-sm-2 control-label" for="alamat">Alamat <?php echo form_error('alamat') ?></label>
            <div class="col-sm-6">
                <textarea class="ckeditor" rows="3" name="alamat" id="alamat" placeholder="Alamat" readonly><?php echo $alamat; ?></textarea >
            </div>
        </div>
    </div>
	   
    <div class="box-body"> 
        <div class="form-group">
            <label class="col-sm-2 control-label" for="varchar">Provinsi <?php echo form_error('provinsi') ?></label>
            <div class="col-sm-6">
                <input type="hidden" class="form-control" name="provinsi" id="provinsi" placeholder="Provinsi" value="<?php echo $provinsi; ?>" readonly/>
                <?php $prov=$this->db->query("select * from provinsi where id='$provinsi'")->row_array()?>
                <input type="text" class="form-control" placeholder="Provinsi" value="<?php echo $prov['provinsi']; ?>" readonly/>
            </div>
        </div>
    </div>
	   
    <!-- <div class="box-body"> 
        <div class="form-group">
            <label class="col-sm-2 control-label" for="varchar">Kecamatan <?php echo form_error('kecamatan') ?></label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="kecamatan" id="kecamatan" placeholder="Kecamatan" value=" " readonly/>
            </div>
        </div>
    </div> -->
	   
    <div class="box-body"> 
        <div class="form-group">
            <label class="col-sm-2 control-label" for="varchar">Kabupaten <?php echo form_error('kabupaten') ?></label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="kabupaten" id="kabupaten" placeholder="Kabupaten" value="<?php echo $kabupaten; ?>" readonly/>
            </div>
        </div>
    </div>
	   
    <div class="box-body"> 
        <div class="form-group">
            <label class="col-sm-2 control-label" for="varchar">Ekspedisi <?php echo form_error('ekspedisi') ?></label>
            <div class="col-sm-6">
                <input type="hidden" class="form-control" name="ekspedisi" id="ekspedisi" placeholder="Ekspedisi" value="<?php echo $ekspedisi; ?>" readonly/>
                <?php $eks=$this->db->query("select * from ekspedisi where id='$ekspedisi'")->row_array()?>
                <input type="text" class="form-control" placeholder="Provinsi" value="<?php echo $eks['ekspedisi']; ?>" readonly/>
            </div>
        </div>
    </div>
	   
    <div class="box-body"> 
        <div class="form-group">
            <label class="col-sm-2 control-label" for="varchar">Layanan <?php echo form_error('layanan') ?></label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="layanan" id="layanan" placeholder="Layanan" value="<?php echo $layanan; ?>" readonly/>
            </div>
        </div>
    </div>
	   
    <div class="box-body"> 
        <div class="form-group">
            <label class="col-sm-2 control-label" for="varchar">Status <?php echo form_error('status') ?></label>
            <div class="col-sm-6">
            <select name="status" id="status" class="form-control">
                <option value="<?=$status?>" selected><?=$status?></option>
                <option value="proses">Proses</option>
                <option value="kirim">Dikirim</option>
                <option value="selesai">Selesai</option>
            </select>
            </div>
        </div>
    </div>
	    
<div class="box-footer">
    <input type="hidden" name="id" value="<?php echo $id; ?>" /> 
	    <button type="submit" class="btn btn-success"><?php echo $button ?></button> 
	    <a href="<?php echo site_url('pembelian') ?>" class="btn btn-default">Cancel</a>
	
</div>
</form>
</div>
</div>
</div>
