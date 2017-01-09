<div class="blog-recentpost">
    <span><?php echo $heading_title; ?></span>
    <?php if($tltblogs){ ?>
    <ul>
             <?php foreach ($tltblogs as $tltblog) { ?>
            <li> 
                <a href="<?php echo $tltblog['href']; ?>">
                    <?php if($tltblog['thumb']){ ?>
                            <img src="<?php echo $tltblog['thumb']; ?>"  />
                        <?php } ?>
                    <?php echo $tltblog['title']; ?>
                </a>
            </li>           
            <?php } ?>
        </ul>
    
    <?php }else{ ?>
        <p>No Posts.</p>
        <?php } ?>
</div>