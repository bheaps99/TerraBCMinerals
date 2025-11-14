<?php
add_action( 'wp_enqueue_scripts', 'my_astra_child_enqueue' );
function my_astra_child_enqueue() {
    wp_enqueue_style( 'astra-parent-style', get_template_directory_uri() . '/style.css' );
    wp_enqueue_style( 'astra-child-style', get_stylesheet_uri(), array('astra-parent-style') );
}
?>
