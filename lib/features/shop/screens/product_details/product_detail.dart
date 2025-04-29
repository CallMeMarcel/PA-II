import 'package:del_cafeshop/common/widgets/texts/section_heading.dart';
import 'package:del_cafeshop/data/models/product.dart';
import 'package:del_cafeshop/features/shop/screens/product_details/widgets/bottom_add_cart.dart';
import 'package:del_cafeshop/features/shop/screens/product_details/widgets/product_attribute.dart';
import 'package:del_cafeshop/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:del_cafeshop/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:del_cafeshop/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:del_cafeshop/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:del_cafeshop/utils/constants/sizes.dart';
import 'package:del_cafeshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetail extends StatelessWidget {
  final Product product;
  
  const ProductDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: const BottomAddCart(),

      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1. Product Image Slider
            const ProductImageSlider(),

            /// 2. Product Details
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: TSizes.defaultSpace,
                vertical: TSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  /// Rating & Share
                  const RatingAndShare(),

                  /// Price, Title, Stock, Brand
                  const ProductMetaData(),

                  /// Product Attributes
                  const ProductAttribute(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// Checkout Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Checkout'),
                    ),
                  ),

                  /// Product Description
                  const SizedBox(height: TSizes.spaceBtwSections),
                  const SectionHeading(title: 'Description'),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  const ReadMoreText(
                    'This is a product of Del Cafe, there can be other things that can be added to your cart but I just want to make this until here. Sorry for giving you a bad experience using this product.',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimExpandedText: 'Less',
                    trimCollapsedText: 'Show More',
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  /// Divider
                  const SizedBox(height: TSizes.spaceBtwSections),
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// Reviews Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SectionHeading(title: 'Reviews (199)'),
                IconButton(
                  onPressed: () => Get.to(() => const ProductReviewsScreen()),
                  icon: Icon(
                    Iconsax.arrow_right_3,
                    size: 24,
                    color: dark ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
