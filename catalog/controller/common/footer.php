<?php
class ControllerCommonFooter extends Controller {
	public function index() {
            
		$this->load->language('common/footer');

		$data['scripts'] = $this->document->getScripts('footer');

		$data['text_information'] = $this->language->get('text_information');
		$data['text_service'] = $this->language->get('text_service');
		$data['text_extra'] = $this->language->get('text_extra');
		$data['text_contact'] = $this->language->get('text_contact');
		$data['text_return'] = $this->language->get('text_return');
		$data['text_sitemap'] = $this->language->get('text_sitemap');
		$data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$data['text_voucher'] = $this->language->get('text_voucher');
		$data['text_affiliate'] = $this->language->get('text_affiliate');
		$data['text_special'] = $this->language->get('text_special');
		$data['text_account'] = $this->language->get('text_account');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_wishlist'] = $this->language->get('text_wishlist');
		$data['text_newsletter'] = $this->language->get('text_newsletter');
                
                /* ARk */
                $data['telephone'] = $this->config->get('config_telephone');
                $data['store_name'] = $this->config->get('config_name');
                $data['store_address'] = $this->config->get('config_address');
                $data['store_email'] = $this->config->get('config_email');
                

		$this->load->model('catalog/information');

		$data['informations'] = array();

		foreach ($this->model_catalog_information->getInformations() as $result) {
                        if ($result['bottom']) {
                                $data['informations'][] = array(
                                        'title' => $result['title'],
                                        'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
                                    );
                                }
                        }

                /* ARK Footer Keywords*/
                $data['footer_keywords'] = '';
                $product_info = '';
                if (isset($this->request->get['product_id'])) {
                    $product_id = (int) $this->request->get['product_id'];
                    $this->load->model('catalog/product');
                    $product_info = $this->model_catalog_product->getProduct($product_id);
                } else if (isset($this->request->get['route']) && $this->request->get['route'] == 'product/category') {
                    $this->load->model('catalog/category');
                    $category_id = (int) $this->request->get['path'];
                    $product_info = $this->model_catalog_category->getCategory($category_id);
                } 
                

                if ($product_info) {

                    if (isset($product_info['footer_keywords']) && !empty($product_info['footer_keywords'])) {
                        $footer_keywords = explode(',', $product_info['footer_keywords']);
                    } else {
                        $footer_keywords = array();
                    }
                    
                    
                                       
                    $data['footer_keywords'] = $footer_keywords;
                }

		$data['contact'] = $this->url->link('information/contact');
		$data['return'] = $this->url->link('account/return/add', '', true);
		$data['sitemap'] = $this->url->link('information/sitemap');
		$data['manufacturer'] = $this->url->link('product/manufacturer');
		$data['voucher'] = $this->url->link('account/voucher', '', true);
		$data['affiliate'] = $this->url->link('affiliate/account', '', true);
		$data['special'] = $this->url->link('product/special');
		$data['account'] = $this->url->link('account/account', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['newsletter'] = $this->url->link('account/newsletter', '', true);
                
                $data['home'] = $this->url->link('common/home');
                $data['about_us'] = $this->url->link('information/information', 'information_id=4');
                $data['faq'] = $this->url->link('information/faq', '', true);
                $data['blog'] = $this->url->link('tltblog/tlttag', '', true);
                $data['delivery_info'] = $this->url->link('information/information', 'information_id=6');
                $data['privacy_policy'] = $this->url->link('information/information', 'information_id=3');
                $data['terms_conditions'] = $this->url->link('information/information', 'information_id=5');
                $data['sitemap'] = $this->url->link('information/sitemap', '', true);
                
                /* Products */                
                $data['vinyl_banner'] = $this->url->link('product/product', 'product_id=50');
                $data['mesh_banner'] = $this->url->link('product/product', 'product_id=51');

                $data['displays'] = $this->url->link('product/category', 'path=59');        
                $data['floor_stands']= $this->url->link('product/category', 'path=59_62');
               // $data['table_covers']= $this->url->link('product/category', 'path=59_63');

               // $data['a_frame_signs'] = $this->url->link('product/product', 'product_id=52');
               // $data['trade_show'] = $this->url->link('product/product', 'product_id=75');
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
                
               
		$data['powered'] = sprintf($this->language->get('text_powered'), $this->config->get('config_name'), date('Y', time()));

		// Whos Online
		if ($this->config->get('config_customer_online')) {
			$this->load->model('tool/online');

			if (isset($this->request->server['REMOTE_ADDR'])) {
				$ip = $this->request->server['REMOTE_ADDR'];
			} else {
				$ip = '';
			}

			if (isset($this->request->server['HTTP_HOST']) && isset($this->request->server['REQUEST_URI'])) {
				$url = 'http://' . $this->request->server['HTTP_HOST'] . $this->request->server['REQUEST_URI'];
			} else {
				$url = '';
			}

			if (isset($this->request->server['HTTP_REFERER'])) {
				$referer = $this->request->server['HTTP_REFERER'];
			} else {
				$referer = '';
			}

			$this->model_tool_online->addOnline($ip, $this->customer->getId(), $url, $referer);
		}
                

		return $this->load->view('common/footer', $data);
	}
} 