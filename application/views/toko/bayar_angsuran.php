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
										<th>Kode Barang</th>
										<th>Nama Barang</th>
										<th>Nominal</th>
										<th>Status</th>
										<!-- <th>Action</th> -->
									</tr>
								</thead>
								<tbody>
								<?php 
								$no=1;
								foreach($detail as $dt):?>
									<tr>
										<td><?=$no++;?></td>
										<td><?=$dt->id_prospek?></td>
										<td><?=$dt->kode_barang?></td>
										<td><?=$dt->nama_barang?></td>
										<td>Rp. <?=number_format($dt->nominal,0,',','.')?></td>
										<td>
										<?php if($dt->status=='Angsuran'){
											$status="Belum di bayar";
										} else {
											$status="Lunas";
										}
										?>
										<?=$status;?>
										</td>
										
									</tr>
								<?php endforeach;?>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>

		<br><br><br><br><br><br><br>