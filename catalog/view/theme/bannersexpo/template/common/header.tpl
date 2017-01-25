<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">       
        <title><?php echo $title; ?></title>
        <base href="<?php echo $base; ?>" />
        <?php if ($description) { ?>
        <meta name="description" content="<?php echo $description; ?>" />
        <?php } ?>
        <?php if ($keywords) { ?>
        <meta name="keywords" content= "<?php echo $keywords; ?>" />
        <?php } ?>

        <!-- Bootstrap -->
        <link href="catalog/view/theme/bannersexpo/css/bootstrap.min.css" rel="stylesheet">
        <link href="catalog/view/theme/bannersexpo/css/style.css" rel="stylesheet"> 
        <link href="catalog/view/theme/bannersexpo/css/faq.css" rel="stylesheet">
        <link href="catalog/view/theme/bannersexpo/css/responsive.css" rel="stylesheet">
        <link href="catalog/view/theme/bannersexpo/css/font-awesome.css" rel="stylesheet">
        <link href="catalog/view/theme/bannersexpo/css/bootstrap-select.min.css" rel="stylesheet">
        <link href="catalog/view/theme/bannersexpo/css/owl.carousel.css" rel="stylesheet">
        <link href="catalog/view/theme/bannersexpo/css/responsive2.css" rel="stylesheet">
        <link href="catalog/view/theme/bannersexpo/css/red.css" rel="stylesheet">

        <?php foreach ($styles as $style) { ?>
        <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
        <?php } ?>
        <link href="catalog/view/theme/bannersexpo/css/custom.css" rel="stylesheet">

        <script src="catalog/view/theme/bannersexpo/js/jquery.1.11.3.js"></script> 
        <!-- Include all compiled plugins (below), or include individual files as needed --> 
        <script src="catalog/view/theme/bannersexpo/js/bootstrap.min.js"></script> 
        <script type="text/javascript" src="catalog/view/theme/bannersexpo/js/maps.js"></script> 
        <script type="text/javascript" src="catalog/view/theme/bannersexpo/js/bootstrap-select.min.js"></script> 
        <script type="text/javascript" src="catalog/view/theme/bannersexpo/js/owl.carousel.min.js"></script> 
        <script type="text/javascript" src="catalog/view/theme/bannersexpo/js/icheck.js"></script> 
        <script src="catalog/view/javascript/common.js" type="text/javascript"></script>
        <?php foreach ($links as $link) { ?>
        <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
        <?php } ?>
        <?php foreach ($scripts as $script) { ?>
        <script src="<?php echo $script; ?>" type="text/javascript"></script>
        <?php } ?>            
        <script type="text/javascript">
            $(document).ready(function () {   
                
                $(window).orion({speed: 500});

                $('.indicator').click(function (e) {
                    $(this).parent('li').children('ul:not(.fading)').slideToggle();
                    e.preventDefault();
                });

                $('input').iCheck({
                    checkboxClass: 'icheckbox_square-red',
                    radioClass: 'iradio_square-red'
                });

                $('.selectpicker').selectpicker({
                });

                $('.owl-carousel').owlCarousel({
                    loop: true,
                    margin: 5,
                    responsiveClass: true,
                    nav: true,
                    navText: [
                        "<i class='fa fa-angle-left'> </i>",
                        "<i class='fa fa-angle-right'> </i>"],
                    responsive: {
                        0: {
                            items: 1,
                            nav: true
                        },
                        600: {
                            items: 1,
                            nav: true
                        },
                        1000: {
                            items: 2,
                        }
                    }
                });
                
                $(".dropdown").hover(            
                    function() {
                        $('.dropdown-menu', this).not('.in .dropdown-menu').stop(true,true).slideDown("200");
                        $(this).toggleClass('open');        
                    },
                    function() {
                        $('.dropdown-menu', this).not('.in .dropdown-menu').stop(true,true).slideUp("200");
                        $(this).toggleClass('open');       
                    }
                );
                
               $(".dropdown-toggle").click(function (e) {
                   var targetUrl = $(this).attr('href');
                   $(location).attr('href', targetUrl);
                });
                
            });
        </script>
        <?php foreach ($analytics as $analytic) { ?>
        <?php echo $analytic; ?>
        <?php } ?>
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
              <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
              <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
            <![endif]-->
    </head>
    <body>
        <div class="header-cont">
            <div class="header-row1">
                <div class="container">
                    <div class="row">
                        <div  class="mobile-top">
                            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-7 email1"> <a href="mailto:<?php echo $store_email; ?>"><?php echo $store_email; ?></a></div>
                            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-5">
                                <button class="btn btn1" type="button">Contact Us</button>
                            </div>
                        </div>
                        <div class="col-lg-8 col-md-7 col-sm-9 col-xs-12">
                            <nav class="navbar navbar-default"> 

                                <!-- Brand and toggle get grouped for better mobile display -->
                                <div class="navbar-header">
                                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
                                </div>

                                <!-- Collect the nav links, forms, and other content for toggling -->
                                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                    <ul class="nav navbar-nav navbar-left">                                   
                                        <li><a href="<?php echo $home; ?>"> Home </a> </li>
                                        <li><a href="<?php echo $about_us; ?>"> About us</a> </li>
                                        <li><a href="<?php echo $blog; ?>"> Blog </a> </li>
                                        <li><a href="<?php echo $faq; ?>"> FAQs </a></li>
                                    </ul>
                                </div>
                                <!-- /.navbar-collapse --> 

                            </nav>
                            <div class="email"> <img src="image/email.png" alt="Support Email">Email: <a href="mailto:<?php echo $store_email; ?>"><?php echo $store_email; ?></a></div>
                        </div>
                        <div class="col-lg-4 col-md-5 col-sm-3 col-xs-12">
                            <div class="register">                                 
                                <?php 
                                if (!$logged) { ?>
                                <i class="fa fa-user" aria-hidden="true"></i><a href="<?php echo $register; ?>"> <?php echo $text_register; ?></a>
                                or 
                                <a href="<?php echo $login; ?>"><?php echo $text_login; ?></a>
                                <?php } else { ?>
                                <i class="fa fa-user" aria-hidden="true"></i> <a href="<?php echo $account; ?>"> <?php echo $text_account; ?></a>
                                <a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a>
                                <?php } ?>  
                                <div class="socialicons"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="header-row2">
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 logo"> 
                            <?php if ($logo) { ?>
                            <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>"/></a>
                            <?php } else { ?>
                            <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
                            <?php } ?>        
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 search">
                            <?php echo $search; ?>                     
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 pull-right">
                            <?php echo $cart; ?>                            
                        </div>
                    </div>
                </div>
            </div>
            <div class="header-row3">
                <div class="container">
                    <nav class="navbar navbar-inverse">
                        <div class="navbar-header">
                            <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".js-navbar-collapse"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
                            <a class="navbar-brand" href="#">Products</a>
                        </div>
                        <div class="collapse navbar-collapse js-navbar-collapse">
                            <ul class="nav navbar-nav">
                                <li><a href="index.php?route=product/product&product_id=50">Vinyl banner</a> </li>
                                <li><a href="index.php?route=product/product&product_id=51">Mesh banners</a> </li>
                                <li class="dropdown mega-dropdown"> 
                                    <a href="index.php?route=product/category&path=59" class="dropdown-toggle" data-toggle="dropdown"> Displays <span class="caret"></span></a>
                                    <ul class="dropdown-menu mega-dropdown-menu">
                                        <li class="col-sm-3"><a href="index.php?route=product/category&path=59_62" class="dropdown-header">Floor Stands</a>
                                           <?php if (!empty($dfs_products)) { ?>
                                                <ul>
                                                    <?php foreach ($dfs_products as $dfsinfo) { ?>
                                                        <li><a href="<?php echo $dfsinfo['href']; ?>"><?php echo $dfsinfo['name']; ?></a> </li>  
                                                    <?php } ?>
                                                </ul>
                                            <?php } ?>
                                        </li>
                                        <li class="col-sm-3"> <a href="index.php?route=product/product&product_id=75" class="dropdown-header"> Trade Show Displays</a>
                                            <?php if (!empty($dtc_products)) { ?>
                                                <ul>
                                                    <?php foreach ($dtc_products as $dtcinfo) { ?>
                                                        <li><a href="<?php echo $dtcinfo['href']; ?>"><?php echo $dtcinfo['name']; ?></a> </li>  
                                                    <?php } ?>
                                                </ul>
                                            <?php } ?>
                                        </li>
                                        <li class="col-sm-3"><a class="dropdown-header" href="index.php?route=product/product&product_id=52">A frame Signs</a> </li>
                                        <li class="col-sm-3"><a class="dropdown-header" href="index.php?route=product/category&path=59_63">Table Covers</a> 
                                        <li class="col-sm-4 pull-right" style="padding-bottom:-50px;">
                                            <?php if($disp_cat_img!=""){ ?>
                                            <img src="image/<?php echo $disp_cat_img;?>"  alt="Displays" style="margin-bottom:-25px;">                                              
                                            <?php }?>
                                        </li>
                                    </ul>
                                </li>
                                <li><a href="index.php?route=product/product&product_id=53">Yard signs</a> </li>  
                                <li class="dropdown mega-dropdown">
                                    <a href="index.php?route=product/category&path=60" class="dropdown-toggle" data-toggle="dropdown">Rigid Signs <span class="caret"></span></a>
                                     <?php if (!empty($rs_products)) { ?>
                                        <ul class="dropdown-menu mega-dropdown-menu">
                                            <?php foreach ($rs_products as $rinfo) { ?>
                                                <li class="col-sm-3"><a href="<?php echo $rinfo['href']; ?>" class="dropdown-header"><?php echo $rinfo['name']; ?></a> </li>  
                                            <?php } ?>
                                        </ul>
                                    <?php } ?>
                                </li>  
                                <li class="dropdown mega-dropdown"> 
                                    <a href="index.php?route=product/category&path=61" class="dropdown-toggle" data-toggle="dropdown"> Banner stands <span class="caret"></span></a>
                                     <?php if (!empty($bs_products)) { ?>
                                        <ul class="dropdown-menu mega-dropdown-menu">
                                            <?php foreach ($bs_products as $binfo) { ?>
                                                <li class="col-sm-3"><a href="<?php echo $binfo['href']; ?>" class="dropdown-header"><?php echo $binfo['name']; ?></a> </li>  
                                            <?php } ?>
                                        </ul>
                                    <?php } ?>
                                </li>
                                <li><a href="index.php?route=product/product&product_id=56">Wall decals</a></li>
                                <li><a href="index.php?route=product/product&product_id=57"> Window wraps</a></li>
                                <li class="dropdown mega-dropdown"> 
                                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown"> More products <span class="caret"></span></a>
                                    <ul class="dropdown-menu mega-dropdown-menu">
                                        <li class="col-sm-3"><a href="index.php?route=product/product&product_id=58" class="dropdown-header">Magnetic Signs</a></li>
                                        <li class="col-sm-3"><a href="index.php?route=product/product&product_id=59" class="dropdown-header">Paper Posters</a></li>
                                        <li class="col-sm-3"><a href="index.php?route=product/product&product_id=60" class="dropdown-header">Canvas printing</a></li>
                                        <li class="col-sm-3"><a href="index.php?route=product/product&product_id=61" class="dropdown-header">Backdrops </a></li>
                                        <li class="col-sm-3"><a href="index.php?route=product/product&product_id=62" class="dropdown-header">Window decals</a></li>
                                        <li class="col-sm-3"><a href="index.php?route=product/product&product_id=63" class="dropdown-header">Static Cling</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <!-- /.nav-collapse --> 
                    </nav>
                </div>
            </div>

        </div>