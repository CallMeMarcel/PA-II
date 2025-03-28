import 'package:del_cafeshop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:del_cafeshop/common/widgets/images/circular_image.dart';
import 'package:del_cafeshop/common/widgets/texts/brand_title_verified_icon.dart';
import 'package:del_cafeshop/common/widgets/texts/product_price_text.dart';
import 'package:del_cafeshop/common/widgets/texts/product_title_text.dart';
import 'package:del_cafeshop/utils/constants/colors.dart';
import 'package:del_cafeshop/utils/constants/enums.dart';
import 'package:del_cafeshop/utils/constants/image_strings.dart';
import 'package:del_cafeshop/utils/constants/sizes.dart';
import 'package:del_cafeshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ProductMetaData  extends StatelessWidget {
  const ProductMetaData ({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Price & Sale Price
        Row(
          children: [
            //Sale Tag
            RoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text(
                '25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems,),

            //Price
            Text('Rp 10000', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
            const SizedBox(width: TSizes.spaceBtwItems,),
            const ProductPrice(price: '7500', isLarge: true,),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
        
        
        //Title
        const ProductTitleText(title: 'Sop Buah Dengan Aneka Buah Yang Sangat Segar'),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5 ),
         
        
        //Stock Status
        Row(
          children: [
        const ProductTitleText(title: 'Status'),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5,),
        Text('In Stock ', style:  Theme.of(context).textTheme.titleMedium,),
        
          ]
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5,),



        //Brand
       Row(
         children: [
          CircularImages(
            image: TImages.drink,
            width: 32,
            height: 32,
            overlayColor: dark ? TColors.white : TColors.black,
            ),
           const BrandTitleWithVerifiedIcon(title: 'Drink', brandTextSizes: TextSizes.medium,),
         ],
       )
      ],
    );
  }
}