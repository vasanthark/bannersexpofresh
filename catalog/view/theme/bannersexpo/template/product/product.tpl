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
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                <div class="row">
                    <?php echo $content_breadcrumbs; ?>   
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                <div class="reviews1"><span><?php echo $rating; ?>/5</span> </div>
                <div class="reviews ">                    
                    <?php for ($i = 1; $i <= 5; $i++) { ?>
                    <?php if ($rating < $i) { ?>
                    <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                    <?php } else { ?>
                    <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                    <?php } ?>
                    <?php } ?>                                         
                    <p><?php echo $reviews; ?></p>                    
                </div>
            </div>
            <div class="detail-page">
                <div class="col-lg-8 col-md-7 col-sm-6 col-xs-12">
                    <?php if ($images) { ?>
                    <div class="pro-details">
                        <div id="carousel" class="carousel slide" data-ride="carousel">
                            <div class="carousel-inner">
                                <?php foreach ($images as $key => $image) { ?>
                                <div class="item <?php echo ( $key=='0')?'active':'';?>" data-thumb="<?php echo $key;?>"> <img src="image/<?php echo $image['popup'];?>" alt="<?php echo $heading_title; ?>"> </div>                               
                                <?php } ?>
                            </div>
                        </div>
                        <div class="clearfix">
                            <?php if (count($images)>1) { ?>
                            <div id="thumbcarousel" class="carousel slide" data-interval="false">
                                <div class="carousel-inner">
                                    <?php $flag = 0; $i=1; $status = 1; ?>
                                    <?php foreach ($images as $key => $image) { 

                                    if($i == 1){ ?>
                                    <div class="item <?php echo ($flag==0)?  'active': ''; $flag = 1; ?>">
                                        <?php $status = 2; } ?>                                                                                                                    
                                        <div data-target="#carousel" data-slide-to="<?php echo $key;?>" class="thumb"><img src="image/<?php echo $image['popup'];?>" alt="<?php echo $heading_title; ?>"></div>
                                        <?php if($i == 4){ ?>
                                    </div>
                                    <?php 
                                    $status = 1;
                                    $i = 0;                                             
                                    } 
                                    $i++;
                                    } ?>
                                    <?php echo ($status=='2')? '</div>' : '';?>                
                                </div>
                          </div>
                                
                                <!-- /carousel-inner --> 
                                <?php if (count($images)>4) { ?>
                                <a class="left carousel-control" href="#thumbcarousel" role="button" data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"></span> </a> <a class="right carousel-control" href="#thumbcarousel" role="button" data-slide="next"> <span class="glyphicon glyphicon-chevron-right"></span> </a> </div>
                            <?php } ?>  
                            <?php } ?>  
                        </div>
                    </div>
                    <?php } ?>  
                    <div class="preview-tab">
                    <div class="image-preview"> <span>Uploaded image Preview </span> </div>
                    <img src="image/catalog/preview-img.jpg" alt=""> </div>
                </div>
                <div class="col-lg-4 col-md-5 col-sm-6 col-xs-12">
                    <div class="order-type">
                      <h2> <img src="images/cart-det.png" alt=""> Start your order</h2>
                      <div class="form-group">
                        <label>Material Type</label>
                        <select class="selectpicker">
                          <option>----Please Select-----</option>
                          <option>banner stand</option>
                          <option>displays</option>
                        </select>
                      </div>
                      <div class="form-group">
                        <div class="row">
                          <div class="col-lg-6 col-md-6 col-sm-7 col-xs-6">
                            <label>Dimensions (w x h)</label>
                          </div>
                          <div class="col-lg-6 col-md-6 col-sm-5 col-xs-6">
                            <div class="radio-select">
                              <input value="1" name="subject" class="subject-list1" type="radio">
                              Feet
                              <input value="1" name="subject" class="subject-list1" type="radio">
                              Inch </div>
                          </div>
                        </div>
                      </div>
                      <div class="form-group ">
                        <div class="row">
                          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 ">
                            <label>Height</label>
                            <div class="height">
                              <div class="inch">
                                <label>Feet</label>
                                <input type="text" class="form-control"  placeholder="0">
                              </div>
                              <div class="inch ">
                                <label>Inch</label>
                                <input type="text" class="form-control control2" placeholder="0">
                              </div>
                            </div>
                          </div>
                          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 ">
                            <label>Width</label>
                            <div class="height">
                              <div class="inch">
                                <label>Feet</label>
                                <input type="text" class="form-control"  placeholder="0">
                              </div>
                              <div class="inch ">
                                <label>Inch</label>
                                <input type="text" class="form-control control2" placeholder="0">
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="form-group ">
                        <div class="row">
                          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <label>Grommet Type</label>
                            <select class="selectpicker">
                              <option>----- Please Select--------</option>
                              <option>select shipping1</option>
                              <option>select shipping2</option>
                            </select>
                          </div>
                        </div>
                      </div>
                      <div class="form-group ">
                        <div class="row">
                          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <label>Hemming</label>
                            <select class="selectpicker">
                              <option>----- Please Select--------</option>
                              <option>select shipping1</option>
                              <option>select shipping2</option>
                            </select>
                          </div>
                        </div>
                      </div>
                      <div class="form-group ">
                        <div class="row">
                          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <label>Material Type</label>
                            <select class="selectpicker">
                              <option>----- Please Select--------</option>
                              <option>select shipping1</option>
                              <option>select shipping2</option>
                            </select>
                          </div>
                        </div>
                      </div>
                      <div class="form-group">
                        <div class="row">
                          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="upload-img"> <img src="images/image.png" alt=""> I have an art work </div>
                          </div>
                        </div>
                      </div>
                      <div class="form-group">
                        <div class="row">
                          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="upload-button">
                              <p>Choose an Image From Your
                                computer up to 15MB</p>
                              <span class="btn btn-default btn-file"> Upload your image
                              <input type="file">
                              </span>
                              <p><span>(PNG, JPG, BMP, TIF and PDF files accepted.)</span></p>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="form-group">
                        <div class="row">
                          <div  class="price-quant">
                            <div class="col-lg-7 col-md-7 col-sm-7 col-xs-12 price-value">
                              <p>Price: $15.00</p>
                            </div>
                            <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12">
                              <input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="form-control" />
                            <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="form-group">
                        <div class="row">
                          <div class="start-order">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 "> 
                                <a href="javascript:void(0);" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="add-cart">
                                    <img src="image/catalog/start-order.png" alt="Add cart">Start your order
                                </a>
                             </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
            </div>
            <div class="row">
            <div class="detail-body2">
              <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                <div class="detail-content">
                  <div class="panel with-nav-tabs panel">
                    <div class="panel-heading">
                      <ul class="nav nav-tabs">                                                
                        <li class="active"> <a href="#tab1default" data-toggle="tab"><?php echo $tab_description; ?> </a></li>
                        <?php if ($attribute_groups) { ?>
                        <li><a href="#tab2default" data-toggle="tab"> <?php echo $tab_attribute; ?> </a></li>
                        <?php } ?>
                        <?php if ($review_status) { ?>
                        <li><a href="#tab-review" data-toggle="tab"><?php echo $tab_review; ?></a></li>
                        <?php } ?>
                      </ul>
                    </div>
                    <div class="panel-body">
                      <div class="tab-content">
                        <div class="tab-pane fade in active" id="tab1default">
                        <?php echo $description; ?>
                        </div>
                        <div class="tab-pane fade" id="tab2default"> <table class="table table-bordered table-color">
                                    <?php foreach ($attribute_groups as $attribute_group) { ?>
                                    <thead>
                                        <tr>
                                            <td class="text-color"  colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                                        <tr>
                                            <td><?php echo $attribute['name']; ?></td>
                                            <td><?php echo $attribute['text']; ?></td>
                                        </tr>
                                        <?php } ?>
                                    </tbody>
                                    <?php } ?>
                                </table> </div>
                          <?php if ($review_status) { ?>
                            <div class="tab-pane fade" id="tab-review">
                                <div class="client-review">
            <div class="client-heading">              
              <a class="review-button text-right" id="review-form" href="javascript:void(0);">
                        Write a review
            </a>
            </div>            
            <div id="review"></div>
            <form class="form-horizontal" id="form-review">                                    
                <h2><?php echo $text_write; ?></h2>
                <div id="rate_message"></div>
                <?php if ($review_guest) { ?>
                <div class="form-group required">
                    <div class="col-sm-4">
                        <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                        <input type="text" name="name" value="<?php echo $customer_name; ?>" id="input-name" class="form-control" />
                    </div>
                </div>
                <div class="form-group required">
                    <div class="col-sm-4">
                        <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                        <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                        <div class="help-block"><?php echo $text_note; ?></div>
                    </div>
                </div>
                <div class="form-group required">
                    <div class="col-sm-6">
                        <label class="control-label"><?php echo $entry_rating; ?></label>
                        &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                        <input type="radio" name="rating" value="1" />
                        &nbsp;
                        <input type="radio" name="rating" value="2" />
                        &nbsp;
                        <input type="radio" name="rating" value="3" />
                        &nbsp;
                        <input type="radio" name="rating" value="4" />
                        &nbsp;
                        <input type="radio" name="rating" value="5" />
                        &nbsp;<?php echo $entry_good; ?></div>
                </div>
                <?php echo $captcha; ?>
                <div class="buttons clearfix">                                                
                    <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary">Submit</button>                                                
                </div>
                <?php } else { ?>
                <?php echo $text_login; ?>
                <?php } ?>
            </form>
          </div>
                            </div>
                            <?php } ?>                          
                      </div>
                    </div>
                  </div>
                </div>
              </div>
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
          <div class="ask-que">
            <h4>Ask Your question</h4>
            <div class="ask-inner-part">
              <div class="form-group">
                <input type="text" class="form-control" placeholder="Your Name">
              </div>
              <div class="form-group">
                <input type="email" class="form-control" placeholder="Email Address">
              </div>
              <div class="form-group">
                <textarea class="form-control message" rows="5" placeholder="what do you want to know ?"></textarea>
              </div>
              <div class="form-group">
                <div class="row">
                  <div class="col-lg-12 col-md-12">
                    <button type="submit" class="btn btn-default">Send question</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
            </div>
          </div>       
        </div>
    </div>
</div>
<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function () {
        $.ajax({
            url: 'index.php?route=product/product/getRecurringDescription',
            type: 'post',
            data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
            dataType: 'json',
            beforeSend: function () {
                $('#recurring-description').html('');
            },
            success: function (json) {
                $('.alert, .text-danger').remove();

                if (json['success']) {
                    $('#recurring-description').html(json['success']);
                }
            }
        });
    });
//--></script>
<script type="text/javascript"><!--
$('#button-cart').on('click', function () {
        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
            dataType: 'json',
            beforeSend: function () {
                $('#button-cart').button('loading');
            },
            complete: function () {
                $('#button-cart').button('reset');
            },
            success: function (json) {
                $('.alert, .text-danger').remove();
                $('.form-group').removeClass('has-error');

                if (json['error']) {
                    if (json['error']['option']) {
                        for (i in json['error']['option']) {
                            var element = $('#input-option' + i.replace('_', '-'));

                            if (element.parent().hasClass('input-group')) {
                                element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                            } else {
                                element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                            }
                        }
                    }

                    if (json['error']['recurring']) {
                        $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
                    }

                    // Highlight any found errors
                    $('.text-danger').parent().addClass('has-error');
                }

                if (json['success']) {
                    $('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

                    $('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');

                    $('html, body').animate({scrollTop: 0}, 'slow');

                    $('#carttotal').html(json['carttotal_disp']);
                    $('#carttotalamt').html(json['carttotalamt_disp']);

                    $('#cart > ul').load('index.php?route=common/cart/info ul li');
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
        pickTime: false
    });

    $('.datetime').datetimepicker({
        pickDate: true,
        pickTime: true
    });

    $('.time').datetimepicker({
        pickDate: false
    });

    $('button[id^=\'button-upload\']').on('click', function () {
        var node = this;

        $('#form-upload').remove();

        $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

        $('#form-upload input[name=\'file\']').trigger('click');

        if (typeof timer != 'undefined') {
            clearInterval(timer);
        }

        timer = setInterval(function () {
            if ($('#form-upload input[name=\'file\']').val() != '') {
                clearInterval(timer);

                $.ajax({
                    url: 'index.php?route=tool/upload',
                    type: 'post',
                    dataType: 'json',
                    data: new FormData($('#form-upload')[0]),
                    cache: false,
                    contentType: false,
                    processData: false,
                    beforeSend: function () {
                        $(node).button('loading');
                    },
                    complete: function () {
                        $(node).button('reset');
                    },
                    success: function (json) {
                        $('.text-danger').remove();

                        if (json['error']) {
                            $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
                        }

                        if (json['success']) {
                            alert(json['success']);

                            $(node).parent().find('input').val(json['code']);
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });
            }
        }, 500);
    });
//--></script>
<script type="text/javascript"><!--
$('#review').delegate('.pagination a', 'click', function (e) {
        e.preventDefault();

        $('#review').fadeOut('slow');

        $('#review').load(this.href);

        $('#review').fadeIn('slow');
    });

    $("#form-review").hide();
    
    $('#review-form').on('click', function () {
         $("#form-review").toggle();
    });
    
    $('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');
    
    $('#button-review').on('click', function () {
        $.ajax({
            url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
            type: 'post',
            dataType: 'json',
            data: $("#form-review").serialize(),
            beforeSend: function () {
                $('#button-review').button('loading');
            },
            complete: function () {
                $('#button-review').button('reset');
            },
            success: function (json) {
                $('.alert-success, .alert-danger').remove();

                if (json['error']) {
                    $('#rate_message').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
                }

                if (json['success']) {
                    $('#rate_message').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

                    $('input[name=\'name\']').val('');
                    $('textarea[name=\'text\']').val('');
                    $('input[name=\'rating\']:checked').prop('checked', false);
                }
            }
        });
    });

    $(document).ready(function () {
        $('.thumbnails').magnificPopup({
            type: 'image',
            delegate: 'a',
            gallery: {
                enabled: true
            }
        });
    });
//--></script>
<?php echo $footer; ?>
