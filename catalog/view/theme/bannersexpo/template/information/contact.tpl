<?php echo $header; ?>

<div class="body-outer-cont">
  <div class="container">
    <div class="row">
      <h1>Contact Us</h1>
    </div>
  </div>
</div>
<div class="body-cont">
  <div class="container">
    <div class="row">
      <?php echo $content_breadcrumbs; ?>        
      <div class="contactus-page">
        <div class="col-lg-6 col-md-7 col-sm-6 col-xs-12">
          <div class="contact-page-form">
            <h1>Enquiry Form</h1>
            <div class="row">
                <?php if ($error_name) { ?>
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="text-danger"><?php echo $error_name; ?></div>
                                </div>
                                <?php }else if ($error_email) { ?>
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="text-danger"><?php echo $error_email; ?></div>
                                </div>
                                <?php }else if ($error_phone) { ?>
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="text-danger"><?php echo $error_phone; ?></div>
                                </div>
                                <?php }else if ($error_website_url) { ?>
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="text-danger"><?php echo $error_website_url; ?></div>
                                </div>
                                <?php }else if ($error_enquiry) { ?>
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="text-danger"><?php echo $error_enquiry; ?></div>
                                </div>
                                <?php } ?>
             <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">     
                    <div class="form-group">
                            <input type="text" name="name" value="<?php echo $name; ?>" placeholder="First Name" id="input-name" class="form-control" />
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">    
                    <div class="form-group">
                            <input type="text" name="email" value="<?php echo $email; ?>" placeholder="Email" id="input-email" class="form-control" />
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                    <div class="form-group">
                            <input type="text" data-mask="" data-inputmask="&quot;mask&quot;: &quot;(999) 999-9999&quot;" class="form-control" name="phone" value="<?php echo $phone; ?>">
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12"> 
                    <div class="form-group">
                            <input type="text" class="form-control" name="website_url" value="<?php echo $website_url; ?>" placeholder="your url" >
                    </div>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="form-group">                                          
                        <textarea name="enquiry" rows="4" id="input-enquiry" class="form-control message"  placeholder="Write your message"><?php echo $enquiry; ?></textarea>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                    <div class="form-group">    
                        <input class="btn send-msg" type="submit" value="Send Message" />
                    </div>
                </div>
              </form>
            </div>            
        </div>
            </div>
        <div class="col-lg-5 col-md-5 col-sm-6 col-xs-12 pull-right">
            <div class="contactus-content">
                        
          <?php echo $column_right; ?>
          </div>
        </div>
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
          <div class="contact-page-form">     
              <div class="contact-map" id="contactus-map"></div>
            <?php  echo $content_bottom; ?>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<script src="catalog/view/theme/bannersexpo/js/input-mask/jquery.inputmask.js" type="text/javascript"></script>
<script src="catalog/view/theme/bannersexpo/js/input-mask/jquery.inputmask.extensions.js" type="text/javascript"></script>
<script type='text/javascript' src='https://maps.googleapis.com/maps/api/js?key=AIzaSyAnQTjTkA7EhcY9OJLlyyO6_26Dw3ZoVlw&sensor=false&libraries=places'></script>
<script type="text/javascript"><!--
     $(document).ready(function () {
        $("[data-mask]").inputmask();

        var map;
        var myLatLng = {lat: 40.6963, lng: -73.965058};
        map = new google.maps.Map(document.getElementById('contactus-map'), {
            zoom: 14,
            center: new google.maps.LatLng(40.6963, -73.965058),
            scrollwheel: false
        });
        var marker = new google.maps.Marker({
            position: myLatLng,
            map: map,
            title: '32 Grand Ave Brooklyn, NY 11205 USA'
        });


    });
//--></script>
<?php echo $footer; ?>
