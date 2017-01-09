<?php

class ControllerTltBlogReviews extends Controller {

    private $error = array();
    private $modulePath = 'tltblog/reviews';

    public function index() {
        $this->load->language('tltblog/tltblog');

        $this->document->setTitle("Reviews");

        $this->load->model('tltblog/tltblog');

        $this->getList();
    }

    public function edit() {
        $this->load->language('tltblog/tltblog');

        $this->document->setTitle("Edit Review");

        $this->load->model('tltblog/tltblog');

        if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
            $this->model_tltblog_tltblog->editTltBlogReview($this->request->get['review_id'], $this->request->post);

            $this->session->data['success'] = $this->language->get('text_review_esuccess');
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

            $this->response->redirect($this->url->link('tltblog/reviews', 'token=' . $this->session->data['token'] . $url, true));
        }

        $this->getForm();
    }

    public function delete() {
        $this->load->language('tltblog/tltblog');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('tltblog/tltblog');

        if (isset($this->request->post['selected']) && $this->validateDelete()) {
            foreach ($this->request->post['selected'] as $tltblogreview_id) {
                $this->model_tltblog_tltblog->deleteReview($tltblogreview_id);
            }

            $this->session->data['success'] = $this->language->get('text_review_dsuccess');

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

            $this->response->redirect($this->url->link('tltblog/reviews', 'token=' . $this->session->data['token'] . $url, true));
        }

        $this->getList();
    }

    protected function getList() {

        $lang_ar = $this->load->language($this->modulePath);

        foreach ($lang_ar as $key => $item) {
            $data[$key] = $item;
        }

        $this->document->setTitle("Reviews");

        $sort = 'date_added';
        $order = 'DESC';

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $url = '';

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('review_heading_title'),
            'href' => $this->url->link($this->modulePath, 'token=' . $this->session->data['token'] . $url, 'SSL')
        );

        $data['delete'] = $this->url->link($this->modulePath . '/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');
        $data['action'] = $this->url->link($this->modulePath, 'token=' . $this->session->data['token'], 'SSL');

        $data['reviews'] = array();

        $filter_data = array(
            'sort' => $sort,
            'order' => $order,
            'start' => ($page - 1) * $this->config->get('config_limit_admin'),
            'limit' => $this->config->get('config_limit_admin')
        );

        $review_total = $this->model_tltblog_tltblog->getTotalReviews($filter_data);

        $results = $this->model_tltblog_tltblog->getReviews($filter_data);

        foreach ($results as $result) {
            $data['reviews'][] = array(
                'review_id' => $result['review_id'],
                'blogtitle' => $result['title'],
                'firstname' => $result['firstname'],
                'email' => $result['email'],
                'status' => ($result['status']) ? '<i style="color:#00CD00;" class="fa fa-check"></i>' : '<i style="color:#EE0000;" class="fa fa-minus"></i>',
                'date_added' => $result['date_added'],
                'edit' => $this->url->link($this->modulePath . '/edit', 'token=' . $this->session->data['token'] . '&review_id=' . $result['review_id'] . $url, 'SSL')
            );
        }

        $data['token'] = $this->session->data['token'];

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];

            unset($this->session->data['success']);
        } else {
            $data['success'] = '';
        }

        if (isset($this->request->post['selected'])) {
            $data['selected'] = (array) $this->request->post['selected'];
        } else {
            $data['selected'] = array();
        }

        $url = '';

        if ($order == 'ASC') {
            $url .= '&order=DESC';
        } else {
            $url .= '&order=ASC';
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $data['sort_status'] = $this->url->link($this->modulePath, 'token=' . $this->session->data['token'] . '&sort=status' . $url, 'SSL');
        $data['sort_date_added'] = $this->url->link($this->modulePath, 'token=' . $this->session->data['token'] . '&sort=date_added' . $url, 'SSL');

        $url = '';

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        $pagination = new Pagination();
        $pagination->total = $review_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_limit_admin');
        $pagination->url = $this->url->link($this->modulePath, 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($review_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($review_total - $this->config->get('config_limit_admin'))) ? $review_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $review_total, ceil($review_total / $this->config->get('config_limit_admin')));

        $data['sort'] = $sort;
        $data['order'] = $order;

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('tltblog/reviews', $data));
    }

    protected function getForm() {

        $lang_ar = $this->load->language($this->modulePath);

        foreach ($lang_ar as $key => $item) {
            $data[$key] = $item;
        }

        $this->document->setTitle("Edit Review");

        $data['text_form'] = !isset($this->request->get['review_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        $url = '';

        if (isset($this->request->get['filter_date_added'])) {
            $url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
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

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('review_heading_title'),
            'href' => $this->url->link($this->modulePath, 'token=' . $this->session->data['token'] . $url, 'SSL')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_edit_review'),
            'href' => $this->url->link($this->modulePath . '/edit', 'token=' . $this->session->data['token'] . '&review_id=' . $this->request->get['review_id'] . $url, 'SSL')
        );

        $data['action'] = $this->url->link($this->modulePath . '/edit', 'token=' . $this->session->data['token'] . '&review_id=' . $this->request->get['review_id'] . $url, 'SSL');


        $data['cancel'] = $this->url->link($this->modulePath, 'token=' . $this->session->data['token'] . $url, 'SSL');

        if (isset($this->request->get['review_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
            $review_info = $this->model_tltblog_tltblog->getReview($this->request->get['review_id']);
        }

        $data['token'] = $this->session->data['token'];


        if (isset($this->request->post['firstname'])) {
            $data['firstname'] = $this->request->post['firstname'];
        } elseif (!empty($review_info)) {
            $data['firstname'] = $review_info['firstname'];
        } else {
            $data['firstname'] = '';
        }

        if (isset($this->request->post['date_added'])) {
            $data['date_added'] = $this->request->post['date_added'];
        } elseif (!empty($review_info)) {
            $data['date_added'] = ($review_info['date_added'] != '0000-00-00') ? $review_info['date_added'] : '';
        } else {
            $data['date_added'] = date('Y-m-d');
        }

        if (isset($this->request->post['comments'])) {
            $data['comments'] = $this->request->post['comments'];
        } elseif (!empty($review_info)) {
            $data['comments'] = $review_info['comments'];
        } else {
            $data['comments'] = '';
        }

        if (isset($this->request->post['website'])) {
            $data['website'] = $this->request->post['website'];
        } elseif (!empty($review_info)) {
            $data['website'] = $review_info['website'];
        } else {
            $data['website'] = '';
        }

        if (isset($this->request->post['email'])) {
            $data['email'] = $this->request->post['email'];
        } elseif (!empty($review_info)) {
            $data['email'] = $review_info['email'];
        } else {
            $data['email'] = '';
        }

        if (isset($this->request->post['status'])) {
            $data['status'] = $this->request->post['status'];
        } elseif (!empty($review_info)) {
            $data['status'] = $review_info['status'];
        } else {
            $data['status'] = '';
        }

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view($this->modulePath . '_form', $data));
    }

    protected function validateDelete() {
        if (!$this->user->hasPermission('modify', 'tltblog/reviews')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        return !$this->error;
    }

}
