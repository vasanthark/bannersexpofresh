<!--
<div id="advanced-newsletter-box">
    <div class="heading-title"><?php echo $heading_title; ?></div>
    <div class="input-group box-newsletter-subscribe" id="mail-box">
        <input type="text" name="email" placeholder="<?php echo $text_placeholder_input; ?>"/>
        <span class="input-group-btn">
        <button class="btn btn-default enter-subscribe" type="button"><?php echo $text_button_submit; ?></button>
        </span>
    </div>
</div>
-->
<div class="body-cont5" id="advanced-newsletter-box">
    <div class="container">
        <div class="row">
            <div class="col-lg-5 col-md-6 col-sm-5 col-xs-12 ">
                <div class="signup">
                    <p>Sign up for exclusive offers </p>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-7 col-xs-12 col-lg-offset-1">
                <div class="signup2">
                    <div class="input-group">
                        <input type="text" class="form-control" id="email" name="email" placeholder="<?php echo $text_placeholder_input; ?>"/>
                        <span class="input-group-btn">
                            <button class="btn btn-default sign-btn enter-subscribe" type="button"><?php echo $text_button_submit; ?></button>
                        </span> 
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    new AdvancedNewsletter({
        container_id: '#advanced-newsletter-box',
        input_id: 'input[name=email]',
        submit_id: '.enter-subscribe'
    });
</script>