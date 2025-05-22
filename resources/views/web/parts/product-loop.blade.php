 @forelse($products as $product)
     <div class="col-sm-3">
         <div class="product-cart-wrap mb-30">
             <div class="product-img-action-wrap">
                 <div class="product-img product-img-zoom">
                     <a href="{{ route('shop.product_detail', $product->id) }}">
                         <img class="default-img" src="{{ asset('upload/product_images') . '/' . $product->image_name }}"
                             alt="" />
                     </a>
                 </div>
                 <div class="product-badges product-badges-position product-badges-mrg">
                     <span class="hot">Hot</span>
                 </div>
             </div>
             <div class="product-content-wrap">
                 <div class="product-category">
                     <a href="shop-grid-right.html">{{ $product->category }}</a>
                 </div>
                 <h2><a href="{{ route('shop.product_detail', $product->id) }}">{{ $product->product_name }}</a>
                 </h2>
                 <div class="product-rate-cover">
                     <div class="product-rate d-inline-block">
                         <div class="product-rating" style="width: 90%"></div>
                     </div>
                     <span class="font-small ml-5 text-muted"> (4.0)</span>
                 </div>
                 <div class="product-card-bottom">
                     <div class="product-price">
                         @if (isset($formattedPrices[$product['id']]))
                             <span>{{ $formattedPrices[$product['id']] }}</span>
                         @else
                             Price not available
                         @endif
                     </div>
                     <div class="add-cart">
                         <a class="add" href="shop-cart.html"><i class="fi-rs-shopping-cart mr-5"></i>Add </a>
                     </div>
                 </div>
             </div>
         </div>
     </div>
 @empty
     <p>No products found{{ isset($search) ? ' for "' . $search . '"' : '' }}.</p>
 @endforelse
