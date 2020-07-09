  <?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * This controller can be accessed 
 * for all logged in users
 */
class Laporan_pdf extends MY_Controller {

   

   function __construct() {
        parent::__construct();
        $this->load->model('Barang_model');
        $this->load->model('User_model');
        $this->load->model('Stok_model');
        $this->load->model('Sales_order_model');
        require_once APPPATH.'third_party/dompdf/dompdf_config.inc.php';
    }
    
    
    public function cetak_user(){
          $dompdf= new Dompdf();
        
          $data['user_data']=  $this->User_model->get_all();
          $data['start']=0;
          $html=$this->load->view('user_doc',$data,true);
         
          $dompdf->load_html($html);
          $dompdf->set_paper('A4','potrait');
          $dompdf->render();
         
          $pdf = $dompdf->output();
   
          $dompdf->stream('Data User.pdf',array("Attachment"=>FALSE));
       }
       public function cetak_barang(){
        $dompdf= new Dompdf();
      
        $data['barang_data']=  $this->Barang_model->get_all();
        $data['start']=0;
        $html=$this->load->view('barang_doc',$data,true);
       
        $dompdf->load_html($html);
        $dompdf->set_paper('A4','potrait');
        $dompdf->render();
       
        $pdf = $dompdf->output();
 
        $dompdf->stream('Data Barang.pdf',array("Attachment"=>FALSE));
     }
       public function cetak_stok(){
        $dompdf= new Dompdf();
      
        $data['stok_data']=  $this->Stok_model->get_all();
        $data['start']=0;
        $html=$this->load->view('stok_doc',$data,true);
       
        $dompdf->load_html($html);
        $dompdf->set_paper('A4','potrait');
        $dompdf->render();
       
        $pdf = $dompdf->output();
 
        $dompdf->stream('Data Stok.pdf',array("Attachment"=>FALSE));
     }
       public function sales_order(){
        $dompdf= new Dompdf();
      
        $data['sales_order_data']=  $this->Sales_order_model->get_all();
        $data['start']=0;
        $html=$this->load->view('sales_order_doc',$data,true);
       
        $dompdf->load_html($html);
        $dompdf->set_paper('A4','landscape');
        $dompdf->render();
       
        $pdf = $dompdf->output();
 
        $dompdf->stream('Data Sales order.pdf',array("Attachment"=>FALSE));
     }
}


