<?php

class ControllerTltBlogTltBlog extends Controller {

    private $modulePath = 'tltblog/tltblog';

    public function index() {
        $this->load->language('tltblog/tltblog');

        $this->load->model('tltblog/tltblog');
        $this->load->model('catalog/product');
        $this->load->model('setting/setting');
        $this->load->model('tool/image');

        if ($this->config->get('tltblog_seo')) {
            require_once(DIR_APPLICATION . 'controller/tltblog/tltblog_seo.php');
            $tltblog_seo = new ControllerTltBlogTltBlogSeo($this->registry);
            $this->url->addRewrite($tltblog_seo);
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home')
        );

        if (isset($this->request->get['tltpath'])) {
            $path = $this->request->get['tltpath'];
        } elseif ($this->config->has('tltblog_path')) {
            $path = $this->config->get('tltblog_path');
        } else {
            $path = 'blogs';
        }

        $data['show_path'] = $this->config->get('tltblog_show_path');

        if ($data['show_path']) {
            if ($this->config->has('tltblog_path_title')) {
                $tmp_title = $this->config->get('tltblog_path_title');
                $root_title = $tmp_title[$this->config->get('config_language_id')]['path_title'];
            } else {
                $root_title = $this->language->get('text_title');
            }

            $data['breadcrumbs'][] = array(
                'text' => $root_title,
//                'href' => $this->url->link('tltblog/tlttag', 'tltpath=' . $path)
                'href' => $this->url->link('tltblog/tlttag')
            );
        }

        if (isset($this->request->get['tltblog_id'])) {
            $tltblog_id = (int) $this->request->get['tltblog_id'];
        } else {
            $tltblog_id = 0;
        }

        $tltblog_info = $this->model_tltblog_tltblog->getTltBlog($tltblog_id);

        if ($tltblog_info) {
            $this->document->setTitle($tltblog_info['meta_title']);
            $this->document->setDescription($tltblog_info['meta_description']);
            $this->document->setKeywords($tltblog_info['meta_keyword']);
            $this->document->addScript('catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js');
            $this->document->addStyle('catalog/view/javascript/jquery/magnific/magnific-popup.css');

            $this->document->addLink($this->url->link('tltblog/tltblog', 'tltpath=' . $path . '&tltblog_id=' . $tltblog_id), 'canonical');

            $data['breadcrumbs'][] = array(
                'text' => $tltblog_info['title'],
                'href' => $this->url->link('tltblog/tltblog', 'tltpath=' . $path . '&tltblog_id=' . $tltblog_id)
            );

            $data['updated_at'] = $tltblog_info['updated_at'];

            $data['heading_title'] = $tltblog_info['title'];
            $data['show_title'] = $tltblog_info['show_title'];

            if ($tltblog_info['article_image']) {
                if ($this->request->server['HTTPS']) {
                    $data['blog_image'] = $this->config->get('config_ssl') . 'image/' . $tltblog_info['article_image'];
                } else {
                    $data['blog_image'] = $this->config->get('config_url') . 'image/' . $tltblog_info['article_image'];
                }
            } else {
                $data['blog_image'] = "";
            }
            
            $data['review_total'] = $this->model_tltblog_tltblog->getTotalReviews($tltblog_id);          
            
            $data['description'] = html_entity_decode($tltblog_info['description'], ENT_QUOTES, 'UTF-8');
            $data['button_cart'] = $this->language->get('button_cart');
            $data['button_wishlist'] = $this->language->get('button_wishlist');
            $data['button_compare'] = $this->language->get('button_compare');
            $data['text_related'] = $this->language->get('text_related');
            $data['text_tags'] = $this->language->get('text_tags');
            $data['text_tax'] = $this->language->get('text_tax');
            $data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));

            $data['products'] = array();

            $tltblog_relateds = $this->model_tltblog_tltblog->getTltBlogRelated($tltblog_id);

            foreach ($tltblog_relateds as $tltblog_related) {
                $result = $this->model_catalog_product->getProduct($tltblog_related["related_id"]);

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

                if ((float) $result['special']) {
                    $special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                } else {
                    $special = false;
                }

                if ($this->config->get('config_tax')) {
                    $tax = $this->currency->format((float) $result['special'] ? $result['special'] : $result['price'], $this->session->data['currency']);
                } else {
                    $tax = false;
                }

                if ($this->config->get('config_review_status')) {
                    $rating = (int) $result['rating'];
                } else {
                    $rating = false;
                }

                $data['products'][] = array(
                    'product_id' => $result['product_id'],
                    'thumb' => $image,
                    'name' => $result['name'],
                    'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
                    'price' => $price,
                    'special' => $special,
                    'tax' => $tax,
                    'minimum' => $result['minimum'] > 0 ? $result['minimum'] : 1,
                    'rating' => $rating,
                    'href' => $this->url->link('product/product', 'product_id=' . $result['product_id']),
                );
            }

            $data['tags'] = array();

            $tltblog_tags = $this->model_tltblog_tltblog->getTltTagsForBlog($tltblog_id);

            foreach ($tltblog_tags as $tltblog_tag) {
                $data['tags'][] = array(
                    'title' => $tltblog_tag['title'],
                    'href' => $this->url->link('tltblog/tlttag', 'tltpath=' . $path . '&tlttag_id=' . $tltblog_tag['tlttag_id'])
                );
            }

//            $data['review'] = $this->url->link($this->modulePath . '/review', 'tltpath=' . $path . '&tltblog_id=' . $tltblog_id);
//            $data['write'] = $this->url->link($this->modulePath . '/write', 'tltpath=' . $path . '&tltblog_id=' . $tltblog_id);
            $data['review'] = $this->url->link($this->modulePath . '/review', 'tltblog_id=' . $tltblog_id);
            $data['write'] = $this->url->link($this->modulePath . '/write', 'tltblog_id=' . $tltblog_id);
            $data['blog_id'] = $tltblog_id;

            $data['column_left'] = $this->load->controller('common/column_left');
            $data['column_right'] = $this->load->controller('common/column_right');
            $data['content_top'] = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');           
            $data['content_breadcrumbs'] = $this->load->controller('common/breadbcrumb',$data['breadcrumbs']);
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');

            $this->response->setOutput($this->load->view('tltblog/tltblog', $data));
        } else {
            $data['breadcrumbs'][] = array(
                'text' => $this->language->get('text_error'),
                'href' => $this->url->link('tltblog/tltblog', 'tltpath=' . $path . '&tltblog_id=' . $tltblog_id)
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
            $data['content_bottom'] = $this->load->controller('common/content_bottom');           
            $data['content_breadcrumbs'] = $this->load->controller('common/breadbcrumb',$data['breadcrumbs']);
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');

            $this->response->setOutput($this->load->view('error/not_found', $data));
        }
    }

    public function review() {
        $this->load->language('tltblog/tltblog');
        $this->load->model('tltblog/tltblog');

        $data['text_no_reviews'] = $this->language->get('text_no_reviews');

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }
        
        if (isset($this->request->get['tltpath'])) {
            $path = $this->request->get['tltpath'];
        } elseif ($this->config->has('tltblog_path')) {
            $path = $this->config->get('tltblog_path');
        } else {
            $path = 'blogs';
        }

        $data['reviews'] = array();

        if (isset($this->request->get['tltblog_id'])) {
            
            $tltblog_id = (int) $this->request->get['tltblog_id'];

            $review_total = $this->model_tltblog_tltblog->getTotalReviews($tltblog_id);

            $results = $this->model_tltblog_tltblog->getReviews($tltblog_id,($page - 1) * 5, 5);
          
            foreach ($results as $result) {
                $data['reviews'][] = array(
                    'firstname' => $result['firstname'],
                    'comments' => nl2br($result['comments']),
                    'date_added' => date("d-m-Y", strtotime($result['date_added']))
                );
            }

            $pagination = new Pagination();

            $pagination->total = $review_total;
            $pagination->page = $page;
            $pagination->limit = 5;
            $pagination->url = 'index.php?route=' . $this->modulePath . '/review&tltpath='.$path.'&tltblog_id='.$tltblog_id.'&page={page}';

            $data['pagination'] = $pagination->render();

            $data['results'] = sprintf($this->language->get('text_pagination'), ($review_total) ? (($page - 1) * 5) + 1 : 0, ((($page - 1) * 5) > ($review_total - 5)) ? $review_total : ((($page - 1) * 5) + 5), $review_total, ceil($review_total / 5));
            
            $this->response->setOutput($this->load->view('tltblog/review_list', $data));
        }
    }

    public function write() {

        $this->load->language('tltblog/tltblog');
        $this->load->model('tltblog/tltblog');

        if ($this->request->server['REQUEST_METHOD'] == 'POST') {

            if ((utf8_strlen($this->request->post['firstname']) < 3) || (utf8_strlen($this->request->post['firstname']) > 25)) {

                $json['error'] = $this->language->get('error_firstname');
            } else if ((utf8_strlen($this->request->post['email']) > 96) || !filter_var($this->request->post['email'], FILTER_VALIDATE_EMAIL)) {

                $json['error'] = $this->language->get('error_email');
            } else if ((utf8_strlen($this->request->post['comments']) < 25) || (utf8_strlen($this->request->post['comments']) > 3000)) {

                $json['error'] = $this->language->get('error_comments');
            }

            if ($this->config->get('config_google_captcha_status')) {
                $recaptcha = file_get_contents('https://www.google.com/recaptcha/api/siteverify?secret=' . urlencode($this->config->get('config_google_captcha_secret')) . '&response=' . $this->request->post['g-recaptcha-response'] . '&remoteip=' . $this->request->server['REMOTE_ADDR']);

                $recaptcha = json_decode($recaptcha, true);

                if (!$recaptcha['success']) {
                    $json['error'] = $this->language->get('error_captcha');
                }
            }

            if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('testimonial', (array) $this->config->get('config_captcha_page'))) {
                $captcha = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha') . '/validate');

                if ($captcha) {
                    $json['error'] = $captcha;
                }
            }

            if (!isset($json['error'])) {
                $json['success'] = $this->language->get('text_success');
                $this->model_tltblog_tltblog->addReview($this->request->post);
            }
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

}
