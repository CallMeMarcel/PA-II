import 'package:del_cafeshop/common/widgets/custom_shapes/containers/primary_header_controller.dart';
import 'package:del_cafeshop/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:del_cafeshop/common/widgets/layouts/grid_layout.dart';
import 'package:del_cafeshop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:del_cafeshop/common/widgets/texts/section_heading.dart';
import 'package:del_cafeshop/data/models/product.dart';
import 'package:del_cafeshop/data/services/product_service.dart';
import 'package:del_cafeshop/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:del_cafeshop/features/shop/screens/home/widgets/home_category.dart';
import 'package:del_cafeshop/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:del_cafeshop/utils/constants/image_strings.dart';
import 'package:del_cafeshop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> products = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    try {
      setState(() {
        isLoading = true;
        errorMessage = '';
      });
      
      final fetchedProducts = await ProductService.getProducts();
      setState(() {
        products = fetchedProducts;
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    body: SingleChildScrollView(
      child: Column(
        children: [
          const PrimaryHeaderController(
            child: Column(
              children: [
                /// -- AppBar -- ///
                HomeAppBar(),
                SizedBox(height: TSizes.spaceBtwSections),
                
                /// -- SearchBar -- ///
                SearchContainer(text: 'Search in Store'),
                SizedBox(height: TSizes.spaceBtwSections),
                
                /// -- Categories -- ///
                Padding(
                  padding: EdgeInsets.only(left: TSizes.defaultSpace), 
                  child: Column(
                    children: [
                      SectionHeading(
                        title: 'Popular Categories', 
                        showActionButton: false, 
                        textColor: Colors.white
                      ),
                      SizedBox(height: TSizes.spaceBtwSections),
                      HomeCategory(),
                    ],
                  ),
                ),
                SizedBox(height: TSizes.spaceBtwSections),
              ],
            ),
          ),
          
          /// Body Content
          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                const PromoSlider(banners: [TImages.promo1, TImages.promo2, TImages.promo3]),
                const SizedBox(height: TSizes.spaceBtwSections),

                /// Popular Products Section
                SectionHeading(
                  title: 'Popular Products', 
                  onPressed: () {
                    // Navigasi ke halaman semua produk jika diperlukan
                  },
                ),
                const SizedBox(height: TSizes.spaceBtwItems),

                /// Product Grid - Menampilkan maksimal 4 produk pertama
                if (isLoading)
                  const Center(child: CircularProgressIndicator())
                else if (errorMessage.isNotEmpty)
                  Column(
                    children: [
                      Text('Error: $errorMessage'),
                      ElevatedButton(
                        onPressed: _fetchProducts,
                        child: const Text('Retry'),
                      ),
                    ],
                  )
                else if (products.isEmpty)
                  const Text('No products available')
                else
                  GridLayout(
                    itemCount: products.length > 4 ? 4 : products.length,
                    itemBuilder: (_, index) => ProductCardVertical(
                      product: products[index],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

  // ... build method akan kita pindahkan di bawah
}