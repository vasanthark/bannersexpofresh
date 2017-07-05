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
                            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                                <?php if (count($category['faqs'])) { ?>
                                <?php foreach ($category['faqs'] AS $faq) { ?>
                                <div class="panel panel-default">
                                        <div class="panel-heading" role="tab" id="headingTwo">
                                            <h4 class="panel-title" data-toggle="collapse" data-parent="#accordion" data-target="<?php  echo '#collapse'.$faq['faq_id']; ?>" aria-expanded="false" aria-controls="<?php  echo 'collapse'.$faq['faq_id']; ?>">
                                                <a class="collapsed" role="button" >
                                                    <i class="more-less fa fa-plus"></i>
                                                    <?php echo $faq['title']; ?>
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="<?php  echo 'collapse'.$faq['faq_id']; ?>" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                                            <div class="panel-body">
                                                <?php echo $faq['description']; ?>
                                            </div>
                                        </div>
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
<script>
    function toggleIcon(e) {
    $(e.target)
        .prev('.panel-heading')
        .find(".more-less")
        .toggleClass('fa-plus fa-minus');
}
$('.panel-group').on('hidden.bs.collapse', toggleIcon);
$('.panel-group').on('shown.bs.collapse', toggleIcon);
    </script>
<?php echo $footer; ?> 