import 'package:del_cafeshop/common/widgets/custom_shapes/containers/primary_header_controller.dart';
import 'package:del_cafeshop/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:del_cafeshop/common/widgets/layouts/grid_layout.dart';
import 'package:del_cafeshop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:del_cafeshop/common/widgets/texts/section_heading.dart';
import 'package:del_cafeshop/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:del_cafeshop/features/shop/screens/home/widgets/home_category.dart';
import 'package:del_cafeshop/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:del_cafeshop/utils/constants/image_strings.dart';

import 'package:del_cafeshop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                        /// Heading
                    SectionHeading(title: 'Popular Categories', showActionButton: false, textColor: Colors.white),
                    SizedBox(height: TSizes.spaceBtwSections),

                    /// Kategori
                    HomeCategory(),
                      ],
                    ),
                    ),
                    SizedBox(height: TSizes.spaceBtwSections,)
                  ],
                ),
                ),
              ///
              /// body 
              Padding(
                padding:  const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                     const PromoSlider(banners: [TImages.promo1,TImages.promo2,TImages.promo3]),
                     const SizedBox(height: TSizes.spaceBtwSections),

                    /// -- Heading
                    SectionHeading(title: 'Popular Products', onPressed:(){}),
                    const SizedBox(height : TSizes.spaceBtwItems), 

                    /// Popular products
                    GridLayout(itemCount: 4 , itemBuilder:  (_, index) => const ProductCardVertical()),
                  ],
                )

                

              )
          ],
        ),
      ),
    );
  }
}

