<?php if ($reviews) { ?>
<?php foreach ($reviews as $review) { ?>

<div class="customer-detail">
              <p><strong><?php echo $review['author']; ?></strong><span><?php echo $review['date_added']; ?></span></p>
              <p>
                  
                      <?php for ($i = 1; $i <= 5; $i++) { ?>
      <?php if ($review['rating'] < $i) { ?>
      <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
      <?php } else { ?>
      <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
      <?php } ?>
      <?php } ?></p>
              <p><?php echo $review['text']; ?></p>
            </div>

<?php } ?>
<div class="text-right"><?php echo $pagination; ?></div>
<?php } else { ?>
<p><?php echo $text_no_reviews; ?></p>
<?php } ?>
