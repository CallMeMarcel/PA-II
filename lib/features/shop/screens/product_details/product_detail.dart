import 'package:del_cafeshop/common/widgets/texts/section_heading.dart';
import 'package:del_cafeshop/features/shop/screens/product_details/widgets/bottom_add_cart.dart';
import 'package:del_cafeshop/features/shop/screens/product_details/widgets/product_attribute.dart';
import 'package:del_cafeshop/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:del_cafeshop/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:del_cafeshop/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:del_cafeshop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: const BottomAddCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
              //1 - Product Image Slider
              const ProductImageSlider(),

              //2 - Product Details 
              Padding(padding: const EdgeInsets.only(right:TSizes.defaultSpace ,left:TSizes.defaultSpace ,bottom:TSizes.defaultSpace),
              child: Column(
                children: [

                  /// Rating & Share
                    const RatingAndShare(),

                  /// Price ,Title , Stock, & Brand
                    const ProductMetaData(),

                  /// Attributes
                    const ProductAttribute(),
                    const SizedBox(height: TSizes.spaceBtwSections),
                  /// Checkout Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(onPressed:(){ }, child: const Text('Checkout'))
                      ),
                  
                  
                  /// Description
                  const SectionHeading(title: 'Description'),
                  const SizedBox(height: TSizes.spaceBtwSections,),
                  const ReadMoreText(
                    'This is a product of Del Cafe, there can be another things that can be added to your cart but i just want to make this until here sorry for giving you bad experience using this product ',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimExpandedText: 'Less',
                    trimCollapsedText: 'Show More',
                    moreStyle:  TextStyle(fontSize: 14,fontWeight: FontWeight.w800),
                    lessStyle:  TextStyle(fontSize: 14,fontWeight: FontWeight.w800),
                  ),
                  
                  /// Reviews
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwSections),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SectionHeading(title: 'Reviews (199)'),
                      IconButton(onPressed: (){}, icon: const Icon(Iconsax.arrow_right3,size: 18,)),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),),
          ],
        ),
      ),
    );
  }
}

