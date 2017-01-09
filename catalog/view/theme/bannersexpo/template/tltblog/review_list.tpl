<?php if ($reviews) { ?>
<?php foreach ($reviews as $review) { ?>

<div class="comments-one">
    <span><?php echo $review['firstname']; ?></span><strong><?php echo date("M d,Y",strtotime($review['date_added']));?></strong>
    <p><?php echo $review['comments']; ?></p>
</div>                            
<?php } ?>
<div class="row">
    <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>    
</div>
<?php } else { ?>
<p><?php echo $text_no_reviews; ?></p>
<?php } ?>
