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
                        <?php
                    if(count($faqcategories)) { ?>
                    <?php foreach ($faqcategories as $category) { ?>
                    <div class="faq-list">
                        <div class="faq-heading"><h2><?php echo $category['title']; ?><a id="<?php echo $category['title']; ?>"></a></h2></div>
                        <div class="faqs-content">
                            <div class="faq-block">
                                <?php if (count($category['faqs'])) { ?>
                                <?php foreach ($category['faqs'] AS $faq) { ?>
                                <div>
                                    <div class="faq-heading" ><a href="<?php  echo $faq['href']; ?>" target="_blank"><?php echo $faq['title']; ?></a></div>
                                    
                                </div>
                                <?php } ?>
                                <?php } ?>
                            </div>
                        </div>
                    </div>
                    <?php } ?>
                    <?php } else { ?>
                    <div class="content"><?php echo $text_empty; ?></div>

                    <?php } ?>
                    </div>                             
                </div>
            </div>

        </div>
    </div>   
    <?php echo $content_bottom; ?>
</div>


<?php echo $footer; ?> 