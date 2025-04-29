import 'package:del_cafeshop/common/widgets/images/rounded_image.dart';
import 'package:del_cafeshop/common/widgets/texts/brand_title_verified_icon.dart';
import 'package:del_cafeshop/common/widgets/texts/product_title_text.dart';
import 'package:del_cafeshop/utils/constants/colors.dart';
import 'package:del_cafeshop/utils/constants/image_strings.dart';
import 'package:del_cafeshop/utils/constants/sizes.dart';
import 'package:del_cafeshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Product Image
        RoundedImages(
          imageUrl: TImages.productImages8,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: isDark ? TColors.darkerGrey : TColors.light,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),

        /// Product Info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BrandTitleWithVerifiedIcon(title: 'Food'),
              const ProductTitleText(
                title: 'Tempe Paling di Dunia, Beli Cuy!',
                maxLines: 1,
              ),
              const SizedBox(height: TSizes.xs),

              /// Attribute
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Toping: ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: 'Sambal Kacang',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
