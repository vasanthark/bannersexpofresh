<?php echo $header; ?>
<div class="slider">
    <img src="image/slider.jpg" alt="">
    <div class="slider-content">      
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-5 col-sm-7 col-xs-12 pull-right ">
                    <div class="your-order">
                        <h1>Start your order</h1>
                        <div class="your-order-cont">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group ">
                                    <select class="selectpicker">
                                        <option>Vinyl banner</option>
                                        <option>banner stand</option>
                                        <option>displays</option>
                                    </select>
                                </div>
                                <div class="form-group ">
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 ">
                                            <label>Height</label>
                                            <div class="height">
                                                <div class="row">
                                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 feet1">
                                                        <label>Feet</label>
                                                        <input type="text" class="form-control"  placeholder="0">
                                                    </div>
                                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 feet2">
                                                        <label>Inch</label>
                                                        <input type="text" class="form-control control2" placeholder="0">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 ">
                                            <label>Width</label>
                                            <div class="height">
                                                <div class="row">
                                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 feet1">
                                                        <label>Feet</label>
                                                        <input type="text" class="form-control control2"  placeholder="0">
                                                    </div>
                                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 feet2">
                                                        <label>Inch</label>
                                                        <input type="text" class="form-control control3" placeholder="0">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <input value="1" name="subject" class="subject-list1" type="checkbox">
                                    Two sided Banner<br>
                                </div>
                                <div class="form-group ">
                                    <div class="row">
                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-5">
                                            <input type="text" class="form-control control4" placeholder="Qty">
                                        </div>
                                        <div class="col-lg-9 col-md-9 col-sm-9 col-xs-7">
                                            <select class="selectpicker">
                                                <option>Select shipping</option>
                                                <option>select shipping1</option>
                                                <option>select shipping2</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="price"> <span class="price1">Price: $15.00</span> <span class="btn btn-default btn-file">
                                            <input type="file">
                                            <i class="fa fa-picture-o" aria-hidden="true"></i> Upload Art Work</span> <span class="btn btn-default btn-file1"> quick order</span> </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="body-cont">
    <?php echo $content_bottom; ?>
    <div class="body-cont2">
        <div class="panel with-nav-tabs panel">
            <div class="panel-heading">
                <ul class="nav nav-tabs">
                    <li class="active"> <a href="#tab1default" data-toggle="tab">Banners Expo.com </a></li>
                    <li><a href="#tab2default" data-toggle="tab"> Why Banners Expo </a></li>
                    <li><a href="#tab3default" data-toggle="tab"> Technical Specifications </a></li>
                </ul>
            </div>
            <div class="panel-body">
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="tab1default">
                        <?php echo $welcome_txt_info; ?>
                    </div>
                    <div class="tab-pane fade" id="tab2default">
                        <div class="container"><?php echo $why_banner_expo;?></div>
                    </div>
                    <div class="tab-pane fade" id="tab3default">
                        <div class="container"><?php echo $tec_banner_expo;?></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="body-cont3">
        <div class="container">
            <div class="row">
                <?php if(!empty($reviews)){ ?>
                <div class="col-lg-7 col-md-7 col-sm-7 col-xs-12">
                    <div class="customer-review">
                        <h3>Loved by our Customers -Reviews</h3>
                        <p>Our customers have rated us <?php echo $avg_rate;?> out of 5 based on <?php echo $totalreviews;?> reviews and counting! 
                            See what some of our customers have to say:</p>
                        <div class="star_rating"><?php echo $avg_rate;?></div>

                        <p><span> <?php echo $avg_rate;?>  /  5 </span></p>
                    </div>
                    <div class="scroll-cont">
                        <div class="owl-carousel">
                            <?php foreach ($reviews as $review) { ?>
                            <div class="popular-cont-txt"> <span><?php echo $review['author']; ?></span>
                                <p><?php echo $review['text']; ?></p>
                                <div class="rating">
                                    <?php for ($i = 1; $i <= 5; $i++) { ?>
                                    <?php if ($review['rating'] < $i) { ?>
                                    <div class="fa fa-stack sliderate"><i class="fa fa-star-o fa-stack-1x" style='color: #fbb00;'></i></div>
                                    <?php } else { ?>
                                    <div class="fa fa-stack sliderate"><i class="fa fa-star fa-stack-1x" style='color: #ffbb00;'></i><i class="fa fa-star-o fa-stack-1x" style='color: #E69500;'></i></div>
                                    <?php } ?>
                                    <?php } ?>
                                </div>
                            </div>
                            <?php } ?>
                        </div>
                    </div>
                </div>
                <?php } ?>
                <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12">
                   <?php echo $youtube_banner_expo;?>
                </div>
            </div>
        </div>
    </div>   
</div>
<?php echo $column_left; ?>
<script type="text/javascript">
    $(function () {
        $('.star_rating').rating();
    });

    $.fn.rating = function () {
        var val = 0, size = 0, stars = 5;
        return this.each(function (i, e) {
            val = parseFloat($(e).text());
            size = ($(e).width() / stars);
            $(e).html($('<p/>').animate({
                width: val * size
            }, 1000));
        });
    };
</script>
<?php echo $footer; ?>