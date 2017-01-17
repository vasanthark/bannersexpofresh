<?php

class ControllerCommonQuickorder extends Controller {

    public function index() {

        $this->document->setTitle($this->config->get('config_meta_title'));
        $this->document->setDescription($this->config->get('config_meta_description'));
        $this->document->setKeywords($this->config->get('config_meta_keyword'));

        if (isset($this->request->get['route'])) {
            $this->document->addLink(HTTP_SERVER, 'canonical');
        }

        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');
        $data['text_loading'] = $this->language->get('text_loading');

        $this->load->language('product/product');
        $this->load->model('catalog/category');
        $this->load->model('catalog/information');
        $data['options'] = array();
        
        if(isset($this->request->get['product_id']) && $this->request->get['product_id']>0){
           $product_id = $this->request->get['product_id'];
        }else{
           $product_id = (int) $this->request->post['product_id'];
        }

        if (isset($this->request->post['product_id']) || $product_id!="") {            
            
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
                $data['special'] = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->config->get('config_currency'));
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
                        if (!$option_value['subtract'] || ($option_value ['quantity'] > 0)) {
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
                /*  Price per feet display price */
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
        }
        
         $this->response->setOutput($this->load->view('common/quickorder', $data));
        
    }

}
