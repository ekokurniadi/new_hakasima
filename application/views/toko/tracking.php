<div class="section">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="table-responsive">
							<table class="table table-bordered table-striped">
								<thead>
									<tr>
										<th>No</th>
										<th>Kode Pembelian</th>
										<th>Tanggal</th>
										<th>Alamat</th>
										<th>Nama Barang</th>
										<th>Ekspedisi</th>
										<th>Layanan</th>
										<th>Status</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody>
								<?php 
								$no=1;
								foreach($detail as $dt):?>
									<tr>
										<td><?=$no++;?></td>
										<td width="200px;"><?=$dt->kode_pembelian?></td>
										<td width="100px;"  ><?=tgl_indo($dt->tanggal);?></td>
										<td width="200px;"><?=$dt->alamat?></td>
										<?php $foto=$this->db->query("select * from detail_pembelian where kode_pembelian='$dt->kode_pembelian'")->result();?>

										<td>
                                        <?php foreach($foto as $f):?>
                                        <?php $foto2=$this->db->query("select * from barang where kode_barang='$f->kode_barang'")->row_array();?>
                                            <img src="<?= base_url('image/'.$foto2['foto'])?>" alt="Foto Barang" width="100px" height="100px;">
                                        <?php echo $f->nama_barang;?>
                                        <?php endforeach;?>  
                                        </td>
                                        <?php $lay=$this->db->query("select * from ekspedisi where id='$dt->ekspedisi'")->row_array();?>
										<td style="text-align:center"><?=$lay['ekspedisi']?></td>
										<td style="text-align:center"><?=$dt->layanan?></td>
										<td style="text-align:center"><?=$dt->status?></td>
										<td style="text-align:center" width="200px">
										<?php 
										if($dt->status =='proses' && $dt->bukti_transfer == ""){
										 echo "<a href='#quicke$dt->id' id='$dt->id'  data-toggle='modal' class='btn btn-success'> <span class='fa fa-eye'> Upload Bukti Pembayaran</span></a>";
										echo '  '; 
										} else if($dt->status=='selesai') {
											echo ' ';
										}
										?>
									</td>
									</tr>
								<?php endforeach;?>
								</tbody>
								<?php foreach($detail as $b):?>
								<div class="modal fade" id="quicke<?=$b->id?>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title" id="myModalLabel">&nbsp;Review</h4>
									<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
								</div>
								<div class="modal-body" id="IsiModal" >
								<form action="<?php echo base_url('toko/update_action')?>" method="POST" enctype="multipart/form-data">
									<input type="text" name="id" id="id" value="<?=$b->id?>">
									<input type="file" name="bukti_transfer" id="bukti_transfer" class="form-control">
								</div>
								<div class="modal-footer">
								<button type="submit" class="btn btn-danger btn-sm">Save</button>
									</div>
									</form>
								</div>
							</div>
							</div>
					<?php endforeach;?>
							</table>

							
						</div>
					</div>
						
				</div>
			</div>
		</div>
		