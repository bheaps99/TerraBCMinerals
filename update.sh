#!/bin/bash
# === Script: Create Astra Child Theme Skeleton ===

# --- Configuration ---
CHILD_THEME_DIR="wp-content/themes/my-astra-child"
PRODUCT_SNIPPET="recommended-products.php"

echo "=== Creating Astra Child Theme ==="

# --- Create child theme folder ---
mkdir -p "$CHILD_THEME_DIR"

# --- Create style.css ---
cat > "$CHILD_THEME_DIR/style.css" <<EOL
/*
Theme Name: My Astra Child
Template: astra
Author: Your Name
Version: 1.0
Description: Child theme for Astra with custom 3-product homepage display
*/
EOL

# --- Create functions.php ---
cat > "$CHILD_THEME_DIR/functions.php" <<'EOL'
<?php
// Enqueue parent and child styles
add_action( 'wp_enqueue_scripts', 'my_astra_child_enqueue' );
function my_astra_child_enqueue() {
    wp_enqueue_style( 'astra-parent-style', get_template_directory_uri() . '/style.css' );
    wp_enqueue_style( 'astra-child-style', get_stylesheet_uri(), array('astra-parent-style') );
}
?>
EOL

# --- Optional: Create recommended products snippet ---
cat > "$CHILD_THEME_DIR/$PRODUCT_SNIPPET" <<'EOL'
<?php
// Example: 3 recommended products (placeholder)
$recommended_products = [
    ['name'=>'Product 1','price'=>'$49.99','image'=>'https://via.placeholder.com/150'],
    ['name'=>'Product 2','price'=>'$59.99','image'=>'https://via.placeholder.com/150'],
    ['name'=>'Product 3','price'=>'$69.99','image'=>'https://via.placeholder.com/150']
];
?>
<div class="recommended-products">
<?php foreach ($recommended_products as $product): ?>
    <div class="product">
        <img src="<?php echo $product['image']; ?>" alt="<?php echo $product['name']; ?>">
        <h3><?php echo $product['name']; ?></h3>
        <p><?php echo $product['price']; ?></p>
    </div>
<?php endforeach; ?>
</div>
EOL

echo "✅ Astra child theme created at $CHILD_THEME_DIR"
echo "You can now activate it in WordPress admin and include $PRODUCT_SNIPPET in your homepage template."
