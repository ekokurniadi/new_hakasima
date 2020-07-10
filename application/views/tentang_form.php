
<!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Tentang 
        <small>Control panel</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="<?php echo base_url(); ?>dashboard"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Tentang</li>
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
            <label class="col-sm-2 control-label" for="tentang_kami">Tentang Kami <?php echo form_error('tentang_kami') ?></label>
            <div class="col-sm-6">
                <textarea class="ckeditor" rows="3" name="tentang_kami" id="tentang_kami" placeholder="Tentang Kami"><?php echo $tentang_kami; ?></textarea>
            </div>
        </div>
    </div>
	   
    <div class="box-body"> 
        <div class="form-group">
            <label class="col-sm-2 control-label" for="varchar">Nama Bank <?php echo form_error('nama_bank') ?></label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="nama_bank" id="nama_bank" placeholder="Nama Bank" value="<?php echo $nama_bank; ?>" />
            </div>
        </div>
    </div>
	   
    <div class="box-body"> 
        <div class="form-group">
            <label class="col-sm-2 control-label" for="varchar">Atas Nama <?php echo form_error('atas_nama') ?></label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="atas_nama" id="atas_nama" placeholder="Atas Nama" value="<?php echo $atas_nama; ?>" />
            </div>
        </div>
    </div>
	   
    <div class="box-body"> 
        <div class="form-group">
            <label class="col-sm-2 control-label" for="varchar">No Rekening <?php echo form_error('no_rekening') ?></label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="no_rekening" id="no_rekening" placeholder="No Rekening" value="<?php echo $no_rekening; ?>" />
            </div>
        </div>
    </div>
	    
<div class="box-footer">
    <input type="hidden" name="id" value="<?php echo $id; ?>" /> 
	    <button type="submit" class="btn btn-success"><?php echo $button ?></button> 
	    <a href="<?php echo site_url('tentang') ?>" class="btn btn-default">Cancel</a>
	
</div>
</form>
</div>
</div>
</div>
