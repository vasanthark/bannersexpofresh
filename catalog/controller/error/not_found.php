<?php
class ControllerErrorNotFound extends Controller {
	public function index() {
		$this->load->language('error/not_found');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		if (isset($this->request->get['route'])) {
			$url_data = $this->request->get;

			unset($url_data['_route_']);

			$route = $url_data['route'];

			unset($url_data['route']);

			$url = '';

			if ($url_data) {
				$url = '&' . urldecode(http_build_query($url_data, '', '&'));
			}

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link($route, $url, $this->request->server['HTTPS'])
			);
		}

		$data['heading_title'] = $this->language->get('heading_title');

		//$data['text_error'] = $this->language->get('text_error');
                $data['text_error'] = "";

		$data['button_continue'] = $this->language->get('button_continue');

		$data['continue'] = $this->url->link('common/home');

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
                $data['content_breadcrumbs'] = $this->load->controller('common/breadbcrumb',$data['breadcrumbs']);

		$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');
                
                $data['vinyl_banner'] = $this->url->link('product/product', 'product_id=50');
                $data['mesh_banner'] = $this->url->link('product/product', 'product_id=51');

                $data['displays'] = $this->url->link('product/category', 'path=59');        
                $data['floor_stands']= $this->url->link('product/category', 'path=59_62');
                $data['table_covers']= $this->url->link('product/category', 'path=59_63');

                $data['a_frame_signs'] = $this->url->link('product/product', 'product_id=52');
                $data['trade_show'] = $this->url->link('product/product', 'product_id=75');
                $data['yard_signs'] = $this->url->link('product/product', 'product_id=53');

                $data['rigid_signs'] = $this->url->link('product/category', 'path=60');   
                $data['banner_stands'] = $this->url->link('product/category', 'path=61'); 

                $data['wall_decals'] = $this->url->link('product/product', 'product_id=56');
                $data['window_wraps'] = $this->url->link('product/product', 'product_id=57');
                $data['magnetic_signs'] = $this->url->link('product/product', 'product_id=58');
                $data['paper_posters'] = $this->url->link('product/product', 'product_id=59');
                $data['canvas_printing'] = $this->url->link('product/product', 'product_id=60');
                $data['backdrops'] = $this->url->link('product/product', 'product_id=61');
                $data['window_decals'] = $this->url->link('product/product', 'product_id=62');
                $data['static_cling'] = $this->url->link('product/product', 'product_id=63');               
                              
                $data['home'] = $this->url->link('common/home');
                $data['about_us'] = $this->url->link('information/information', 'information_id=4');
                $data['faq'] = $this->url->link('information/faq', '', true);
                $data['blog'] = $this->url->link('tltblog/tlttag', '', true);
                $data['delivery_info'] = $this->url->link('information/information', 'information_id=6');
                $data['privacy_policy'] = $this->url->link('information/information', 'information_id=3');
                $data['terms_conditions'] = $this->url->link('information/information', 'information_id=5');
                $data['contact'] = $this->url->link('information/contact');  

		$this->response->setOutput($this->load->view('error/not_found', $data));
	}
}