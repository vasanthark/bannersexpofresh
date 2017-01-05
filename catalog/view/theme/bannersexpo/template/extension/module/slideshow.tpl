<div class="slider">
    <div id="favsimple-<?php echo $module; ?>" class="flexslider" style="background-color: #FFFFFF;">
        <ul class="slides">
            <?php foreach ($banners as $banner) { ?>
            <li>
                <?php if ($banner['link']) { ?>
                <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
                <?php } else { ?>
                <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
                <?php } ?>
            </li>
            <?php } ?>
        </ul>
    </div>
</div>
<!--
<div id="slideshow<?php echo $module; ?>" class="owl-carousel" style="opacity: 1;">
    <?php foreach ($banners as $banner) { ?>
    <div class="item">
        <?php if ($banner['link']) { ?>
        <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
        <?php } else { ?>
        <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
        <?php } ?>
    </div>
    <?php } ?>
</div>

$('#slideshow<?php echo $module; ?>').owlCarousel({
    items: 6,
            autoPlay: 3000,
            singleItem: true,
            navigation: true,
            navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
            pagination: true
    });
-->
<script type="text/javascript"><!--
    jQuery(window).load(function () {
        jQuery('#favsimple-<?php echo $module; ?>').flexslider({
            animation: "fade",
            slideDirection: "horizontal",
            slideshow: true,
            slideshowSpeed: 3000,
            animationDuration: 1000,
            directionNav: false,
            controlNav: false,
            keyboardNav: true,
            mousewheel: false,
            randomize: false,
            animationLoop: true,
            pauseOnAction: true,
            pauseOnHover: true
        });
    });
 --></script>