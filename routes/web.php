<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\UserController;

use App\Http\Controllers\DashboardController;
use App\Http\Controllers\auth\LoginController;
use App\Http\Controllers\ContentController;
use App\Http\Controllers\ImageUploadController;

use App\Http\Controllers\web_front\MainController;

/* Web Controllers */
use App\Http\Controllers\web\HomeController;
use App\Http\Controllers\web\ShopController;
use App\Http\Controllers\web\CartController;
use App\Http\Controllers\web\OrderController;
use App\Http\Controllers\web\CategoryPageController;

Route::prefix('admin')->group(function(){
    Route::get('/login', [LoginController::class, 'index'])->name('auth.login');
    Route::post('/login', [LoginController::class, 'login'])->name('login.attempt');
});

Route::prefix('admin')->middleware(['auth.custom'])->group(function () {
    
    
    Route::post('/logout', [LoginController::class, 'logout'])->name('auth.logout');
    
    
    /* Dashboard */
    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard.index');


    /* Products */
    Route::get('/products', [ProductController::class, 'index'])->name('product.index');
    Route::get('/product/upload', [ProductController::class, 'create'])->name('product.create');
    Route::post('/product/upload', [ProductController::class, 'store'])->name('product.store');
   

    /* category */
    Route::get('/categories', [CategoryController::class, 'index'])->name('category.index');
    Route::get('/category/create', [CategoryController::class, 'create'])->name('category.create');
    Route::post('/category/create', [CategoryController::class, 'store'])->name('category.store');
    Route::get('/category/{id}/edit', [CategoryController::class, 'edit'])->name('category.edit');
    Route::put('/category/{id}', [CategoryController::class, 'update'])->name('category.update');
    Route::delete('/category/{id}', [CategoryController::class, 'destroy'])->name('category.destroy');

    /* CMS */

    Route::get('/contents', [ContentController::class, 'index'])->name('content.index');
    Route::get('/content/create', [ContentController::class, 'createBanner'])->name('content.create_banner');
    Route::post('/content/create', [ContentController::class, 'store'])->name('content.store');
    Route::get('/content/{id}/edit', [ContentController::class, 'edit'])->name('content.edit');
    Route::put('/content/{id}', [ContentController::class, 'update'])->name('content.update');
    Route::delete('/content/{id}', [ContentController::class, 'delete'])->name('content.destroy');

    /* Image gallary */

    Route::get('/image_gallary', [ImageUploadController::class, 'index'])->name('image_gallary.index');
    Route::post('/image_gallary', [ImageUploadController::class, 'createFolder'])->name('create-folder');
    Route::post('/upload-image', [ImageUploadController::class, 'uploadImage'])->name('upload-image');
    Route::get('/image_info', [ImageUploadController::class, 'imageInfo'])->name('image.info');
    Route::post('/update_alt', [ImageUploadController::class, 'updateAltText'])->name('image.updateAlt');
    Route::delete('/delete', [ImageUploadController::class, 'deleteImage'])->name('image.delete');

    
    
});


Route::prefix('web')->middleware(['log.device'])->group(function () {

    Route::get('/home', [HomeController::class, 'index'])->name('home.index');
    Route::get('/wishlist', [HomeController::class, 'wishList'])->name('home.wishlist');
    
    /* Shop */
    Route::get('/shop', [ShopController::class, 'index'])->name('shop.index');
    Route::get('/shop/{param}', [ShopController::class, 'searchQuery'])->name('shop.search');
        
    Route::get('/product_detail/{id}', [HomeController::class, 'productDetails'])->name('shop.product_detail');

    Route::post('/add-to-cart', [CartController::class, 'addToCart'])->name('cart.add');
    Route::get('/cart', [CartController::class, 'viewCart'])->name('cart.view');
    Route::post('/cart/remove', [CartController::class, 'removeFromCart'])->name('cart.remove');
    Route::post('/cart/update', [CartController::class, 'updateCart'])->name('cart.update');

    Route::get('/checkout', [OrderController::class, 'checkoutForm'])->name('checkout.form');
    Route::post('/checkout', [OrderController::class, 'placeOrder'])->name('checkout.place');
    Route::get('/order-success', [OrderController::class, 'orderSuccess'])->name('order.success');

    Route::get('/category/{name}', [CategoryPageController::class, 'index'])->name('catgory.page.index');
    Route::get('/category/{name}/{subcategory}', [CategoryPageController::class, 'getProductByCategory'])->name('catgory.page.products');
    
    
});

Route::prefix('web_front')->group(function (){
    Route::get('/home', [MainController::class, 'index'])->name('web_front.index');
});