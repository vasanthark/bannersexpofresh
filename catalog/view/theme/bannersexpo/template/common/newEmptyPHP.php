<?xml version="1.0" encoding="utf-8"?>
<modification>
    <name>Social Media Icons</name>
    <code>Social Media Icons</code>
    <version>1.0</version>
    <author>Vasanth</author>
    <link>http://www.arkinfotec.com</link>
    <file path="catalog/controller/common/header.php">
        <operation error="skip">
            <search><![CDATA[
			$data['cart'] = $this->load->controller('common/cart');
			]]></search>
            <add position="after"><![CDATA[
			$data['config_facebookid'] = $this->config->get('config_facebookid');
			$data['config_twitterid'] = $this->config->get('config_twitterid');
                        $data['config_linkedinid'] = $this->config->get('config_linkedinid');
                        $data['config_googleid'] = $this->config->get('config_googleid');
                        $data['config_youtubeid'] = $this->config->get('config_youtubeid');
			]]></add>
        </operation>
    </file>
    <file path="catalog/view/theme/*/template/common/header.tpl">
        <operation error="skip">
            <search><![CDATA[
			<div class="socialicons"></div>
			]]></search>
            <add position="replace"><![CDATA[
                            <?php if ($config_facebookid) { ?>
                            <a href="<?php echo $config_facebookid; ?>" target="_blank"><img src="image/facebook.png" alt="Facebook"></a>
                            <?php } ?>
                            <?php if($config_twitterid != '') { ?>
                            <a href="<?php echo $config_twitterid; ?>" target="_blank"><img src="image/twitter.png" alt="Twitter>"</a>
                            <?php } ?>
                            <?php if($config_googleid != '') { ?>
                            <a href="<?php echo $config_googleid; ?>" target="_blank"><img src="image/google-plus.png" alt="Google plus"></a>
                            <?php } ?>
                            <?php if($config_linkedinid != '') { ?>
                            <a href="<?php echo $config_linkedinid;?>" target="_blank"><img src="image/linkedin.png" alt="Linkedin"></a>
                            <?php } ?>
                            <?php if($config_youtubeid != '') { ?>
                            <a href="<?php echo $config_youtubeid;?>" target="_blank"><img src="image/youtube.png" alt="Youtube"></a>
                            <?php } ?>
			]]></add>
        </operation>
    </file>
    <file path="catalog/view/theme/*/template/common/footer.tpl">
        <operation error="skip">
            <search><![CDATA[
			<span>Get in touch</span>
			]]></search>
            <add position="replace"><![CDATA[
			<span>Get in touch</span>
                         <ul>
                            <?php if ($config_facebookid) { ?>
                            <li><a href="<?php echo $config_facebookid; ?>" target="_blank"><img src="image/facebook.png" alt="Facebook"></a></li>
                            <?php } ?>
                            <?php if($config_twitterid != '') { ?>
                            <li><a href="<?php echo $config_twitterid; ?>" target="_blank"><img src="image/twitter.png" alt=""></a></li>
                            <?php } ?>
                            <?php if($config_googleid != '') { ?>
                            <li><a href="<?php echo $config_googleid; ?>" target="_blank"><img src="image/google-plus.png" alt="Google plus"></a></li>
                            <?php } ?>
                            <?php if($config_linkedinid != '') { ?>
                            <li><a href="<?php echo $config_linkedinid;?>" target="_blank"><img src="image/linkedin.png" alt="Linkedin"></a></li>
                            <?php } ?>
                            <?php if($config_youtubeid != '') { ?>
                            <li><a href="<?php echo $config_youtubeid;?>" target="_blank"><img src="image/youtube.png" alt="Youtube"></a></li>
                            <?php } ?>
                        </ul>
			]]></add>
        </operation>
    </file>
	
    <file path="catalog/controller/common/footer.php">
        <operation error="skip">
            <search><![CDATA[
			$data['newsletter'] = $this->url->link('account/newsletter', '', true);
			]]></search>
            <add position="after"><![CDATA[
			$data['config_facebookid'] = $this->config->get('config_facebookid');
			$data['config_twitterid'] = $this->config->get('config_twitterid');
                        $data['config_linkedinid'] = $this->config->get('config_linkedinid');
                        $data['config_googleid'] = $this->config->get('config_googleid');
                        $data['config_youtubeid'] = $this->config->get('config_youtubeid');
			]]></add>
        </operation>
    </file>
    <file path="admin/controller/setting/setting.php">
        <operation error="skip">
            <search><![CDATA[
			$this->load->model('tool/image');
			]]></search>
            <add position="before"><![CDATA[
			if (isset($this->request->post['config_facebookid'])) {
                                $data['config_facebookid'] = $this->request->post['config_facebookid'];
                        } else {
                                $data['config_facebookid'] = $this->config->get('config_facebookid');
                        }
                        if (isset($this->request->post['config_twitterid'])) {
                                $data['config_twitterid'] = $this->request->post['config_twitterid'];
                        } else {
                                $data['config_twitterid'] = $this->config->get('config_twitterid');
                        }
                        if (isset($this->request->post['config_linkedinid'])) {
                                $data['config_linkedinid'] = $this->request->post['config_linkedinid'];
                        } else {
                                $data['config_linkedinid'] = $this->config->get('config_linkedinid');
                        }               
                        if (isset($this->request->post['config_googleid'])) {
                                $data['config_googleid'] = $this->request->post['config_googleid'];
                        } else {
                                $data['config_googleid'] = $this->config->get('config_googleid');
                        }  
                        if (isset($this->request->post['config_youtubeid'])) {
                                $data['config_youtubeid'] = $this->request->post['config_youtubeid'];
                        } else {
                                $data['config_youtubeid'] = $this->config->get('config_youtubeid');
                        }                                   
			]]></add>
        </operation>
    </file>
    <file path="admin/view/template/setting/setting.tpl">
        <operation error="skip">
            <search><![CDATA[
			<li><a href="#tab-server" data-toggle="tab"><?php echo $tab_server; ?></a></li>
			]]></search>
            <add position="after"><![CDATA[
			<li><a href="#tab-social-media" data-toggle="tab">Social Media Icons</a></li>
			]]></add>
        </operation>
        <operation error="skip">
            <search><![CDATA[
			<div class="tab-content">
			]]></search>
            <add position="after"><![CDATA[
			<div class="tab-pane" id="tab-social-media">
			<div class="form-group">
                            <label class="col-sm-2 control-label" for="hd-facebook-id">Facebook URL</label>
                            <div class="col-sm-10">
                              <input class="form-control" id="hd-facebook-id" type="text" name="config_facebookid" placeholder="Your Facebook Page URL" value="<?php echo $config_facebookid; ?>" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="hd-twitter-id">Twitter URL</label>
                            <div class="col-sm-10">
                              <input class="form-control" id="hd-twitter-id" type="text" name="config_twitterid" placeholder="Your Twitter Page URL" value="<?php echo $config_twitterid; ?>" />
                            </div>
                        </div>
			<div class="form-group">
                            <label class="col-sm-2 control-label" for="hd-linkedin-id">LinkedIn URL</label>
                            <div class="col-sm-10">
                              <input class="form-control" id="hd-linkedin-id" type="text" name="config_linkedinid" placeholder="Your LinkedIn Page URL" value="<?php echo $config_linkedinid; ?>" />
                            </div>
                        </div> 
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="hd-google-id"> Google Plus URL</label>
                            <div class="col-sm-10">
                              <input class="form-control" id="hd-google-id" type="text" name="config_googleid" placeholder="Your Google+ Page URL" value="<?php echo $config_googleid; ?>" />
                            </div>
                        </div>  
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="hd-youtube-id">Youtube URL</label>
                            <div class="col-sm-10">
                              <input class="form-control" id="hd-youtube-id" type="text" name="config_youtubeid" placeholder="Your Youtube Page URL" value="<?php echo $config_youtubeid; ?>" />
                            </div>
                        </div>            
			  </div>
			]]></add>
        </operation>
    </file>
</modification>