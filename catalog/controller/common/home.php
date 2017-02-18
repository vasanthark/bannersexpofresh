<?php

class ControllerCommonHome extends Controller {

    public function index() {
        $this->document->setTitle($this->config->get('config_meta_title'));
        $this->document->setDescription($this->config->get('config_meta_description'));
        $this->document->setKeywords($this->config->get('config_meta_keyword'));

        if (isset($this->request->get['route'])) {
            $this->document->addLink($this->config->get('config_url'), 'canonical');
        }

        $this->load->model('catalog/information');

        // Welcome Text
        $welcome_information_id = 7;
        $welcome_txt_info = $this->model_catalog_information->getInformation($welcome_information_id);
        if (!empty($welcome_txt_info))
            $data['welcome_txt_info'] = html_entity_decode($welcome_txt_info['description'], ENT_QUOTES, 'UTF-8');
        else
            $data['welcome_txt_info'] = false;

        // Why Banner Expo
        $why_information_id = 8;
        $why_txt_info = $this->model_catalog_information->getInformation($why_information_id);
        if (!empty($welcome_txt_info))
            $data['why_banner_expo'] = html_entity_decode($why_txt_info['description'], ENT_QUOTES, 'UTF-8');
        else
            $data['why_banner_expo'] = false;

        // Tech Spec
        $tec_information_id = 9;
        $tec_txt_info = $this->model_catalog_information->getInformation($tec_information_id);
        if (!empty($tec_txt_info))
            $data['tec_banner_expo'] = html_entity_decode($tec_txt_info['description'], ENT_QUOTES, 'UTF-8');
        else
            $data['tec_banner_expo'] = false;

        $youtube_information_id = 10;
        $youtube_txt_info = $this->model_catalog_information->getInformation($youtube_information_id);
        if (!empty($youtube_txt_info))
            $data['youtube_banner_expo'] = html_entity_decode($youtube_txt_info['description'], ENT_QUOTES, 'UTF-8');
        else
            $data['youtube_banner_expo'] = false;

        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');

        $data['footer'] = $this->load->controller('common/footer');

        $data['header'] = $this->load->controller('common/header');

        $this->load->model('extension/module/testimonial');
        $results = $this->model_extension_module_testimonial->getModuleReviews();

        $userrates = 0;
        if ($results) {
            foreach ($results as $result) {
                $data['reviews'][] = array(
                    'review_id' => $result['review_id'],
                    'text' => utf8_substr(strip_tags(html_entity_decode($result['text'], ENT_QUOTES, 'UTF-8')), 0, 150) . '..',
                    'rating' => (int) $result['rating'],
                    'author' => $result['author'],
                    'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
                );

                $userrates += (int) $result['rating'];
            }

            $totalreviews = count($data['reviews']);
            $data['totalreviews'] = $totalreviews;
            $avg_rate = $userrates / $totalreviews;
            $data['avg_rate'] = $avg_rate;
        }

        // live
        $product_id = '50';

        $discount_type = array("23");
        $disc_qty_prc = array();
        foreach ($this->model_catalog_product->getProductOptions($product_id) as $option) {
            if (in_array($option['option_id'], $discount_type)) {
                $product_option_value_data = array();
                foreach ($option['product_option_value'] as $option_value) {
                    $disc_qty = $option_value['name'];
                    $disc_prc = $option_value['price'];
                    $disc_qty_prc[$disc_qty] = $disc_prc;
                }
            }
        }

        $data['product_id'] = $product_id;

        $product_info = $this->model_catalog_product->getProduct($product_id);

        $data['showhomecalc'] = 0;
        if (!empty($product_info)) {
            $data['showhomecalc'] = 1;
        }

        if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
            $data['price'] = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->config->get('config_currency'));
            $data['prod_price_only'] = $this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax'));
        } else {
            $data['price'] = false;
            $data['prod_price_only'] = false;
        }

        if ((float) $product_info['special']) {
            $data['special'] = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
            $data['special_price_only'] = $this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax'));
        } else {
            $data['special'] = false;
            $data['special_price_only'] = false;
        }

        if (!empty($product_info)) {
            if ($product_info['minimum']) {
                $data['minimum'] = $product_info['minimum'];
            } else {
                $data['minimum'] = 1;
            }

            foreach ($this->model_catalog_product->getProductOptions($product_id) as $option) {
                $product_option_value_data = array();

                foreach ($option['product_option_value'] as $option_value) {
                    if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
                        if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float) $option_value['price']) {
                            $price = $this->currency->format($this->tax->calculate($option_value['price'], $product_info['tax_class_id'], $this->config->get('config_tax') ? 'P' : false), $this->config->get('config_currency'));
                            $priceonly = $this->tax->calculate($option_value['price'], $product_info['tax_class_id'], $this->config->get('config_tax') ? 'P' : false);
                        } else {
                            $price = false;
                            $priceonly = false;
                        }

                        $product_option_value_data[] = array(
                            'product_option_value_id' => $option_value['product_option_value_id'],
                            'option_value_id' => $option_value['option_value_id'],
                            'name' => $option_value['name'],
                            'price' => $price,
                            'price_prefix' => $option_value['price_prefix'],
                            'priceonly' => $priceonly
                        );
                    }
                }

                $data['options'][] = array(
                    'product_option_id' => $option['product_option_id'],
                    'product_option_value' => $product_option_value_data,
                    'option_id' => $option['option_id'],
                    'name' => $option['name'],
                    'type' => $option['type'],
                    'value' => $option['value'],
                    'required' => $option['required']
                );
            }
            $data['text_select'] = $this->language->get('text_select');
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
        }

        /* Rigid Signs - CatId 60 */
        $data['rs_products'] = $this->model_catalog_product->getCatproducts(60);

        $data['displays'] = $this->url->link('product/category', 'path=59');
        $data['banner_stands'] = $this->url->link('product/category', 'path=61');     
        $data['yard_signs'] = $this->url->link('product/product', 'product_id=53');
        $data['wall_decals'] = $this->url->link('product/product', 'product_id=56');

        $this->response->setOutput($this->load->view('common/home', $data));
    }

    public function viewoptions() {
        $data = array();

        $this->load->model('catalog/product');

        // live
        if (isset($this->request->post['product_id'])) {
            $product_id = $this->request->post['product_id'];
        } else {
            $product_id = 0;
        }

        if ($product_id > 0) {
            
            $download_infos = $this->model_catalog_product->getSpecDownload($product_id);
            
            if($download_infos){                    
                $data['pdf_name'] = $download_infos['filename'];
            }else{
                $data['pdf_name'] = "";
            }
            $data['product_url'] =  $this->url->link('product/product', 'product_id='.$product_id);
            
            $data['text_loading'] = $this->language->get('text_loading');
            
            $data['siteurl'] =  $this->config->get('config_url');
            
            $nodirect_checkout_prods = array("50","51","61");
                        
            if(in_array($product_id,$nodirect_checkout_prods))
            $data['direct_checkout'] = 1;
            else
            $data['direct_checkout'] = 0;

            $data['special_p'] = 0;
            // Direct Req Quote Forms
            $special_products = array(56);
            if (in_array($product_id, $special_products)) {
                $data['special_p'] = 1;
            }

            $data['yard_p'] = 0;
            $yard_product = array(53);
            if (in_array($product_id, $yard_product)) {
                $data['yard_p'] = 1;
            }

            $discount_type = array("23");
            $disc_qty_prc = array();
            foreach ($this->model_catalog_product->getProductOptions($product_id) as $option) {
                if (in_array($option['option_id'], $discount_type)) {
                    $product_option_value_data = array();
                    foreach ($option['product_option_value'] as $option_value) {
                        $disc_qty = $option_value['name'];
                        $disc_prc = $option_value['price'];
                        $disc_qty_prc[$disc_qty] = $disc_prc;
                    }
                }
            }

            $data['product_id'] = $product_id;

            $product_info = $this->model_catalog_product->getProduct($product_id);

            $data['showhomecalc'] = 0;
            if (!empty($product_info)) {
                $data['showhomecalc'] = 1;
            }

            if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                $data['price'] = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->config->get('config_currency'));
                $data['prod_price_only'] = $this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax'));
            } else {
                $data['price'] = false;
                $data['prod_price_only'] = false;
            }

            if ((float) $product_info['special']) {
                $data['special'] = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
                $data['special_price_only'] = $this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax'));
            } else {
                $data['special'] = false;
                $data['special_price_only'] = false;
            }

            if (!empty($product_info)) {
                if ($product_info['minimum']) {
                    $data['minimum'] = $product_info['minimum'];
                } else {
                    $data['minimum'] = 1;
                }

                foreach ($this->model_catalog_product->getProductOptions($product_id) as $option) {
                    $product_option_value_data = array();

                    foreach ($option['product_option_value'] as $option_value) {
                        if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
                            if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float) $option_value['price']) {
                                $price = $this->currency->format($this->tax->calculate($option_value['price'], $product_info['tax_class_id'], $this->config->get('config_tax') ? 'P' : false), $this->config->get('config_currency'));
                                $priceonly = $this->tax->calculate($option_value['price'], $product_info['tax_class_id'], $this->config->get('config_tax') ? 'P' : false);
                            } else {
                                $price = false;
                                $priceonly = false;
                            }

                            $product_option_value_data[] = array(
                                'product_option_value_id' => $option_value['product_option_value_id'],
                                'option_value_id' => $option_value['option_value_id'],
                                'name' => $option_value['name'],
                                'price' => $price,
                                'price_prefix' => $option_value['price_prefix'],
                                'priceonly' => $priceonly
                            );
                        }
                    }

                    $data['options'][] = array(
                        'product_option_id' => $option['product_option_id'],
                        'product_option_value' => $product_option_value_data,
                        'option_id' => $option['option_id'],
                        'name' => $option['name'],
                        'type' => $option['type'],
                        'value' => $option['value'],
                        'required' => $option['required']
                    );
                }
                
                $data['text_select'] = $this->language->get('text_select');
                
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
            }

            $load_view = $this->load->view('common/viewoptions', $data);
            echo $load_view;
            exit;
        } else {
            echo "FAIL";
            exit;
        }
    }

}
