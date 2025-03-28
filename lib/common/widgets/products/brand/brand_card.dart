import 'package:del_cafeshop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:del_cafeshop/common/widgets/images/circular_image.dart';
import 'package:del_cafeshop/common/widgets/texts/brand_title_verified_icon.dart';
import 'package:del_cafeshop/utils/constants/colors.dart';
import 'package:del_cafeshop/utils/constants/enums.dart';
import 'package:del_cafeshop/utils/constants/image_strings.dart';
import 'package:del_cafeshop/utils/constants/sizes.dart';
import 'package:del_cafeshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class BrandCard extends StatelessWidget {
  const BrandCard({
    super.key, required this.showBorder, this.onTap,
  });

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     onTap: onTap,
     child: RoundedContainer(
       padding: const EdgeInsets.all(TSizes.sm),
       showBorder: showBorder,
       backgroundColor: Colors.transparent,
       child: Row(
         children: [
           // Icon
           Flexible(
             child: CircularImages(
               isNetworkImage: false,
               image: TImages.drink,
               backgroundColor: Colors.transparent,
               overlayColor: THelperFunctions.isDarkMode(context) ? TColors.white : TColors.black,
             ),
           ),
           const SizedBox(width: TSizes.spaceBtwItems / 2),
    
           // Text
           Expanded(
             child: Column(
               mainAxisSize: MainAxisSize.min,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 const BrandTitleWithVerifiedIcon(
                   title: 'Drink',
                   brandTextSizes: TextSizes.large,
                 ),
                 Text(
                   '256 products',
                   overflow: TextOverflow.ellipsis,
                   style: Theme.of(context).textTheme.labelMedium,
                 ),
               ],
             ),
           ),
         ],
       ),
     ),
                        );
  }
}