<?php

class ControllerCommonHeader extends Controller {

    public function index() {
        // Analytics
        $this->load->model('extension/extension');
        $this->load->model('catalog/information');

        $this->document->addScript('catalog/view/javascript/jquery/newsletter/js/main.js');
        // $this->document->addScript('catalog/view/javascript/jquery/jquery.raty-fa.js');

        $data['analytics'] = array();

        $analytics = $this->model_extension_extension->getExtensions('analytics');

        foreach ($analytics as $analytic) {
            if ($this->config->get($analytic['code'] . '_status')) {
                $data['analytics'][] = $this->load->controller('extension/analytics/' . $analytic['code'], $this->config->get($analytic['code'] . '_status'));
            }
        }

        if ($this->request->server['HTTPS']) {
            $server = $this->config->get('config_ssl');
        } else {
            $server = $this->config->get('config_url');
        }

        if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
            $this->document->addLink($server . 'image/' . $this->config->get('config_icon'), 'icon');
        }

        $data['title'] = $this->document->getTitle();

        $data['base'] = $server;
        $data['description'] = $this->document->getDescription();
        $data['keywords'] = $this->document->getKeywords();
        $data['links'] = $this->document->getLinks();
        $data['styles'] = $this->document->getStyles();
        $data['scripts'] = $this->document->getScripts();
        $data['lang'] = $this->language->get('code');
        $data['direction'] = $this->language->get('direction');

        $data['store_email'] = $this->config->get('config_email');

        $data['name'] = $this->config->get('config_name');

        if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
            $data['logo'] = $server . 'image/' . $this->config->get('config_logo');
        } else {
            $data['logo'] = '';
        }

        $this->load->language('common/header');

        $data['text_home'] = $this->language->get('text_home');

        // Wishlist
        if ($this->customer->isLogged()) {
            $this->load->model('account/wishlist');

            $data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), $this->model_account_wishlist->getTotalWishlist());
        } else {
            $data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
        }

        $data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
        $data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', true), $this->customer->getFirstName(), $this->url->link('account/logout', '', true));

        $data['text_account'] = $this->language->get('text_account');
        $data['text_register'] = $this->language->get('text_register');
        $data['text_login'] = $this->language->get('text_login');
        $data['text_order'] = $this->language->get('text_order');
        $data['text_transaction'] = $this->language->get('text_transaction');
        $data['text_download'] = $this->language->get('text_download');
        $data['text_logout'] = $this->language->get('text_logout');
        $data['text_checkout'] = $this->language->get('text_checkout');
        $data['text_category'] = $this->language->get('text_category');
        $data['text_all'] = $this->language->get('text_all');

        $data['home'] = $this->url->link('common/home');
        $data['wishlist'] = $this->url->link('account/wishlist', '', true);
        $data['logged'] = $this->customer->isLogged();
        $data['account'] = $this->url->link('account/account', '', true);
        $data['register'] = $this->url->link('account/register', '', true);
        $data['login'] = $this->url->link('account/login', '', true);
        $data['order'] = $this->url->link('account/order', '', true);
        $data['transaction'] = $this->url->link('account/transaction', '', true);
        $data['download'] = $this->url->link('account/download', '', true);
        $data['logout'] = $this->url->link('account/logout', '', true);
        $data['shopping_cart'] = $this->url->link('checkout/cart');
        $data['checkout'] = $this->url->link('checkout/checkout', '', true);
        $data['contact'] = $this->url->link('information/contact');
        $data['telephone'] = $this->config->get('config_telephone');
        $data['faq'] = $this->url->link('information/faq', '', true);
        $data['blog'] = $this->url->link('tltblog/tlttag', '', true);

        $data['about_us'] = $this->url->link('information/information', 'information_id=4', true);

        // Menu
        $this->load->model('catalog/category');

        $this->load->model('catalog/product');        
        

         /* Displays - CatId 59 */
        $data['disp_products'] = $this->model_catalog_product->getCatproducts(59);
        
        /* Rigid Signs - CatId 60 */
        $data['rs_products'] = $this->model_catalog_product->getCatproducts(60);
        
        /* Banner Stands - CatId 61 */
        $data['bs_products'] = $this->model_catalog_product->getCatproducts(61);
        
        /* Displays - Floor stand - CatId 62 */
        // $data['dfs_products'] = $this->model_catalog_product->getCatproducts(62);

         /* Displays - Table Covers - CatId 63 */
        // $data['dtc_products'] = $this->model_catalog_product->getCatproducts(63);
        
        /* Get cats */       
	$disp_category = $this->model_catalog_category->getCategoryInfo(59);
        $data['disp_cat_img'] = $disp_category['image'];
        
        $rs_category = $this->model_catalog_category->getCategoryInfo(60);
        $data['rs_cat_img'] = $rs_category['image'];
        
        $bs_category = $this->model_catalog_category->getCategoryInfo(61);
        $data['bs_cat_img'] = $bs_category['image'];
        
        $data['vinyl_banner'] = $this->url->link('product/product', 'product_id=50');
        $data['mesh_banner'] = $this->url->link('product/product', 'product_id=51');
        
        $data['displays'] = $this->url->link('product/category', 'path=59');        
       // $data['floor_stands']= $this->url->link('product/category', 'path=59_62');
      //  $data['table_covers']= $this->url->link('product/category', 'path=59_63');
        
      //  $data['a_frame_signs'] = $this->url->link('product/product', 'product_id=52');
     //   $data['trade_show'] = $this->url->link('product/product', 'product_id=75');
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
        
        $data['language'] = $this->load->controller('common/language');
        $data['currency'] = $this->load->controller('common/currency');
        $data['search'] = $this->load->controller('common/search');
        $data['cart'] = $this->load->controller('common/cart');

        $socialicon_information_id = 11;
        $social_txt_info = $this->model_catalog_information->getInformation($socialicon_information_id);
        if (!empty($social_txt_info))
            $data['social_icons'] = html_entity_decode($social_txt_info['description'], ENT_QUOTES, 'UTF-8');
        else
            $data['social_icons'] = false;
        
        $data['curr_page'] =  isset($this->request->get['route'])?$this->request->get['route']:"";

        // For page specific css
        if (isset($this->request->get['route'])) {
            if (isset($this->request->get['product_id'])) {
                $class = '-' . $this->request->get['product_id'];
            } elseif (isset($this->request->get['path'])) {
                $class = '-' . $this->request->get['path'];
            } elseif (isset($this->request->get['manufacturer_id'])) {
                $class = '-' . $this->request->get['manufacturer_id'];
            } elseif (isset($this->request->get['information_id'])) {
                $class = '-' . $this->request->get['information_id'];
            } else {
                $class = '';
            }

            $data['class'] = str_replace('/', '-', $this->request->get['route']) . $class;
        } else {
            $data['class'] = 'common-home';
        }

        return $this->load->view('common/header', $data);
    }
    
}