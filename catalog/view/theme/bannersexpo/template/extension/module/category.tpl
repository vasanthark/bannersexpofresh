<div class="blog-categories">
    <span>Categories</span>
    <ul>
        <?php foreach ($categories as $category) { ?>
            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
        <?php } ?>
    </ul>
</div>

