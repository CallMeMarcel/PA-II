import 'package:del_cafeshop/common/widgets/appbar/appbar.dart';
import 'package:del_cafeshop/common/widgets/custom_shapes/curved_edges/curved_widget.dart';
import 'package:del_cafeshop/common/widgets/icons/circular_icon.dart';
import 'package:del_cafeshop/common/widgets/images/rounded_image.dart';
import 'package:del_cafeshop/utils/constants/colors.dart';
import 'package:del_cafeshop/utils/constants/image_strings.dart';
import 'package:del_cafeshop/utils/constants/sizes.dart';
import 'package:del_cafeshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return CurvedEdgeWidget(
      child: Container(
        color: dark ? TColors.dark : TColors.light ,
        child:  Stack(
          children: [
            // Main large Image
            const SizedBox(
              height: 400,
              child: Padding(
              padding: EdgeInsets.all(TSizes.productImageRadius * 2),
              child: Center(child: Image(image: AssetImage(TImages.productImages9))),
            )),
    
            /// Image Slider
            Positioned(
              right:0 ,
              left: TSizes.defaultSpace,
              bottom: 30,
              child: SizedBox( 
                height: 80,
                child: ListView.separated(
                separatorBuilder: (_, __) => const SizedBox(width: TSizes.spaceBtwItems,), 
                itemCount: 6,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const AlwaysScrollableScrollPhysics(), 
                itemBuilder: (_, index) =>  RoundedImages(
                  width: 80,
                  backgroundColor: dark ? TColors.dark : TColors.white,
                  border: Border.all(color: TColors.primary),
                  padding: const EdgeInsets.all(TSizes.sm),
                  imageUrl: TImages.productImages7 
                  ),
                ),
              ),
            ),
    
            // Appbar Icon
          const TAppbar(
            showBackArrow: true,
            actions: [CircularIcon(icon: Iconsax.heart5,color: Colors.red)],
          ),
           
          ],
        ),
      ),
    );
  }
}