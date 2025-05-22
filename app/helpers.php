<?php

if (!function_exists('admin_img')) {
    function admin_img($filename) {
        return asset('admin/images/' . ltrim($filename, '/'));
    }
}

if (!function_exists('asset_admin_css')) {
    function asset_admin_css($path)
    {
        return asset('admin/css/' . ltrim($path, '/'));
    }
}

if (!function_exists('asset_admin_js')) {
    function asset_admin_js($path)
    {
        return asset('admin/js/' . ltrim($path, '/'));
    }
}

if (!function_exists('asset_admin_plugin')) {
    function asset_admin_plugin($path)
    {
        return asset('admin/plugins/' . ltrim($path, '/'));
    }
}