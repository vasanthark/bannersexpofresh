<?php
class ControllerExtensionModuleSlideshow extends Controller {
	public function index($setting) {
		static $module = 0;		

		$this->load->model('design/banner');
		$this->load->model('tool/image');

		//$this->document->addStyle('catalog/view/javascript/jquery/owl-carousel/owl.carousel.css');
		//$this->document->addScript('catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js');
                
               // $this->document->addStyle('catalog/view/javascript/jquery/flexslider/simple-responsive-slideshow.css');
               // $this->document->addScript('catalog/view/javascript/jquery/flexslider/jquery.flexslider.js');

		$data['banners'] = array();

		$results = $this->model_design_banner->getBanner($setting['banner_id']);

		foreach ($results as $result) {
			if (is_file(DIR_IMAGE . $result['image'])) {
				$data['banners'][] = array(
					'title' => $result['title'],
					'link'  => $result['link'],
					//'image' => $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height'])
                                         'image' => 'image/'.$result['image'], $setting['width'], $setting['height']
				);
			}
		}

		$data['module'] = $module++;

		return $this->load->view('extension/module/slideshow', $data);
	}
}
