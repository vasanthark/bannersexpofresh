<?php
class ControllerCommonQuickorder extends Controller {
	public function index() {           
               $this->document->setTitle("Quick Order");

		$data['heading_title'] = "Quick Order";

		$data['header'] = $this->load->controller('common/header');		
		$data['footer'] = $this->load->controller('common/footer');
                

		$this->response->setOutput($this->load->view('common/quickorder', $data));
        }
}        