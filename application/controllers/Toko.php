<?php 

defined('BASEPATH') OR exit('No direct script access allowed');

class Toko extends MY_Controller {

    function __construct()
    {
        parent::__construct();
        $this->load->model('Ongkir_model');
        $this->load->model('Prospek_model');
        $this->load->model('Pembelian_model');
        $this->load->library('form_validation');
    }

      
    public function index()
    {
        $data=array(
           
        );
        $this->load->view('toko/header_utama',$data);
        $this->load->view('toko/index_utama');
        $this->load->view('toko/footer');
        
    }

    public function search_product()
    {
        $key=$this->input->post('key');
        $data=array(
           'key'=>$key,
        );
        $this->load->view('toko/header_utama',$data);
        $this->load->view('toko/search_product');
        $this->load->view('toko/footer');
        
    }

    public function search_product2()
    {
        $key=$this->input->post('key');
        $data=array(
           'key'=>$key,
        );
        $this->load->view('toko/header',$data);
        $this->load->view('toko/search_product');
        $this->load->view('toko/footer');
        
    }

    public function pages()
    {
        $data=array(
           
        );
        $this->load->view('toko/header',$data);
        $this->load->view('toko/index');
        $this->load->view('toko/footer');
        
    }

    public function list_kab(){
        // Ambil data ID Provinsi yang dikirim via ajax post
        $kode_provinsi = $this->input->post('kode_provinsi');
        $provi = $this->Ongkir_model->get_list_kab($kode_provinsi);
 
        // Buat variabel untuk menampung tag-tag option nya
        // Set defaultnya dengan tag option Pilih
        $lists = "<option value=''>--Please-Select---</option>";
        foreach($provi as $data){
            $lists .= "<option value='".$data->kabupaten."'>".$data->kabupaten."</option>"; // Tambahkan tag option ke variabel $lists
        }
        $callback = array('list_kab'=>$lists); // Masukan variabel lists tadi ke dalam array $callback dengan index array : list_kota
        echo json_encode($callback); // konversi varibael $callback menjadi JSON
    }
    public function list_kurir(){
        // Ambil data ID Provinsi yang dikirim via ajax post
        $kode_provinsi = $this->input->post('kode_provinsi');
        // $kabupaten =$this->input->post('kabupaten');
        $provi = $this->db->query("select * from ekspedisi")->result();
 
        // Buat variabel untuk menampung tag-tag option nya
        // Set defaultnya dengan tag option Pilih
        $lists = "<option value=''>--Please-Select---</option>";
        foreach($provi as $data){
            $lists .= "<option value='".$data->id."'>".$data->ekspedisi."</option>"; // Tambahkan tag option ke variabel $lists
        }
        $callback = array('list_kurir'=>$lists); // Masukan variabel lists tadi ke dalam array $callback dengan index array : list_kota
        echo json_encode($callback); // konversi varibael $callback menjadi JSON
    }
    public function list_layanan(){
        // Ambil data ID Provinsi yang dikirim via ajax post
        $ekspedisi = $this->input->post('kurir');
        $provi = $this->db->query("SELECT * FROM layanan")->result();
 
        // Buat variabel untuk menampung tag-tag option nya
        // Set defaultnya dengan tag option Pilih
        $lists = "<option value=''>--Please-Select---</option>";
        foreach($provi as $data){
            $lists .= "<option value='".$data->layanan."'>".$data->layanan."</option>"; // Tambahkan tag option ke variabel $lists
        }
        $callback = array('list_layanan'=>$lists); // Masukan variabel lists tadi ke dalam array $callback dengan index array : list_kota
        echo json_encode($callback); // konversi varibael $callback menjadi JSON
    }


    public function ambil_data()
    {
        $kode_provinsi = $_GET['kode_provinsi'];
        $kabupaten = $_GET['kabupaten'];
        $kurir = $_GET['kurir'];
        $layanan = $_GET['layanan'];
        $data = $this->db->query("SELECT * FROM detail_ongkir WHERE id_provinsi='$kode_provinsi' and kabupaten ='$kabupaten' and ekspedisi='$kurir' and layanan='$layanan'")->result();
        foreach($data as $dd)
        {
            $data =array(
                'ongkir'=>$dd->ongkir
            );
            
           echo json_encode($data);
        }
    }

     // membuat kode barang otomatis
     function kode()
     {
              $this->db->select('RIGHT(pembelian.kode_pembelian,2) as kode_pembelian', FALSE);
              $this->db->order_by('kode_pembelian','DESC');    
              $this->db->limit(1);    
              $query = $this->db->get('pembelian');  //cek dulu apakah ada sudah ada kode di tabel.    
              if($query->num_rows() <> 0){      
                   //cek kode jika telah tersedia    
                   $data = $query->row();      
                   $kode = intval($data->kode_pembelian) + 1; 
              }
              else{      
                   $kode = 1;  //cek jika kode belum terdapat pada table
              }
                  $tgl=date('dmY'); 
                  $id=substr($_SESSION['customer_id'],0,8);
                  $batas = str_pad($kode, 3, "0", STR_PAD_LEFT);    
                  $kodetampil = "TRX-".$id.$batas;  //format kode
                  return $kodetampil;  
    }
    
    function kode1()
    {
        $this->db->select('RIGHT(prospek.id_prospek,2) as id_prospek', FALSE);
        $this->db->order_by('id_prospek','DESC');    
        $this->db->limit(1);    
        $query = $this->db->get('prospek');     
        if($query->num_rows() <> 0){      
             
             $data = $query->row();      
             $kode = intval($data->id_prospek) + 1; 
        }
        else{      
             $kode = 1;  
        }
            $tgl=date('dmY'); 
            $batas = str_pad($kode, 3, "0", STR_PAD_LEFT);    
            $kodetampil = "PRS-".strtoupper($_SESSION['customer_id'])."-".$batas;  
            return $kodetampil;  
   }
    public function add_to_cart($kode_barang)
    {
        
        $barang= $this->db->query("SELECT * from barang where kode_barang='$kode_barang'")->row_array();
        $data=array(
            'barang'=>$barang,
            'kode_barang'=>$this->uri->segment(3)
            
        );
        $this->load->view('toko/header',$data);
        $data['kode']=$this->kode();
        $this->load->view('toko/detail_produk',$data);
        $this->load->view('toko/footer');
        
    }
    public function add_to_kredit($kode_barang)
    {
        
        $barang= $this->db->query("SELECT * from barang where kode_barang='$kode_barang'")->row_array();
        $data=array(
            'barang'=>$barang,
            'kode_barang'=>$this->uri->segment(3)
            
        );
        $this->load->view('toko/header',$data);
        $data['kode1']=$this->kode1();
        $this->load->view('toko/detail_produk_kredit',$data);
        $this->load->view('toko/footer');
        
    }
    public function checkout()
    {   $kode_barang=$this->input->post('kode_barang');
        $kode_pembelian=$this->input->post('kode_pembelian');
        $qty=$this->input->post('qty');
        $harga=$this->input->post('harga');
        $nama_barang=$this->input->post('nama_barang');
        $total=$this->input->post('total');

        $data=array(
            'kode_pembelian'=>$kode_pembelian,
            'tanggal'=>date('Y-m-d'),
            'customer_id'=>$_SESSION['customer_id'],
        );
        $data2=array(
            'kode_pembelian'=>$kode_pembelian,
            'kode_barang'=>$kode_barang,
            'nama_barang'=>$nama_barang,
            'status'=>'baru',
            'customer_id'=>$_SESSION['customer_id'],
            'harga'=>$harga,
            'qty'=>$qty,
            'total'=>$total
        );
        $this->db->insert('detail_pembelian',$data2);
        redirect('toko/pages','refresh');
       
        
    }

    public function create_action() 
    {
      
            $data = array(
		'id_prospek' => $this->input->post('id_prospek',TRUE),
		'id_customer' => $this->input->post('id_customer',TRUE),
		'nama' => $this->input->post('nama',TRUE),
		'alamat' => $this->input->post('alamat',TRUE),
		'tanggal' => date('Y-m-d'),
		'no_ktp' => $this->input->post('no_ktp',TRUE),
		'no_hp' => $this->input->post('no_hp',TRUE),
		'kode_barang' => $this->input->post('kode_barang',TRUE),
		'nama_barang' => $this->input->post('nama_barang',TRUE),
		'jumlah' => $this->input->post('qty',TRUE),
		'status' => 'baru',
		'nik_sales' => 'admin',
	    );

            $this->Prospek_model->insert($data);
            $_SESSION['pesan']="Pengajuan Kredit berhasil di proses silahkan menunggu konfirmasi";
            $_SESSION['tipe']="danger";
            redirect(site_url('toko/pages'));
    }

    public function add_review()
    {
        $customer=$this->input->post('nama_konsumen');
        $kode=$this->input->post('kode_barang');
        $review=$this->input->post('review');
        $tanggal=date('Y-m-d');
        $data=array(
            'kode_barang'=>$kode,
            'customer'=>$customer,
            'review'=>$review,
            'tanggal'=>$tanggal
        );
        $this->db->insert('review',$data);
        redirect('toko/pages','refresh');
        
    }

    public function hapus_keranjang($id)
    {
        $hapus =$this->db->query("DELETE FROM detail_pembelian where id='$id'");
        if($hapus){
            echo ' <script>window.history.back(-1)</script>';
        }
    }

    public function check_out($kode_pembelian)
    {
        $barang=$this->db->query("SELECT * FROM detail_pembelian where kode_pembelian='$kode_pembelian'")->result();
        $total=$this->db->query("SELECT SUM(total) as total_belanja from detail_pembelian where kode_pembelian='$kode_pembelian'")->row_array();
        $data=array(
            'daftar_belanja'=>$barang,
            'total'=>$total,
        );
        $data['kode_provinsi']=$this->Ongkir_model->get_provinsi();
        $this->load->view('toko/header');
        $this->load->view('toko/checkout2',$data);
        $this->load->view('toko/footer');
    }


    public function pengajuan_kredit()
    {
       $cust_id=$_SESSION['customer_id'];
       $data_kredit=$this->db->query("SELECT * FROM prospek where id_customer ='$cust_id'")->result();
       $data=array(
           'detail'=>$data_kredit,
       );
       $this->load->view('toko/header');
       $this->load->view('toko/form_kredit',$data);
       $this->load->view('toko/footer');
       
    }
    public function tracking()
    {
       $cust_id=$_SESSION['customer_id'];
       $data_tracking=$this->db->query("SELECT * FROM pembelian where customer_id ='$cust_id' and status !='baru'")->result();
       $data=array(
           'detail'=>$data_tracking,
       );
       $this->load->view('toko/header');
       $this->load->view('toko/tracking',$data);
       $this->load->view('toko/footer');
       
    }
    public function bayar()
    {
       $cust_id=$_SESSION['customer_id'];
    //    echo $cust_id;   
       $data_kredit=$this->db->query("SELECT a.id_prospek,a.kode_barang,a.nama_barang,b.* from prospek a join tagihan_konsumen b on a.id_prospek=b.id_prospek where b.id_customer='$cust_id' and b.status ='Angsuran'")->result();
       $data=array(
           'detail'=>$data_kredit,
       );
       $this->load->view('toko/header');
       $this->load->view('toko/bayar_angsuran',$data);
       $this->load->view('toko/footer');
       
    }

    public function proses()
    {
        $kode_pembelian=$this->input->post('id_trx');
        $tanggal=date('Y-m-d');
        $customer_id=$this->input->post('pengguna');
        $alamat=$this->input->post('alamat');
        $provinsi=$this->input->post('kode_provinsi');
        $kecamatan=$this->input->post('kecamatan');
        $kabupaten=$this->input->post('kabupaten');
        $ekspedisi=$this->input->post('kurir');
        $layanan=$this->input->post('layanan');
        $status='baru';
        $pengiriman=$this->input->post('ongkir');
        $data=array(
            'kode_pembelian'=>$kode_pembelian,
            'tanggal'=>$tanggal,
            'customer_id'=>$customer_id,
            'alamat'=>$alamat,
            'provinsi'=>$provinsi,
            'kecamatan'=>$kecamatan,
            'kabupaten'=>$kabupaten,
            'ekspedisi'=>$ekspedisi,
            'layanan'=>$layanan,
            'status'=>$status,
            'pengiriman'=>$pengiriman,
        );
        $this->db->insert('pembelian',$data);
        $this->db->query("update detail_pembelian set status='proses' where kode_pembelian='$kode_pembelian'");
        redirect('toko/pages','refresh');
        
    }

    public function tentang_kami()
    {
        $this->load->view('toko/header');
        $this->load->view('toko/tentang_kami');
        // $this->load->view('toko/footer');
    }
    public function tentang_kami2()
    {
        $this->load->view('toko/header_utama');
        $this->load->view('toko/tentang_kami');
        // $this->load->view('toko/footer');
    }

    public function update_action() 
    {
            $id=$this->input->post('id');
            $this->load->library('upload');
            $config['upload_path']   = './image/';
            $config['overwrite']     = true;
            $config['allowed_types'] = 'gif|jpeg|png|jpg|bmp|PNG|JPEG|JPG';
            $config['file_name'] = $_FILES['bukti_transfer']['name'];

            $this->upload->initialize($config);

            if($_FILES['bukti_transfer']['name'])
            {
                if($this->upload->do_upload('bukti_transfer'))
                {
                $gbr = $this->upload->data();
                $data = array(
                    'bukti_transfer' =>  $gbr['file_name'],
                );
            $this->Pembelian_model->update2($this->input->post('id', TRUE), $data);
            $this->session->set_flashdata('message', 'Create Record Success');
            redirect('toko/tracking','refresh');
            }
        }
                   
                       
        }


}

/* End of file Toko.php */


?>