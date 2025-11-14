<?php
$recommended_products = [
    ["name"=>"Product 1","price"=>"$49.99","image"=>"https://via.placeholder.com/150"],
    ["name"=>"Product 2","price"=>"$59.99","image"=>"https://via.placeholder.com/150"],
    ["name"=>"Product 3","price"=>"$69.99","image"=>"https://via.placeholder.com/150"]
];
?>
<div class="recommended-products">
<?php foreach ($recommended_products as $product): ?>
    <div class="product">
        <img src="<?php echo $product["image"]; ?>" alt="<?php echo $product["name"]; ?>">
        <h3><?php echo $product["name"]; ?></h3>
        <p><?php echo $product["price"]; ?></p>
    </div>
<?php endforeach; ?>
</div>

