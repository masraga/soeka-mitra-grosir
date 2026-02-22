# 🛣️ Routes & Controllers

## Middleware

### `AdminMiddleware` (`app/Http/Middleware/AdminMiddleware.php`)

- **Alias:** `admin`
- **Registrasi:** `bootstrap/app.php` → `$middleware->alias(['admin' => ...])`
- **Logika:** Cek `auth()->check()` DAN `auth()->user()->isAdmin()`. Jika gagal, redirect ke `admin.login`.

---

## Daftar Routes

### Storefront Routes (Public, Tanpa Auth)

| Method | URI                                  | Name               | Controller@Method                     | Keterangan                                |
| ------ | ------------------------------------ | ------------------ | ------------------------------------- | ----------------------------------------- |
| GET    | `/`                                  | `home`             | `HomeController@index`                | Homepage: banner + 12 produk terbaru      |
| GET    | `/products`                          | `products.index`   | `ProductController@index`             | Listing produk + search + filter kategori |
| GET    | `/products/{slug}`                   | `products.show`    | `ProductController@show`              | Detail produk by slug                     |
| GET    | `/cart`                              | `cart.index`       | `CartController@index`                | Halaman keranjang                         |
| POST   | `/cart/add`                          | `cart.add`         | `CartController@add`                  | Tambah produk ke keranjang                |
| PATCH  | `/cart/update`                       | `cart.update`      | `CartController@update`               | Update quantity                           |
| DELETE | `/cart/remove`                       | `cart.remove`      | `CartController@remove`               | Hapus item dari keranjang                 |
| DELETE | `/cart/clear`                        | `cart.clear`       | `CartController@clear`                | Kosongkan keranjang                       |
| GET    | `/checkout`                          | `checkout.index`   | `CheckoutController@index`            | Form checkout                             |
| POST   | `/checkout`                          | `checkout.store`   | `CheckoutController@store`            | Proses checkout                           |
| GET    | `/checkout/success/{order_number}`   | `checkout.success` | `CheckoutController@success`          | Halaman sukses                            |
| GET    | `/track-order`                       | `track.index`      | `OrderTrackingController@index`       | Form lacak pesanan                        |
| POST   | `/track-order`                       | `track.search`     | `OrderTrackingController@track`       | Cari pesanan                              |
| POST   | `/track-order/upload/{order_number}` | `track.upload`     | `OrderTrackingController@uploadProof` | Upload bukti bayar                        |

### Auth Routes

| Method | URI             | Name                 | Controller@Method               | Keterangan       |
| ------ | --------------- | -------------------- | ------------------------------- | ---------------- |
| GET    | `/admin/login`  | `admin.login`        | `LoginController@showLoginForm` | Form login admin |
| POST   | `/admin/login`  | `admin.login.submit` | `LoginController@login`         | Proses login     |
| POST   | `/admin/logout` | `admin.logout`       | `LoginController@logout`        | Logout admin     |

### Admin Routes (Middleware: `auth` + `admin`, Prefix: `/admin`)

| Method | URI                                 | Name                       | Controller@Method                   | Keterangan            |
| ------ | ----------------------------------- | -------------------------- | ----------------------------------- | --------------------- |
| GET    | `/admin`                            | `admin.dashboard`          | `DashboardController@index`         | Dashboard statistik   |
| GET    | `/admin/products`                   | `admin.products.index`     | `Admin\ProductController@index`     | List produk           |
| GET    | `/admin/products/create`            | `admin.products.create`    | `Admin\ProductController@create`    | Form tambah produk    |
| POST   | `/admin/products`                   | `admin.products.store`     | `Admin\ProductController@store`     | Simpan produk baru    |
| GET    | `/admin/products/{product}/edit`    | `admin.products.edit`      | `Admin\ProductController@edit`      | Form edit produk      |
| PUT    | `/admin/products/{product}`         | `admin.products.update`    | `Admin\ProductController@update`    | Update produk         |
| DELETE | `/admin/products/{product}`         | `admin.products.destroy`   | `Admin\ProductController@destroy`   | Hapus produk          |
| GET    | `/admin/categories`                 | `admin.categories.index`   | `CategoryController@index`          | List kategori         |
| GET    | `/admin/categories/create`          | `admin.categories.create`  | `CategoryController@create`         | Form tambah kategori  |
| POST   | `/admin/categories`                 | `admin.categories.store`   | `CategoryController@store`          | Simpan kategori       |
| GET    | `/admin/categories/{category}/edit` | `admin.categories.edit`    | `CategoryController@edit`           | Form edit kategori    |
| PUT    | `/admin/categories/{category}`      | `admin.categories.update`  | `CategoryController@update`         | Update kategori       |
| DELETE | `/admin/categories/{category}`      | `admin.categories.destroy` | `CategoryController@destroy`        | Hapus kategori        |
| GET    | `/admin/orders`                     | `admin.orders.index`       | `OrderController@index`             | List pesanan + filter |
| GET    | `/admin/orders/{order}`             | `admin.orders.show`        | `OrderController@show`              | Detail pesanan        |
| PATCH  | `/admin/orders/{order}/status`      | `admin.orders.status`      | `OrderController@updateStatus`      | Update status pesanan |
| GET    | `/admin/shipping`                   | `admin.shipping.index`     | `ShippingServiceController@index`   | List layanan kirim    |
| GET    | `/admin/shipping/create`            | `admin.shipping.create`    | `ShippingServiceController@create`  | Form tambah layanan   |
| POST   | `/admin/shipping`                   | `admin.shipping.store`     | `ShippingServiceController@store`   | Simpan layanan        |
| GET    | `/admin/shipping/{shipping}/edit`   | `admin.shipping.edit`      | `ShippingServiceController@edit`    | Form edit layanan     |
| PUT    | `/admin/shipping/{shipping}`        | `admin.shipping.update`    | `ShippingServiceController@update`  | Update layanan        |
| DELETE | `/admin/shipping/{shipping}`        | `admin.shipping.destroy`   | `ShippingServiceController@destroy` | Hapus layanan         |
| GET    | `/admin/sliders`                    | `admin.sliders.index`      | `SliderController@index`            | List slider           |
| GET    | `/admin/sliders/create`             | `admin.sliders.create`     | `SliderController@create`           | Form tambah slider    |
| POST   | `/admin/sliders`                    | `admin.sliders.store`      | `SliderController@store`            | Simpan slider         |
| GET    | `/admin/sliders/{slider}/edit`      | `admin.sliders.edit`       | `SliderController@edit`             | Form edit slider      |
| PUT    | `/admin/sliders/{slider}`           | `admin.sliders.update`     | `SliderController@update`           | Update slider         |
| DELETE | `/admin/sliders/{slider}`           | `admin.sliders.destroy`    | `SliderController@destroy`          | Hapus slider          |
| GET    | `/admin/settings`                   | `admin.settings.index`     | `SettingController@index`           | Halaman pengaturan    |
| PUT    | `/admin/settings`                   | `admin.settings.update`    | `SettingController@update`          | Simpan pengaturan     |

### Setup Route (HAPUS setelah deploy pertama!)

| Method | URI              | Keterangan                                                               |
| ------ | ---------------- | ------------------------------------------------------------------------ |
| GET    | `/setup/{token}` | Jalankan migrate + seed + buat folder uploads. Token: `soeka-setup-2026` |

---

## Detail Controller

### `HomeController`

```
index()
├── Scan folder public/banner/ untuk file gambar (jpg, jpeg, png, webp, gif)
├── Sort by filename ascending
├── Product::active()->where('stock', '>', 0)->latest()->take(12)->get()
└── return view('home', compact('banners', 'latestProducts'))
```

### `ProductController` (Storefront)

```
index(Request)
├── Filter: ?search= → where name LIKE
├── Filter: ?category= → whereHas category slug
├── Product::active()->where('stock', '>', 0)->paginate(12)
├── Category::withCount(active products)->get()
└── return view('products.index')

show(string $slug)
├── Product::where('slug', $slug)->active()->firstOrFail()
├── Related: same category, max 4
└── return view('products.show')
```

### `CartController`

**Session Structure:** `session('cart')` = `[ 'product_id' => [ product_id, name, price, image, quantity, stock ] ]`

```
index()      → Tampilkan session('cart')
add(Request) → Validate product_id + quantity, cek stok, tambah/update session
update(Request) → Update quantity di session
remove(Request) → Hapus item dari session
clear()      → session()->forget('cart')
```

### `CheckoutController`

```
index()
├── Redirect jika cart kosong
├── ShippingService::active()->get()
└── return view('checkout.index')

store(Request)
├── Validate: customer_name, customer_phone, customer_address, shipping_service_id, notes
├── Cek stok semua item di cart
├── DB::beginTransaction()
│   ├── Order::create() dengan generateOrderNumber() + payment_deadline
│   ├── Loop cart → OrderItem::create() + Product::decrement('stock')
│   └── DB::commit()
├── session()->forget('cart')
└── redirect checkout.success

success(string $orderNumber)
├── Order::where('order_number', $orderNumber)->with('items')->firstOrFail()
└── return view('checkout.success')
```

### `OrderTrackingController`

```
index()  → return view('track-order')

track(Request)
├── Validate: order_number, customer_phone
├── Order::where(order_number + phone)->with('items')->first()
└── return view('track-order', compact('order'))

uploadProof(Request, string $orderNumber)
├── Validate: payment_proof (image, max 2MB), customer_phone
├── Cek status === 'pending_payment' dan belum expired
├── Store file ke 'proofs' disk
├── order->update(['payment_proof' => $path])
└── redirect back
```

### `LoginController`

```
showLoginForm()
├── Jika sudah login admin → redirect dashboard
└── return view('auth.login')

login(Request)
├── Auth::attempt(email, password, remember)
├── Cek isAdmin() → redirect dashboard
├── Bukan admin → logout + error
└── Gagal → error message

logout(Request)
├── Auth::logout() + invalidate session + regenerate token
└── redirect admin.login
```

### `Admin\DashboardController`

```
index()
├── totalProducts, totalOrders, pendingOrders, todayOrders, todayRevenue
├── recentOrders → latest 10
└── return view('admin.dashboard')
```

### `Admin\ProductController`

```
index(Request) → Filter search + category, paginate 15, with categories
create()       → return view with categories
store(Request) → Validate, handle image upload, Product::create()
edit(Product)  → return view with product + categories
update(Request, Product) → Validate, handle image replace, product->update()
destroy(Product) → Delete image from storage + product->delete()
```

**Image upload:** Disimpan ke `public/uploads/products/`, format file asli.

### `Admin\CategoryController`

```
index()   → withCount('products'), paginate 15
create()  → return view
store()   → Validate name + image, Category::create()
edit()    → return view
update()  → Validate, handle image replace
destroy() → TOLAK jika masih punya produk, hapus image + delete
```

### `Admin\OrderController`

```
index(Request) → Filter status + search (order_number/name/phone), paginate 15
show(Order)    → load items, return view
updateStatus(Request, Order)
├── Validate status in enum values
├── Jika cancel: restore stock (increment) untuk setiap item
└── order->update(['status' => $newStatus])
```

**PENTING:** Saat status diubah ke `cancelled`, stok produk otomatis dikembalikan.

### `Admin\ShippingServiceController`

```
index()   → orderBy sort_order, paginate 15
create()  → return view
store()   → Validate + ShippingService::create()
edit()    → return view
update()  → Validate + shipping->update()
destroy() → shipping->delete()
```

### `Admin\SliderController`

```
index()   → orderBy sort_order, paginate 15
create()  → return view
store()   → Validate, handle image, Slider::create()
edit()    → return view
update()  → Validate, handle image replace, slider->update()
destroy() → Delete image + slider->delete()
```

### `Admin\SettingController`

```
index()  → Setting::all()->groupBy('group'), return view
update() → Loop $request->settings → Setting::set(key, value) untuk setiap setting
```
