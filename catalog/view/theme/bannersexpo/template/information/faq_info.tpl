<?php echo $header; ?>
<div class="body-outer-cont">
    <div class="container">
        <div class="row">
            <h1><?php echo $heading_title; ?></h1>
        </div>
    </div>
</div>
<div class="body-cont">
    <div class="container">
        <div class="row">
            <?php echo $content_breadcrumbs; ?>        
            <div class="about-page">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="about-cont">
                        <?php if (!empty($faqs)) { ?>
                        <div class="faq-list">
                            <div class="faqs-content">
                                <div class="faq-block">
                                    <?php foreach ($faqs as $faq) { ?>
                                    <div>
                                        <div class="faq-heading" ><?php echo $faq['title']; ?></div>
                                        <div class="faq-content" id="<?php echo $faq['faq_id']; ?>"><?php echo $faq['description']; ?></div>
                                    </div>
                                    <?php } ?>
                                </div>
                            </div>
                        </div>
                        <div class="pagination"><?php echo $pagination; ?></div>
                        <?php } else { ?>
                        <div class="content"><?php echo $text_empty; ?></div>
                        <?php }?>
                    </div>                             
                </div>
            </div>

        </div>
    </div>   
</div>
<?php echo $footer; ?> 