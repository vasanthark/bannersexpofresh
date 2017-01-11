<?php echo $header; ?>
<div class="body-outer-cont">
    <div class="container">
        <div class="row">
            <h1>BLOG</h1>
        </div>
    </div>
</div>
<div class="body-cont">
    <div class="container">
        <div class="row">

            <?php echo $content_breadcrumbs; ?>    

            <div class="blog-detail-page">
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 blog-detail-left">
                    <!-- <div class="blog-categories">
                        <span>Categories</span>
                        <ul><li><a href="#">Vinyl Banner</a></li>
                            <li><a href="#">Mesh banners</a></li>
                            <li><a href="#">Displays</a></li>
                            <li><a href="#">Vinyl Banner</a></li>
                            <li><a href="#">Mesh banners</a></li>
                        </ul>
                    </div>

                    <div class="blog-recentpost">
                        <span>Recent post</span>
                        <ul><li><a href="#"><img src="images/details3.jpg" alt="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit ?</a> </li>
                            <li><a href="#"><img src="images/details3.jpg" alt="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit ?</a> </li>
                            <li><a href="#"><img src="images/details3.jpg" alt="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit ? </a></li>
                            <li><a href="#"><img src="images/details3.jpg" alt="">Lorem ipsum dolor sit amet, consectetuer adipiscing elit ?</a> </li>
                        </ul>
                    </div> -->
                    <?php echo $column_left; ?>
                </div>

                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12 blog-detail-right">
                    <div class="blog-content">
                        <?php if($blog_image){ ?>
                            <img src="<?php echo $blog_image; ?>"  />
                        <?php } ?>

                        <div class="blog-info-detail">

                            <div class="blog-info-detail-left">
                                <i class="fa fa-calendar" aria-hidden="true"></i> Posted on: <?php echo date("M d,Y",strtotime($updated_at));?>
                            </div>
                            <div class="blog-info-detail-right">
                                <i class="fa fa-comment" aria-hidden="true"> <?php echo ($review_total>0)?$review_total:"0";?></i>
                                
                            </div>

                        </div>
                        <?php echo $description; ?>
                        <?php if($review_total>0){ ?>    
                                             
                            
                        <div class="blog-comments">
                            <p><span>Comments</span></p>
                            <div id="review"></div>                            
                        </div>
                            <?php }?>
                        


                        <div class="leave-comment">
                            <p><span>Leave a comment</span></p>
                            
                            <div id="review_error"></div>
                            <form name="blogreview" id="form-review">
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" class="form-control" name="firstname" placeholder="Full Name *">
                                    </div>

                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <input type="email" class="form-control" name="email" placeholder="Email *">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <input type="text" class="form-control" name="website" placeholder="Website">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <textarea rows="3" class="form-control" name="comments" placeholder="Comment"></textarea>
                                    </div>
                                </div>
                            </div>                            
                            <input type="hidden" name="blog_id" value="<?php echo $blog_id;?>">
                            <input class="btn btn-submit" type="submit" id="button-review" value="Submit">
                            <input class="btn btn-reset" type="reset" value="Reset">
                            </form> 
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <?php echo $content_bottom; ?>
</div>
<script type="text/javascript"><!--
       $('#review').delegate('.pagination a', 'click', function (e) {
        e.preventDefault();
        $('#review').load(this.href);
    });

    $('#review').load('<?php echo html_entity_decode($review); ?>');

    $('#button-review').on('click', function () {
        var posturl = '<?php echo html_entity_decode($write); ?>';

        $.ajax({
            url: posturl,
            type: 'post',
            dataType: 'json',
            data: $("#form-review").serialize(),
            success: function (json) {
                $('.alert-success, .alert-danger').remove();

                if (json['error']) {
                    $('#review_error').after('<div class="row"><div class="col-lg-8 col-md-8 col-sm-8 col-xs-12"><div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div></div></div>');
                }
                if (json['success']) {
                    $('#review_error').after('<div class="row"><div class="col-lg-8 col-md-8 col-sm-8 col-xs-12"><div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div></div></div>');

                    $('input[name=\'firstname\']').val('');
                    $('input[name=\'email\']').val('');
                    $('input[name=\'website\']').val('');
                    $('textarea[name=\'comments\']').val('');

                }
            }
        });
        return false;
    });
    //--></script>
<?php echo $footer; ?>
