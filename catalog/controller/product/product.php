<?php
class ControllerProductProduct extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('product/product');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$this->load->model('catalog/category');

		if (isset($this->request->get['path'])) {
			$path = '';

			$parts = explode('_', (string)$this->request->get['path']);

			$category_id = (int)array_pop($parts);

			foreach ($parts as $path_id) {
				if (!$path) {
					$path = $path_id;
				} else {
					$path .= '_' . $path_id;
				}

				$category_info = $this->model_catalog_category->getCategory($path_id);

				if ($category_info) {
					$data['breadcrumbs'][] = array(
						'text' => $category_info['name'],
						'href' => $this->url->link('product/category', 'path=' . $path)
					);
				}
			}

			// Set the last category breadcrumb
			$category_info = $this->model_catalog_category->getCategory($category_id);

			if ($category_info) {
				$url = '';

				if (isset($this->request->get['sort'])) {
					$url .= '&sort=' . $this->request->get['sort'];
				}

				if (isset($this->request->get['order'])) {
					$url .= '&order=' . $this->request->get['order'];
				}

				if (isset($this->request->get['page'])) {
					$url .= '&page=' . $this->request->get['page'];
				}

				if (isset($this->request->get['limit'])) {
					$url .= '&limit=' . $this->request->get['limit'];
				}

				$data['breadcrumbs'][] = array(
					'text' => $category_info['name'],
					'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url)
				);
			}
		}

		$this->load->model('catalog/manufacturer');

		if (isset($this->request->get['manufacturer_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_brand'),
				'href' => $this->url->link('product/manufacturer')
			);

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($this->request->get['manufacturer_id']);

			if ($manufacturer_info) {
				$data['breadcrumbs'][] = array(
					'text' => $manufacturer_info['name'],
					'href' => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . $url)
				);
			}
		}

		if (isset($this->request->get['search']) || isset($this->request->get['tag'])) {
			$url = '';

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}

			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_search'),
				'href' => $this->url->link('product/search', $url)
			);
		}

		if (isset($this->request->get['product_id'])) {
			$product_id = (int)$this->request->get['product_id'];
		} else {
			$product_id = 0;
		}
                
                 $data['special_p'] = 0;
                // Direct Req Quote Forms
                $special_products = array(56);
                if(in_array($product_id,$special_products)){
                     $data['special_p'] = 1;
                }
                
                $data['yard_p'] = 0;
                $yard_product = array(53);
                if(in_array($product_id,$yard_product)){
                     $data['yard_p'] = 1;
                }

		$this->load->model('catalog/product');

		$product_info = $this->model_catalog_product->getProduct($product_id);

		if ($product_info) {
                    
                    if (isset($this->request->get['product_id']))
                    {                   
                        $download_infos = $this->model_catalog_product->getSpecDownload($product_id);
                        if($download_infos){                    
                            $data['pdf_name'] = $download_infos['filename'];
                        }else{
                            $data['pdf_name'] = "";
                        }
                    }

                       $data['siteurl'] =  $this->config->get('config_url');

                        $data['feature_size_option'] = "";
                        if ($this->request->server['REQUEST_METHOD'] == 'POST' && isset($this->request->post['feature_size_option'])) {
                            $data['feature_size_option'] = $this->request->post['feature_size_option'];
                        }
                    
			$url = '';

			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['manufacturer_id'])) {
				$url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
			}

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}

			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['breadcrumbs'][] = array(
				'text' => $product_info['name'],
				'href' => $this->url->link('product/product', $url . '&product_id=' . $this->request->get['product_id'])
			);

			$this->document->setTitle($product_info['meta_title']);
			$this->document->setDescription($product_info['meta_description']);
			$this->document->setKeywords($product_info['meta_keyword']);
			$this->document->addLink($this->url->link('product/product', 'product_id=' . $this->request->get['product_id']), 'canonical');
			$this->document->addScript('catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/magnific/magnific-popup.css');
			$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/moment.js');
			$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');

			$data['heading_title'] = $product_info['name'];

			$data['text_select'] = $this->language->get('text_select');
			$data['text_manufacturer'] = $this->language->get('text_manufacturer');
			$data['text_model'] = $this->language->get('text_model');
			$data['text_reward'] = $this->language->get('text_reward');
			$data['text_points'] = $this->language->get('text_points');
			$data['text_stock'] = $this->language->get('text_stock');
			$data['text_discount'] = $this->language->get('text_discount');
			$data['text_tax'] = $this->language->get('text_tax');
			$data['text_option'] = $this->language->get('text_option');
			$data['text_minimum'] = sprintf($this->language->get('text_minimum'), $product_info['minimum']);
			$data['text_write'] = $this->language->get('text_write');
			$data['text_login'] = sprintf($this->language->get('text_login'), $this->url->link('account/login', '', true), $this->url->link('account/register', '', true));
			$data['text_note'] = $this->language->get('text_note');
			$data['text_tags'] = $this->language->get('text_tags');
			$data['text_related'] = $this->language->get('text_related');
			$data['text_payment_recurring'] = $this->language->get('text_payment_recurring');
			$data['text_loading'] = $this->language->get('text_loading');

			$data['entry_qty'] = $this->language->get('entry_qty');
			$data['entry_name'] = $this->language->get('entry_name');
			$data['entry_review'] = $this->language->get('entry_review');
			$data['entry_rating'] = $this->language->get('entry_rating');
			$data['entry_good'] = $this->language->get('entry_good');
			$data['entry_bad'] = $this->language->get('entry_bad');

			$data['button_cart'] = $this->language->get('button_cart');
			$data['button_wishlist'] = $this->language->get('button_wishlist');
			$data['button_compare'] = $this->language->get('button_compare');
			$data['button_upload'] = $this->language->get('button_upload');
			$data['button_continue'] = $this->language->get('button_continue');

			$this->load->model('catalog/review');

			$data['tab_description'] = $this->language->get('tab_description');
			$data['tab_attribute'] = $this->language->get('tab_attribute');
			$data['tab_review'] = sprintf($this->language->get('tab_review'), $product_info['reviews']);

			$data['product_id'] = (int)$this->request->get['product_id'];
			$data['manufacturer'] = $product_info['manufacturer'];
			$data['manufacturers'] = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $product_info['manufacturer_id']);
			$data['model'] = $product_info['model'];
			$data['reward'] = $product_info['reward'];
			$data['points'] = $product_info['points'];
			$data['description'] = html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8');

			if ($product_info['quantity'] <= 0) {
				$data['stock'] = $product_info['stock_status'];
			} elseif ($this->config->get('config_stock_display')) {
				$data['stock'] = $product_info['quantity'];
			} else {
				$data['stock'] = $this->language->get('text_instock');
			}

			$this->load->model('tool/image');

			if ($product_info['image']) {
				$data['popup'] = $this->model_tool_image->resize($product_info['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height'));
			} else {
				$data['popup'] = '';
			}

			if ($product_info['image']) {
				$data['thumb'] = $this->model_tool_image->resize($product_info['image'], $this->config->get($this->config->get('config_theme') . '_image_thumb_width'), $this->config->get($this->config->get('config_theme') . '_image_thumb_height'));
			} else {
				$data['thumb'] = '';
			}

			$data['images'] = array();

			$results = $this->model_catalog_product->getProductImages($this->request->get['product_id']);

			foreach ($results as $result) {
				$data['images'][] = array(
					//'popup' => $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height')),
					//'thumb' => $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_additional_width'), $this->config->get($this->config->get('config_theme') . '_image_additional_height'))
                                    'popup' => $result['image'],
                                    'thumb' => $result['image']
				);
			}

			if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
				$data['price'] = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
			} else {
				$data['price'] = false;
			}

			if ((float)$product_info['special']) {
				$data['special'] = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
			} else {
				$data['special'] = false;
			}

			if ($this->config->get('config_tax')) {
				$data['tax'] = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price'], $this->session->data['currency']);
			} else {
				$data['tax'] = false;
			}

			$discounts = $this->model_catalog_product->getProductDiscounts($this->request->get['product_id']);

			$data['discounts'] = array();

			foreach ($discounts as $discount) {
				$data['discounts'][] = array(
					'quantity' => $discount['quantity'],
					'price'    => $this->currency->format($this->tax->calculate($discount['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency'])
				);
			}

			$data['options'] = array();

			foreach ($this->model_catalog_product->getProductOptions($this->request->get['product_id']) as $option) {
				$product_option_value_data = array();

				foreach ($option['product_option_value'] as $option_value) {
					if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
						if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
							$price = $this->currency->format($this->tax->calculate($option_value['price'], $product_info['tax_class_id'], $this->config->get('config_tax') ? 'P' : false), $this->session->data['currency']);
                                                        $priceonly = $this->tax->calculate($option_value['price'], $product_info['tax_class_id'], $this->config->get('config_tax') ? 'P' : false);
						} else {
							$price = false;
                                                        $priceonly = false;
						}

						$product_option_value_data[] = array(
							'product_option_value_id' => $option_value['product_option_value_id'],
							'option_value_id'         => $option_value['option_value_id'],
							'name'                    => $option_value['name'],
							'image'                   => $this->model_tool_image->resize($option_value['image'], 50, 50),
							'price'                   => $price,
							'price_prefix'            => $option_value['price_prefix']
						);
					}
				}

				$data['options'][] = array(
					'product_option_id'    => $option['product_option_id'],
					'product_option_value' => $product_option_value_data,
					'option_id'            => $option['option_id'],
					'name'                 => $option['name'],
					'type'                 => $option['type'],
					'value'                => $option['value'],
					'required'             => $option['required']
				);
			}

			if ($product_info['minimum']) {
				$data['minimum'] = $product_info['minimum'];
			} else {
				$data['minimum'] = 1;
			}

			$data['review_status'] = $this->config->get('config_review_status');

			if ($this->config->get('config_review_guest') || $this->customer->isLogged()) {
				$data['review_guest'] = true;
			} else {
				$data['review_guest'] = false;
			}

			if ($this->customer->isLogged()) {
				$data['customer_name'] = $this->customer->getFirstName() . '&nbsp;' . $this->customer->getLastName();
			} else {
				$data['customer_name'] = '';
			}

			$data['reviews'] = sprintf($this->language->get('text_reviews'), (int)$product_info['reviews']);
                        
                        $data['rating'] = "";
                        if($prod_rate = $this->model_catalog_product->getAvgrating($this->request->get['product_id'])){                            
                            $data['rating'] =  number_format((float)$prod_rate, 1, '.', '');                     
                        }

			// Captcha
			if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('review', (array)$this->config->get('config_captcha_page'))) {
				$data['captcha'] = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha'));
			} else {
				$data['captcha'] = '';
			}

			$data['share'] = $this->url->link('product/product', 'product_id=' . (int)$this->request->get['product_id']);

			$data['attribute_groups'] = $this->model_catalog_product->getProductAttributes($this->request->get['product_id']);

			$data['products'] = array();

			$results = $this->model_catalog_product->getProductRelated($this->request->get['product_id']);

			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_related_width'), $this->config->get($this->config->get('config_theme') . '_image_related_height'));
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_related_width'), $this->config->get($this->config->get('config_theme') . '_image_related_height'));
				}

				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$price = false;
				}

				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$special = false;
				}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price'], $this->session->data['currency']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}

				$data['products'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
				);
			}

			$data['tags'] = array();

			if ($product_info['tag']) {
				$tags = explode(',', $product_info['tag']);

				foreach ($tags as $tag) {
					$data['tags'][] = array(
						'tag'  => trim($tag),
						'href' => $this->url->link('product/search', 'tag=' . trim($tag))
					);
				}
			}
                        
                         /* Price per feet display price */
                        $priceperfeet_option = array("22");
                        $data['feetprice_curr'] = "";
                        $data['feetprice_only'] = 0;

                        if (!empty($data['options'])) {
                            foreach ($data['options'] as $option) {
                                if (in_array($option['option_id'], $priceperfeet_option)) {
                                    $priceperfeet_price = $option['value'];
                                    if ($option['option_id'] == "22") {
                                        $data['feetprice_curr'] = $this->currency->format($this->tax->calculate($priceperfeet_price, $product_info['tax_class_id'], $this->config->get('config_tax') ? 'P' : false), $this->config->get('config_currency'));
                                        $data['feetprice_only'] = $this->tax->calculate($priceperfeet_price, $product_info['tax_class_id'], $this->config->get('config_tax') ? 'P' : false);
                                    }
                                }
                            }
                        }

			$data['recurrings'] = $this->model_catalog_product->getProfiles($this->request->get['product_id']);

			$this->model_catalog_product->updateViewed($this->request->get['product_id']);

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');            $data['content_breadcrumbs'] = $this->load->controller('common/breadbcrumb',$data['breadcrumbs']);            
                        $data['content_breadcrumbs'] = $this->load->controller('common/breadbcrumb',$data['breadcrumbs']);
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');
                        
                        $nodirect_checkout_prods = array("50","51","61");
                        
                        if(in_array($this->request->get['product_id'],$nodirect_checkout_prods))
                        $data['direct_checkout'] = 1;
                        else
                        $data['direct_checkout'] = 0;
                        
			$this->response->setOutput($this->load->view('product/product', $data));
		} else {
			$url = '';

			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['manufacturer_id'])) {
				$url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
			}

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}

			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_error'),
				'href' => $this->url->link('product/product', $url . '&product_id=' . $product_id)
			);

			$this->document->setTitle($this->language->get('text_error'));

			$data['heading_title'] = $this->language->get('text_error');

			$data['text_error'] = $this->language->get('text_error');

			$data['button_continue'] = $this->language->get('button_continue');

			$data['continue'] = $this->url->link('common/home');

			$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');            $data['content_breadcrumbs'] = $this->load->controller('common/breadbcrumb',$data['breadcrumbs']);          
                        $data['content_breadcrumbs'] = $this->load->controller('common/breadbcrumb',$data['breadcrumbs']);
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('error/not_found', $data));
		}
	}
        
        public function calculate() 
        {
            $this->language->load('product/product');
            $this->load->model('catalog/product');
            
            $product_info = $this->model_catalog_product->getProduct($_REQUEST['product_id']);
            
            $price = $product_info['price'];
            
            $height = 0;
            $width  = 0;
            $pgroometprice = 0;
            $pgroometqty = 0;
            $hcinch = 0;
            $heightinch = 0;  
            $wcinch = 0;
            $widthinch = 0;
            
            $json = array();

            if(isset($_REQUEST['option']))
            {
                foreach ($_REQUEST['option'] as $key=>$op)
                {
                                    
                    $price  = $price + $this->model_catalog_product->getValue($key,$op);                     
                   
                    if(isset($_REQUEST['pheight']) && $_REQUEST['pheight']!='')
                    { 
                        if($key == $_REQUEST['pheight'])
                        {
                            if($op>0)
                            {
                                $hcinch = $op*12;
                            }    
                        }                        
                    }                    
                   
                    if(isset($_REQUEST['pheightinch']) && $_REQUEST['pheightinch']!='')
                    {                        
                        if($key == $_REQUEST['pheightinch'])
                        {
                            $heightinch = $op;
                        }                       
                    }                    
                   
                    if(isset($_REQUEST['pwidth']) && $_REQUEST['pwidth']!='')
                    {
                        if($key == $_REQUEST['pwidth'])
                        {
                            if($op>0)
                            {
                                $wcinch = $op*12;
                            }  
                        }
                    }                    
                   
                    if(isset($_REQUEST['pwidthinch']) && $_REQUEST['pwidthinch']!=''){
                        if($key == $_REQUEST['pwidthinch'])
                        {
                            $widthinch = $op;
                        }
                    }
                    
                    if(isset($_REQUEST['pgroometprice']) && $_REQUEST['pgroometprice']!='' && isset($_REQUEST['pgroometqty']) && $_REQUEST['pgroometqty']!='')
                    { 
                        if($key == $_REQUEST['pgroometprice'])
                        {
                            $pgroometprice = $op;
                        }

                        if($key == $_REQUEST['pgroometqty'])
                        {
                            $pgroometqty = $op;
                        }
                    }
                }
                
                if($pgroometprice>0 && $pgroometprice!="" && is_numeric($pgroometprice) && $pgroometqty>0 && $pgroometqty!='' && is_numeric($pgroometqty) )
                { 

                    $price  = $price + ($pgroometprice*$pgroometqty);
                }   
            }
            
            if(isset($_REQUEST['let_us_prc'])&& $_REQUEST['let_us_prc']!='')
            {             
                $price  = $price + $_REQUEST['let_us_prc'];
            }
            
            $priceperfeet_price = $_REQUEST['pfeetprice'];   
                
            /* get discount Feet price*/                     
//            $discount_type = array("23");
//            foreach ($this->model_catalog_product->getProductOptions($_REQUEST['product_id']) as $option) {
//                if (in_array($option['option_id'], $discount_type)) {
//                    $product_option_value_data = array();
//                    foreach ($option['product_option_value'] as $option_value) {
//                        $disc_qty = $option_value['name'];
//                        $disc_prc = $option_value['price'];
//
//                        if($_REQUEST['quantity']>=$disc_qty)
//                        {
//                            $priceperfeet_price = $disc_prc;
//                        }    
//                    }
//                }
//             }
            
            /* Identify the material type value to get discount percentage*/
            if(isset($_REQUEST['pmat_type_value']) && $_REQUEST['pmat_type_value']!=""){
                if($_REQUEST['pmat_type_value']=="13 oz")
                {    
                    /* 13oz discount percentage */                     
                    $discount_type = array("64");
                }else if($_REQUEST['pmat_type_value']=="15 oz")
                {    
                    /* 15oz discount percentage */                     
                    $discount_type = array("65");
                }else if($_REQUEST['pmat_type_value']=="18 oz")
                {    
                    /* 18oz discount percentage */                     
                    $discount_type = array("66");
                }else if($_REQUEST['pmat_type_value']=="10 oz")
                {    
                    /* 10oz discount percentage */                     
                    $discount_type = array("68");
                }    
            }else{
                $discount_type = array(); 
            }
            
            $disc_percentage = "";
            if(!empty($discount_type)){
            foreach ($this->model_catalog_product->getProductOptions($_REQUEST['product_id']) as $option) {
                    if (in_array($option['option_id'], $discount_type)) {
                        $product_option_value_data = array();
                        foreach ($option['product_option_value'] as $option_value) {
                            $disc_qty = $option_value['name'];
                            $disc_prc = $option_value['price'];

                            if($_REQUEST['quantity']>=$disc_qty)
                            {
                                $disc_percentage = $disc_prc;
                            }    
                        }
                    }
                }
            }
            
            $calculation_price = 0;
            
            $height = ($hcinch+$heightinch)/12;
            $width = ($wcinch+$widthinch)/12;
           // echo "HCinch".$hcinch."#heightinch".$heightinch."#hegith".$height; 
           // echo "WCinch".$wcinch."#Wightinch".$widthinch."#With".$width;
           // exit;
            if(isset($_REQUEST['pfeetprice']) && $_REQUEST['pfeetprice']!='')
            {
                if($height>0 && $height!="" && is_numeric($height) && $width>0 && $width!='' && is_numeric($width) )
                { 
                   $calculation_price  = $height*$width*$priceperfeet_price;
                   $price  = $price + $calculation_price;
                }    
            } 
          
            
//            echo "price:".$price."=priceperfeet_price:".$_REQUEST['pfeetprice']."=width:".$width."= height:".$height."calculation_price=".$calculation_price;
//                       exit;
            
            $json['calculated_feetprice']  = $calculation_price;
            
            $json['success'] = 1;
            
            $price = $this->tax->calculate($price, $product_info['tax_class_id'], true);
            
            if(isset($_REQUEST['quantity']) && is_numeric($_REQUEST['quantity']) && $_REQUEST['quantity']>0)
            {         
                
                $price = $price*$_REQUEST['quantity'];
            }    
            
            /* Discount Calc */
            if($disc_percentage!=""){   
                $orgp = $price;
                $disc_price = $orgp * ($disc_percentage/100);
                $price = ($orgp - $disc_price);   
                $json['org_price']  = $this->currency->format($orgp, $this->config->get('config_currency'));
            }else{
                $json['org_price']  = "";
            }            
            
            //$json['tax']   = $this->currency->format($price);//$str;//$size['price'];            
            $json['price']  = $this->currency->format($price, $this->config->get('config_currency'));
            $json['price_without_currency']  = $price;
           
            
            $this->response->setOutput(json_encode($json));
	}
        
        public function qtycalculate(){
            
            $this->language->load('product/product');
            $this->load->model('catalog/product');
                                    
            $height = 0;
            $width  = 0;
            $hcinch = 0;
            $heightinch = 0;  
            $wcinch = 0;
            $widthinch = 0;
            
            $json = array();
            $json['success'] = 1;
            $json['grmtqty'] = 4;

            if(isset($_REQUEST['option']))
            {
                foreach ($_REQUEST['option'] as $key=>$op)
                {
                    if(isset($_REQUEST['pheight']) && $_REQUEST['pheight']!='')
                    { 
                        if($key == $_REQUEST['pheight'])
                        {
                            if($op>0)
                            {
                                $hcinch = $op*12;
                            }    
                        }                        
                    }                    
                   
                    if(isset($_REQUEST['pheightinch']) && $_REQUEST['pheightinch']!='')
                    {                        
                        if($key == $_REQUEST['pheightinch'])
                        {
                            $heightinch = $op;
                        }                       
                    }                    
                   
                    if(isset($_REQUEST['pwidth']) && $_REQUEST['pwidth']!='')
                    {
                        if($key == $_REQUEST['pwidth'])
                        {
                            if($op>0)
                            {
                                $wcinch = $op*12;
                            }  
                        }
                    }                    
                   
                    if(isset($_REQUEST['pwidthinch']) && $_REQUEST['pwidthinch']!=''){
                        if($key == $_REQUEST['pwidthinch'])
                        {
                            $widthinch = $op;
                        }
                    }
                }
                
                $height = ($hcinch+$heightinch)/12;
                $width = ($wcinch+$widthinch)/12;
                
                if ($height % 2 == 0 && $width % 2 == 0) {
                   // Even
                    $grmtqty = $height + $width;
                }else if ($height % 2 != 0 && $width % 2 != 0) {                    
                   // Odd
                    $grmtqty = ($height + $width) - 2;                  
                }else{
                   // odd or even
                    $grmtqty = ($height + $width) - 1;
                }
             
                $json['grmtqty'] = $grmtqty;                
            }
           
            $this->response->setOutput(json_encode($json));
        }

	public function review() {
		$this->load->language('product/product');

		$this->load->model('catalog/review');

		$data['text_no_reviews'] = $this->language->get('text_no_reviews');

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$data['reviews'] = array();

		$review_total = $this->model_catalog_review->getTotalReviewsByProductId($this->request->get['product_id']);

		$results = $this->model_catalog_review->getReviewsByProductId($this->request->get['product_id'], ($page - 1) * 3, 3);

		foreach ($results as $result) {
			$data['reviews'][] = array(
				'author'     => $result['author'],
				'text'       => nl2br($result['text']),
				'rating'     => (int)$result['rating'],
				'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added']))
			);
		}

		$pagination = new Pagination();
		$pagination->total = $review_total;
		$pagination->page = $page;
		$pagination->limit = 3;
		$pagination->url = $this->url->link('product/product/review', 'product_id=' . $this->request->get['product_id'] . '&page={page}');

		$data['pagination'] = $pagination->render();
                
		$data['results'] = sprintf($this->language->get('text_pagination'), ($review_total) ? (($page - 1) * 3) + 1 : 0, ((($page - 1) * 3) > ($review_total - 3)) ? $review_total : ((($page - 1) * 3) + 3), $review_total, ceil($review_total / 3));

		$this->response->setOutput($this->load->view('product/review', $data));
	}

	public function write() {
		$this->load->language('product/product');

		$json = array();

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 25)) {
				$json['error'] = $this->language->get('error_name');
			}

			if ((utf8_strlen($this->request->post['text']) < 25) || (utf8_strlen($this->request->post['text']) > 1000)) {
				$json['error'] = $this->language->get('error_text');
			}

			if (empty($this->request->post['rating']) || $this->request->post['rating'] < 0 || $this->request->post['rating'] > 5) {
				$json['error'] = $this->language->get('error_rating');
			}

			// Captcha
			if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('review', (array)$this->config->get('config_captcha_page'))) {
				$captcha = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha') . '/validate');

				if ($captcha) {
					$json['error'] = $captcha;
				}
			}

			if (!isset($json['error'])) {
				$this->load->model('catalog/review');

				$this->model_catalog_review->addReview($this->request->get['product_id'], $this->request->post);

				$json['success'] = $this->language->get('text_success');
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
        
        public function askyourquestion() {
		$this->load->language('product/product');

		$json = array();

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			if ((utf8_strlen($this->request->post['uname']) < 3) || (utf8_strlen($this->request->post['uname']) > 25)) {
				$json['error'] = "Name must be between 3 and 25 characters!";
			}
                        
                        if ((utf8_strlen($this->request->post['uemail']) > 96) || !filter_var($this->request->post['uemail'], FILTER_VALIDATE_EMAIL)) {
                                $json['error'] = "Please enter valid email address.";
                        }

			if ((utf8_strlen($this->request->post['ucomment']) < 25) || (utf8_strlen($this->request->post['ucomment']) > 1000)) {
				$json['error'] = "Message must be between 25 and 1000 characters!";
			}
			
			// Captcha
			if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('review', (array)$this->config->get('config_captcha_page'))) {
				$captcha = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha') . '/validate');

				if ($captcha) {
					$json['error'] = $captcha;
				}
			}

			if (!isset($json['error'])) {
				$this->load->model('catalog/review');

				$this->model_catalog_review->sendquestion($this->request->get['product_id'], $this->request->post);

				$json['success'] = "Thank you!!Store owner will review your mail and ping you back.";
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
        
        public function getaquote(){
             
            $this->load->language('checkout/cart');

            $json = array();

            if (isset($this->request->post['product_id'])) {
                    $product_id = (int)$this->request->post['product_id'];
            } else {
                    $product_id = 0;
            }

            $this->load->model('catalog/product');

            $product_info = $this->model_catalog_product->getProduct($product_id);

            if ($product_info) {

                if (isset($this->request->post['option'])) {
                        $option = array_filter($this->request->post['option']);
                } else {
                        $option = array();
                }

                $product_options = $this->model_catalog_product->getProductOptions($this->request->post['product_id']);

                foreach ($product_options as $product_option) {
                        if ($product_option['required'] && empty($option[$product_option['product_option_id']])) {
                                $json['error']['option'][$product_option['product_option_id']] = sprintf($this->language->get('error_required'), $product_option['name']);
                        }
                }
                
                if($this->request->post['quote_hf']=='' && !is_numeric($this->request->post['quote_hf']) || $this->request->post['quote_hf'] <= 0)
                {
                        $json['error']['quote_hf'] = "Required!";                      
                } 
                
                if($this->request->post['quote_hi']=='' && !is_numeric($this->request->post['quote_hi']) || $this->request->post['quote_hi'] < 0)
                {
                        $json['error']['quote_hi'] = "Required!";                      
                } 
                
                if($this->request->post['quote_wf']=='' && !is_numeric($this->request->post['quote_wf']) || $this->request->post['quote_wf'] <= 0)
                {
                        $json['error']['quote_wf'] = "Required!";                      
                } 
                
                if($this->request->post['quote_wi']=='' && !is_numeric($this->request->post['quote_wi']) || $this->request->post['quote_wi'] < 0)
                {
                        $json['error']['quote_wi'] = "Required!";                      
                } 
                
                 if($this->request->post['quantity']=='' && !is_numeric($this->request->post['quantity']) || $this->request->post['quantity'] <= 0)
                {
                        $json['error']['quantity'] = "Qty Required!";                      
                } 
                
                if ((utf8_strlen(trim($this->request->post['username'])) < 1) || (utf8_strlen(trim($this->request->post['username'])) > 32)) {
			$json['error']['username'] = "Name must be between 1 and 32 characters!";
		}
                
                if ((utf8_strlen($this->request->post['useremail']) > 96) || !filter_var($this->request->post['useremail'], FILTER_VALIDATE_EMAIL)) {
			$json['error']['uemail'] = "Not Valid!";
		}
                
                if ((utf8_strlen(trim($this->request->post['userphone'])) < 1)|| (utf8_strlen(trim($this->request->post['userphone'])) > 10)){                
                        $json['error']['uphone'] =  "Please give correct number!";
		}
                
                if (isset($this->request->post['usercomment']) && ( (utf8_strlen($this->request->post['usercomment']) < 25) || (utf8_strlen($this->request->post['usercomment']) > 1000))) {
                        $json['error']['ucomment'] = "Please aleast give 25 characters in comments!";;
                }

                if (!$json) {
                                        
                    $this->model_catalog_product->sendquote($this->request->get['product_id'], $this->request->post);
                    
                    $json['success'] = "Thank you for your quote!!Store owner will review your quote and ping you back.";
                }
            }  
            
            $this->response->addHeader('Content-Type: application/json');
            $this->response->setOutput(json_encode($json));
        }

	public function getRecurringDescription() {
		$this->load->language('product/product');
		$this->load->model('catalog/product');

		if (isset($this->request->post['product_id'])) {
			$product_id = $this->request->post['product_id'];
		} else {
			$product_id = 0;
		}

		if (isset($this->request->post['recurring_id'])) {
			$recurring_id = $this->request->post['recurring_id'];
		} else {
			$recurring_id = 0;
		}

		if (isset($this->request->post['quantity'])) {
			$quantity = $this->request->post['quantity'];
		} else {
			$quantity = 1;
		}

		$product_info = $this->model_catalog_product->getProduct($product_id);
		$recurring_info = $this->model_catalog_product->getProfile($product_id, $recurring_id);

		$json = array();

		if ($product_info && $recurring_info) {
			if (!$json) {
				$frequencies = array(
					'day'        => $this->language->get('text_day'),
					'week'       => $this->language->get('text_week'),
					'semi_month' => $this->language->get('text_semi_month'),
					'month'      => $this->language->get('text_month'),
					'year'       => $this->language->get('text_year'),
				);

				if ($recurring_info['trial_status'] == 1) {
					$price = $this->currency->format($this->tax->calculate($recurring_info['trial_price'] * $quantity, $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
					$trial_text = sprintf($this->language->get('text_trial_description'), $price, $recurring_info['trial_cycle'], $frequencies[$recurring_info['trial_frequency']], $recurring_info['trial_duration']) . ' ';
				} else {
					$trial_text = '';
				}

				$price = $this->currency->format($this->tax->calculate($recurring_info['price'] * $quantity, $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);

				if ($recurring_info['duration']) {
					$text = $trial_text . sprintf($this->language->get('text_payment_description'), $price, $recurring_info['cycle'], $frequencies[$recurring_info['frequency']], $recurring_info['duration']);
				} else {
					$text = $trial_text . sprintf($this->language->get('text_payment_cancel'), $price, $recurring_info['cycle'], $frequencies[$recurring_info['frequency']], $recurring_info['duration']);
				}

				$json['success'] = $text;
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
        
        
}
