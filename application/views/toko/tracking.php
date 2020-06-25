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
									</tr>
								<?php endforeach;?>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>