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

            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="row">                   
                    <div id="content" class="col-sm-9">        
                        <?php echo $text_message; ?>
                        <div class="buttons">
                            <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
                        </div>
                    </div>
                    <div id="content" class="col-sm-3">
                        <?php echo $column_right; ?>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<script>
       
        <?php
        if(isset($gaTracking)) {
            if($gaTracking) {
                 echo "(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
                })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');" . "\n";
        
                echo "ga('create', 'UA-785793-6', 'auto');" . "\n";
                echo "ga('require', 'ecommerce', 'ecommerce.js');" . "\n";
                echo $gaTracking;
                echo "ga('ecommerce:send');" . "\n";
                echo "ga('send', 'pageview');" . "\n";
            }
        }
        ?>   
      </script>

<?php echo $footer; ?>