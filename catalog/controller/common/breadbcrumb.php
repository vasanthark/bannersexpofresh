<?php

class ControllerCommonBreadbcrumb extends Controller {
    

    public function index($breadcrumbs) {
        
        $data = array();
        $data['breadcrumbs'] = $breadcrumbs;
        return $this->load->view('common/breadbcrumb', $data);
    }

}
