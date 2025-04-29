import 'package:del_cafeshop/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:del_cafeshop/common/widgets/layouts/grid_layout.dart';
import 'package:del_cafeshop/common/widgets/products/brand/brand_card.dart';
import 'package:del_cafeshop/common/widgets/texts/section_heading.dart';
import 'package:del_cafeshop/features/shop/screens/cart/cart.dart';
import 'package:del_cafeshop/features/shop/screens/store/widgets/category.dart';
import 'package:del_cafeshop/utils/constants/colors.dart';
import 'package:del_cafeshop/utils/constants/sizes.dart';
import 'package:del_cafeshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Tambahkan jika menggunakan GetX

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar( // Ganti TAppBar dengan AppBar sementara untuk testing
          title: Text(
            'Store', 
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () => Get.to(() => const CartScreen()), // Contoh navigasi
            ),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: isDark ? TColors.black : TColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const SizedBox(height: TSizes.spaceBtwItems),
                      const SearchContainer(
                        text: 'Search in Store',
                        showBorder: true,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(height: TSizes.spaceBtwSections),
                      SectionHeading(
                        title: 'Featured Food & Drink',
                        showActionButton: true,
                        onPressed: () {},
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems / 1.5),
                      GridLayout(
                        itemCount: 4,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) => const BrandCard(showBorder: false),
                      ),
                    ],
                  ),
                ),
                bottom: const TabBar(
                  tabs: [
                    Tab(child: Text('Snack')),
                    Tab(child: Text('Drink')),
                  ],
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: [
              CategoryTab(),
              CategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}