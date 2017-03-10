<?php
class ControllerStartupSeoUrl extends Controller {
	public function index() {
		// Add rewrite to url class
		if ($this->config->get('config_seo_url')) {
			$this->url->addRewrite($this);
		}
                
		// Decode URL
		if (isset($this->request->get['_route_'])) {
			$parts = explode('/', $this->request->get['_route_']);

                       
			// remove any empty arrays from trailing
			if (utf8_strlen(end($parts)) == 0) {
				array_pop($parts);
			}
                        if($parts[0] == 'blog'){
                            if(isset($parts[1])){
                                $_newparts = array();
                                $_newparts[0] = implode($parts,'/');
                                unset($parts);
                                $parts = $_newparts;
                            }
                        }
                        $_searchtext = '';
                         if($parts[0] == 'search'){
                            
                            if(isset($parts[1])){
                                 
                                $_searchtext = $parts[1];
                                unset($parts);
                                $parts[0] = 'search';
                            }
                        }
                        
                        //custom download url
                        $pos = strpos($parts[0], 'download-');
                        if ($pos !== false) {                            
                            $download_id = str_replace("download-","",$parts[0]);                               
                            $parts[0] = "download";                            
                        }  
                        
                        $pos = strpos($parts[0], 'quickorder-');
                        if ($pos !== false) {                            
                            $prodcut_id = str_replace("quickorder-","",$parts[0]);                               
                            $parts[0] = $parts[0]."/";                            
                        } 
                        
			foreach ($parts as $part) {
                            //echo "SELECT * FROM " . DB_PREFIX . "url_alias WHERE keyword = '" . $this->db->escape($part) . "'";
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE keyword = '" . $this->db->escape($part) . "'");  
                               // echo $query->num_rows; exit;
				if ($query->num_rows) {
                                    
					$url = explode('=', $query->row['query']);

                                        if ($url[0] == 'quickorder') {
						$this->request->get['quickorder'] = $prodcut_id;
					}
                                        if($parts[0] == 'search' && $_searchtext != ''){
                                            
                                            $this->request->get['search'] = $_searchtext;
                                             
                                        }
					if ($url[0] == 'product_id') {
                                            
						$this->request->get['product_id'] = $url[1];
					}

					if ($url[0] == 'category_id') {
						if (!isset($this->request->get['path'])) {
							$this->request->get['path'] = $url[1];
						} else {
							$this->request->get['path'] .= '_' . $url[1];
						}
					}
                                        //custom download url
                                        if ($url[0] == 'download_id') {
                                            $this->request->get['download_id'] = $download_id;
                                        }

					if ($url[0] == 'manufacturer_id') {
						$this->request->get['manufacturer_id'] = $url[1];
					}

					if ($url[0] == 'information_id') {
						$this->request->get['information_id'] = $url[1];
					}
					if ($url[0] == 'tltblog_id') {
						$this->request->get['tltblog_id'] = $url[1];
					}

					if ($url[0] == 'tlttag_id') {
						$this->request->get['tlttag_id'] = $url[1];
					}

					if ($url[0] == 'tltpath') {
						$this->request->get['tltpath'] = $url[1];
					}
                                        if ($url[0] == 'address_id') {
						$this->request->get['address_id'] = $url[1];
					}
                                        if ($url[0] == 'faq_id') {
						$this->request->get['faq_id'] = $url[1];
					}
                                        if ($url[0] == 'order_id') {
						$this->request->get['order_id'] = $url[1];
					}
                                       
                                        
                                        //custom download url
//					if ($query->row['query'] && $url[0] != 'quickorder' && $url[0] != 'product/search' &&  $url[0] != 'information_id'&& $url[0] != 'download_id'  && $url[0] != 'manufacturer_id' && $url[0] != 'category_id' && $url[0] != 'product_id' && $url[0] != 'tltblog_id' && $url[0] != 'tlttag_id' && $url[0] != 'tltpath' && $url[0] != 'address_id' && $url[0] != 'faq_id' && $url[0] != 'order_id' ) {
                                        if ($query->row['query'] && $url[0] != 'quickorder' &&  $url[0] != 'information_id'&& $url[0] != 'download_id'  && $url[0] != 'manufacturer_id' && $url[0] != 'category_id' && $url[0] != 'product_id' && $url[0] != 'tltblog_id' && $url[0] != 'tlttag_id' && $url[0] != 'tltpath' && $url[0] != 'address_id' && $url[0] != 'faq_id' && $url[0] != 'order_id' ) {
						$this->request->get['route'] = $query->row['query'];
					}
                                        
					
				} else {
					$this->request->get['route'] = 'error/not_found';

					break;
				}
			}
                        

			if (!isset($this->request->get['route'])) {
				if (isset($this->request->get['product_id'])) {
					$this->request->get['route'] = 'product/product';
				} elseif (isset($this->request->get['download_id'])) {
					$this->request->get['route'] = 'product/product/download';//custom download url
				} elseif (isset($this->request->get['path'])) {
					$this->request->get['route'] = 'product/category';
				} elseif (isset($this->request->get['manufacturer_id'])) {
					$this->request->get['route'] = 'product/manufacturer/info';
				} elseif (isset($this->request->get['information_id'])) {
					$this->request->get['route'] = 'information/information';
				}elseif (isset($this->request->get['tltblog_id'])) {
					$this->request->get['route'] = 'tltblog/tltblog';
				} elseif (isset($this->request->get['tlttag_id'])) {
					$this->request->get['route'] = 'tltblog/tlttag';
				} elseif (isset($this->request->get['tltpath'])) {
					$this->request->get['route'] = 'tltblog/tlttag';
				} elseif (isset($this->request->get['address_id'])) {
					$this->request->get['route'] = 'account/address/edit';
				} elseif (isset($this->request->get['faq_id'])) {
					$this->request->get['route'] = 'information/faq/faq_single';
				}elseif (isset($this->request->get['order_id'])) {
					$this->request->get['route'] = 'account/order/info';
				}elseif (isset($this->request->get['quickorder'])) {
                                         $this->request->get['product_id'] = $prodcut_id;
					$this->request->get['route'] = 'common/quickorder';
				}elseif (isset($this->request->get['search'])) {
					$this->request->get['route'] = 'product/search';
				}    
                                            
                                
			}
                                                

			if (isset($this->request->get['route'])) {
				return new Action($this->request->get['route']);
			}
		}
	}

	public function rewrite($link) {
            $this->load->model('tltblog/url_alias');
		$url_info = parse_url(str_replace('&amp;', '&', $link));

		$url = '';

		$data = array();

		parse_str($url_info['query'], $data);

		foreach ($data as $key => $value) {
			if (isset($data['route'])) {
				if (($data['route'] == 'product/product' && $key == 'product_id') || (($data['route'] == 'product/manufacturer/info' || $data['route'] == 'product/product') && $key == 'manufacturer_id') || ($data['route'] == 'information/information' && $key == 'information_id') || ($data['route'] == 'tltblog/tltblog' && $key == 'tltblog_id') || ($data['route'] == 'tltblog/tlttag' && $key == 'tlttag_id') || ($data['route'] == 'information/faq/faq_list' && $key == 'faq_id') ) { 
					$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE `query` = '" . $this->db->escape($key . '=' . (int)$value) . "'");

					if ($query->num_rows && $query->row['keyword']) {
						$url = '/' . $query->row['keyword'];

						unset($data[$key]);
					}
				} elseif ($key == 'path') {
					$categories = explode('_', $value);

					foreach ($categories as $category) {
						$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE `query` = 'category_id=" . (int)$category . "'");

						if ($query->num_rows && $query->row['keyword']) {
							$url .= '/' . $query->row['keyword'];
						} else {
							$url = '';

							break;
						}
					}

					unset($data[$key]);
                                }elseif(($data['route'] == 'product/product/download' && $key == 'download_id')){
					$this->request->get['route'] = 'product/product/download';
                                        $url .= '/download-' . $value; //custom download url
                                    unset($data[$key]);
				}elseif(($data['route'] == 'account/order/info' && $key == 'order_id')){
                                    $url .= '/order-' . $value;
                                    unset($data[$key]);
                                } elseif(($data['route'] == 'account/address/edit' && $key == 'address_id')){
                                    $url .= '/account-address-edit-' . $value;
                                    unset($data[$key]);
                                }elseif ($key == 'tltpath') {
						$url_alias = $this->model_tltblog_url_alias->getUrlAliasByQuery($this->db->escape($key . '=' . $value));
	
						if ($url_alias) {
							$url .= '/' . $url_alias['keyword'];
	
							unset($data[$key]);
						}
					}
                                else  {
					$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE `query` = '" .$data['route'] . "'");

					if ($query->num_rows && $query->row['keyword']) {
						$url .= '/' . $query->row['keyword'];

						unset($data[$key]);
					}
				}
			}
		}

		if ($url) {
			unset($data['route']);

			$query = '';

			if ($data) {
				foreach ($data as $key => $value) {
					$query .= '&' . rawurlencode((string)$key) . '=' . rawurlencode((string)$value);
				}

				if ($query) {
					$query = '?' . str_replace('&', '&amp;', trim($query, '&'));
				}
			}

			return $url_info['scheme'] . '://' . $url_info['host'] . (isset($url_info['port']) ? ':' . $url_info['port'] : '') . str_replace('/index.php', '', $url_info['path']) . $url . $query;
		} else {
                        $link = str_replace('index.php?route=common/home', '', $link);
			return $link;
		}
	}
}
