<div class="body-headings">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="direction">
                         <?php                         
                    foreach ($breadcrumbs as $breadcrumb) { ?>
                    <a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
                    <?php if( end($breadcrumbs) != $breadcrumb) { ?>
                    <i class="fa fa-angle-right" aria-hidden="true"></i>
                    <?php 
                    }
                    } ?>                      
                    </div>
                </div>

            </div>