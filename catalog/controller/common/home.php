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


        $this->response->setOutput($this->load->view('common/home', $data));
    }

}
