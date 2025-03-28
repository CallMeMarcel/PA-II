import 'package:del_cafeshop/common/widgets/layouts/grid_layout.dart';
import 'package:del_cafeshop/common/widgets/products/brand/brand_show_case.dart';
import 'package:del_cafeshop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:del_cafeshop/common/widgets/texts/section_heading.dart';
import 'package:del_cafeshop/utils/constants/image_strings.dart';
import 'package:del_cafeshop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CategoryTab  extends StatelessWidget {
  const CategoryTab ({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children : [ 
        Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            /// Brands
            const BrandShowCase(images: [TImages.productImages5,TImages.productImages6,TImages.productImages7]),
            const BrandShowCase(images: [TImages.productImages8,TImages.productImages9,TImages.productImages10]),  
            const SizedBox(height: TSizes.spaceBtwItems),
      
      
            /// Products
            SectionHeading(title: 'You might like', onPressed: () {}),
            const SizedBox(height: TSizes.spaceBtwItems),
          
            GridLayout(itemCount: 4, itemBuilder: (_, index) => const ProductCardVertical()),
            const SizedBox(height: TSizes.spaceBtwSections),
          ],
      
        ),
      ),
      ],
    );
  }
}