#!/bin/bash
# Script to create a custom WordPress theme skeleton

# Change this to your theme folder name
THEME_DIR="wp-content/themes/my_custom_theme"

echo "Creating theme folder at $THEME_DIR..."
mkdir -p "$THEME_DIR"

# style.css
cat <<EOL > $THEME_DIR/style.css
/*
Theme Name: My Custom Theme
Theme URI: https://example.com
Author: Your Name
Author URI: https://example.com
Description: Custom WordPress theme for 3-product homepage
Version: 1.0
License: GNU General Public License v2 or later
Text Domain: my-custom-theme
*/
EOL

# functions.php
cat <<EOL > $THEME_DIR/functions.php
<?php
// Enqueue WordPress styles and scripts
function my_custom_theme_scripts() {
    wp_enqueue_style('my-custom-theme-style', get_stylesheet_uri());
}
add_action('wp_enqueue_scripts', 'my_custom_theme_scripts');
EOL

# index.php
cat <<EOL > $THEME_DIR/index.php
<?php get_header(); ?>

<div class="site-content">
    <h1>Welcome to My Custom E-Commerce Site</h1>
    <p>This is your homepage. We'll add your 3-product display next.</p>
</div>

<?php get_footer(); ?>
EOL

# header.php
cat <<EOL > $THEME_DIR/header.php
<!DOCTYPE html>
<html <?php language_attributes(); ?>>
<head>
<meta charset="<?php bloginfo('charset'); ?>">
<meta name="viewport" content="width=device-width, initial-scale=1">
<?php wp_head(); ?>
</head>
<body <?php body_class(); ?>>
<header>
    <h1><?php bloginfo('name'); ?></h1>
</header>
EOL

# footer.php
cat <<EOL > $THEME_DIR/footer.php
<footer>
    <p>&copy; <?php echo date("Y"); ?> <?php bloginfo('name'); ?></p>
</footer>
<?php wp_footer(); ?>
</body>
</html>
EOL

echo "✅ Theme skeleton created successfully in $THEME_DIR"
