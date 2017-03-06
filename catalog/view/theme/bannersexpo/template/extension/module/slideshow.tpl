<div id="myCarousel-<?php echo $module; ?>" class="carousel slide newslider">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <?php foreach ($banners as $key => $banner) { ?>
        <li data-target="#myCarousel" data-slide-to="<?php echo $key;?>" class="<?php echo ($key==0)?'active':'';?>"></li>
        <?php } ?>
    </ol>
    <!-- Wrapper for Slides -->
    <div class="carousel-inner">
         <?php foreach ($banners as $key => $banner) { ?>
        <div class="item <?php echo ($key==0)?'active':'';?>">
            <!-- Set the first background image using inline CSS below. -->
            <div class="fill" style="background-image:url(<?php echo $banner['image']; ?>)"></div>
        </div>
         <?php } ?>        
    </div>
    <!-- Controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
        <span class="icon-prev"></span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
        <span class="icon-next"></span>
    </a>
</div>
 <script type="text/javascript">
   jQuery(window).load(function () {
     $('#myCarousel-<?php echo $module; ?>').carousel({
            interval: 5000, //changes the speed
            pagination: false,
        })
            /*   jQuery('#favsimple-<?php echo $module; ?>').flexslider({
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
             });*/
        });
</script>