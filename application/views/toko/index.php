<!-- SECTION -->
<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
                <?php $barang=$this->db->query("SELECT * FROM barang limit 3")->result();?>
                <?php foreach($barang as $br):?>
					<!-- shop -->
					<div class="col-md-4 col-xs-6">
						<div class="shop">
							<div class="shop-img">
								<img src="<?=base_url('image/'.$br->foto)?>" alt="" style="width:400px;height:200px;">
							</div>
							<div class="shop-body">
								<h3>Laptop<br>Collection</h3>
								<a href="<?=base_url('toko/add_to_cart/'.$br->kode_barang)?>" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
							</div>
						</div>
					</div>
                    <!-- /shop -->
                <?php endforeach;?>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->

		<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">

					<!-- section title -->
					<div class="col-md-12">
						<div class="section-title">
							<h3 class="title">New Products</h3>
							<!-- <div class="section-nav">
								<ul class="section-tab-nav tab-nav">
									<li class="active"><a data-toggle="tab" href="#tab1">Laptops</a></li>
									<li><a data-toggle="tab" href="#tab1">Smartphones</a></li>
									<li><a data-toggle="tab" href="#tab1">Cameras</a></li>
									<li><a data-toggle="tab" href="#tab1">Accessories</a></li>
								</ul>
							</div> -->
						</div>
					</div>
					<!-- /section title -->

					<!-- Products tab & slick -->
					<div class="col-md-12">
						<div class="row">
							<div class="products-tabs">
								<!-- tab -->
								<div id="tab1" class="tab-pane active">
									<div class="products-slick" data-nav="#slick-nav-1">
                                    <?php $d=$this->db->query("SELECT * FROM barang")->result();?>
                                
                                    <?php foreach($d as $b):?>    
                                    <!-- product -->
										<div class="product">
											<div class="product-img">
												<img src="<?php echo base_url('image/'.$b->foto)?>" alt="" width="300px" height="300px;">
												<div class="product-label">
													<!-- <span class="sale">-30%</span> -->
													<span class="new"><?=$b->nama_barang?></span>
												</div>
											</div>
											<div class="product-body">
												<p class="product-category">Category</p>
												<h3 class="product-name"><a href="#"><?=$b->nama_barang?></a></h3>
												<h4 class="product-price">Rp.<?=number_format($b->harga,0,',','.')?></h4>
												<div class="product-rating">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
												</div>
												<div class="product-btns">
													<!-- <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
													<button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button> -->
													<a href="#quickview<?=$b->id?>" id="<?=$b->id?>"  data-toggle="modal" class="btn btn-success"> <span class="fa fa-eye"> Detail</span></a>
													<a href="#quick<?=$b->id?>" id="<?=$b->id?>"  data-toggle="modal" class="btn btn-primary"> <span class="fa fa-eye"> Simulasi Kredit</span></a>
													<br>
													
												</div>
											</div>
											<div class="add-to-cart">
											<a href="#quicke<?=$b->id?>" id="<?=$b->id?>"  data-toggle="modal" class="btn btn-warning"> <span class="fa fa-eye"> Review</span></a>
											 <?php
											 $id_customer=$_SESSION['customer_id'];
											 $cek=$this->db->query("SELECT count(*) as cek FROM prospek where id_customer='$id_customer' and status='baru'")->row_array();
											 if($cek['cek'] == 0){?>
												<a style="padding-top:5px;" href="<?php echo base_url('toko/add_to_kredit/'.$b->kode_barang)?>" class="btn btn-primary btn-sm btn-flat"><i class="fa fa-heart-o"></i> Ajukan Kredit</a> 
												<a style="padding-top:5px;" href="<?=base_url('toko/add_to_cart/'.$b->kode_barang)?>" class="btn btn-danger btn-sm btn-flat"><i class="fa fa-shopping-cart"></i> Add to cart</a>
											 <?php } else{ ?>
												<a style="padding-top:5px;" onclick="notif();" class="btn btn-primary btn-sm btn-flat"><i class="fa fa-heart-o"></i> Ajukan Kredit</a> 
												<a style="padding-top:5px;" href="<?=base_url('toko/add_to_cart/'.$b->kode_barang)?>" class="btn btn-danger btn-sm btn-flat"><i class="fa fa-shopping-cart"></i> Add to cart</a>
											 <?php } ?>
												
                                               
											</div>
										</div>
										<!-- /product -->
                                    <?php endforeach;?>

									</div>
									<div id="slick-nav-1" class="products-slick-nav"></div>
								</div>
								<!-- /tab -->
							</div>
						</div>
					</div>
					<!-- Products tab & slick -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
        <!-- /SECTION -->
        
         <!-- ============ MODAL EDIT =============== -->
         <?php
        foreach($d as $b):?>
             <div class="modal fade" id="quickview<?=$b->id?>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">&nbsp;Product Preview</h4>
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
              </div>
              <div class="modal-body" id="IsiModal" >
                <img src="image/<?php echo isset($b->foto)?$b->foto:''; ?>" width="300px" height="300px" style=" display: block;margin-left: auto;margin-right: auto;"> <br>
				<textarea class="ckeditor" rows="2" name="deskripsi_barang" id="deskripsi_barang" readonly placeholder="deskripsi_barang"><?php echo $b->deskripsi_barang; ?></textarea>
				<br>
				<table class="table table-bordered">
				<tr>
					<th width="200px;">Nama Konsumen</th>
					<th>Review</th>
				</tr>
				<?php $rev=$this->db->query("select * from review where kode_barang ='$b->kode_barang'")->result();?>
				<?php foreach($rev as $r):?>
				<tr>
					<td><?=$r->customer?></td>
					<td><?=$r->review?></td>
				</tr>
			<?php endforeach;?>
				</table>
              </div>
              <!-- <div class="modal-footer">
                <a href="<?=base_url('web/spek/')?>" class="btn btn-danger btn-md btn-flat">Lihat spesifikasi</a>
                </div> -->
            </div>
          </div>
        </div>
  <?php endforeach;?>
    <!-- ============ MODAL EDIT =============== -->
	<?php
	
        foreach($d as $b):?>
             <div class="modal fade" id="quick<?=$b->id?>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">&nbsp;Simulasi Kredit</h4>
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
              </div>
              <div class="modal-body" id="IsiModal" >
			  	<input type="hidden" name="kode_barang" id="kode_barang" value="<?=$b->kode_barang?>">
               <table class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>No</th>
							<th>Tenor</th>
							<th>Angsuran</th>
						</tr>
					</thead> 
					<tbody>
					<?php $no=1;$data_skema=$this->db->query("select * from detail_skema where kode_barang in('$b->kode_barang') order by tenor ASC")->result();?>
					<?php foreach($data_skema as $skema):?>
					<tr>
						<td width="20px;"><?=$no++?></td>
						<td><?=$skema->tenor?> bulan</td>
						<td>Rp. <?=number_format($skema->angsuran,0,'.',',')?></td>
					</tr>
					<?php endforeach;?>
					</tbody>  
			   </table>
              </div>
              <div class="modal-footer">
              <a style="padding-top:5px;" href="<?php echo base_url('toko/add_to_kredit/'.$b->kode_barang)?>" class="btn btn-primary btn-sm btn-flat"><i class="fa fa-heart-o"></i> Ajukan Kredit</a> 
                </div>
            </div>
          </div>
        </div>
  <?php endforeach;?>

  <?php foreach($d as $b):?>
             <div class="modal fade" id="quicke<?=$b->id?>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">&nbsp;Review</h4>
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
              </div>
              <div class="modal-body" id="IsiModal" >
			  <form action="<?php echo base_url('toko/add_review')?>" method="POST">
			  	<input type="hidden" name="kode_barang" id="kode_barang" value="<?=$b->kode_barang?>">
			  	<input type="hidden" name="nama_konsumen" id="nama_konsumen" value="<?=$_SESSION['nama_lengkap']?>">
				  Tulis Review untuk produk ini
	            <input type="text" name="review" id="review" class="form-control">
              </div>
			 
              <div class="modal-footer">
           	<button type="submit" class="btn btn-danger btn-sm">Save</button>
                </div>
				</form>
            </div>
          </div>
        </div>
  <?php endforeach;?>
<script>
function notif()
{
	alert('Anda Sudah pernah mengajukan permohonan Kredit silahkan menunggu konfirmasi');
}

</script>