<div class="subscribe-me">
    <h2><?php echo $heading_title; ?></h2>
    <a href="#close" class="sb-close-btn">x</a>
    <p>Subscribe to our mailing list to get updates to your email inbox</p>
    <input type="text" name="email" placeholder="<?php echo $text_placeholder_input; ?>">
    <input type="submit" class="enter-subscribe" value="<?php echo $text_button_submit; ?>">
</div>

<script type="text/javascript">
    new AdvancedNewsletter({
        container_id: '.subscribe-me',
        input_id: 'input[name=email]',
        submit_id: '.enter-subscribe',
        display_as: true
    });
</script>