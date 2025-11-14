#!/bin/sh

# -----------------------------
# Astra Child Theme Creator
# -----------------------------
# Run this from inside your GitHub repo folder
# Usage: sh create_astra_child.sh

CHILD_THEME_DIR="wp-content/themes/my-astra-child"

echo "---------------------------------------------"
echo "Creating Astra child theme in $CHILD_THEME_DIR"
echo "---------------------------------------------"

# 1️⃣ Create child theme folder
mkdir -p "$CHILD_THEME_DIR"

# 2️⃣ Create style.css
printf '/*
Theme Name: My Astra Child
Template: astra
Author: Ben Heaps
Version: 1.0
Description: Child theme for Astra with custom 3-product homepage display
*/\n' > "$CHILD_THEME_DIR/style.css"

# 3️⃣ Create functions.php
printf '<?php
add_action( '\''wp_enqueue_scripts'\'', '\''my_astra_child_enqueue'\'' );
function my_astra_child_enqueue() {
    wp_enqueue_style( '\''astra-parent-style'\'', get_template_directory_uri() . '\''/style.css'\'' );
    wp_enqueue_style( '\''astra-child-style'\'', get_stylesheet_uri(), array('\''astra-parent-style'\'') );
}
?>\n' > "$CHILD_THEME_DIR/functions.php"

# 4️⃣ Create recommended-products.php
printf '<?php
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
\n' > "$CHILD_THEME_DIR/recommended-products.php"

echo "✅ Astra child theme folder and files created successfully!"
