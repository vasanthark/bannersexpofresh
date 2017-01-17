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
            <div class="blog-post">
                <?php if($tltblogs){ ?>
                 <?php foreach ($tltblogs as $tltblog) { ?>
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                    <div class="single-post">
                        <div class="post-img-date">
                            <span><a href="<?php echo $tltblog['href']; ?>"><?php echo date("M d",strtotime($tltblog['updated_at']));?></a></span>
                            <a href="<?php echo $tltblog['href']; ?>"><img src="<?php echo $tltblog['thumb']; ?>" alt="<?php echo $tltblog['title']; ?>" title="<?php echo $tltblog['title']; ?>"/></a>
                        </div>
                        <div class="blog-info">

                            <div class="blog-info-right text-right">
                                <a href="<?php echo $tltblog['href']; ?>"><i class="fa fa-comment" aria-hidden="true"> <?php echo ($tltblog['total_reviews']>0)?$tltblog['total_reviews']:"0";?></i></a>

                            </div>

                        </div>

                        <div class="blog-text">
                            <p><a href="<?php echo $tltblog['href']; ?>"><?php echo $tltblog['title']; ?></a></p>
                            <p>Lorem ipsum dolor sit amet, consectetur adipicing elit. Nullam feugiat dignissim metus, id vestibulum tellus Cras ante commodo.</p>
                            <div class="blog-text-read">
                                <a href="<?php echo $tltblog['href']; ?>">Read more...</a></div>
                        </div>

                    </div>
                </div>   
                 <?php }
                }else{ ?>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <p>No blogs found.</p>
                </div>
                <?php } ?>
            </div>
        </div>
    </div>
    <?php echo $content_bottom; ?>
</div>
<?php echo $footer; ?>


