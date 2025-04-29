import 'package:del_cafeshop/common/widgets/icons/circular_icon.dart';
import 'package:del_cafeshop/utils/constants/colors.dart';
import 'package:del_cafeshop/utils/constants/sizes.dart';
import 'package:del_cafeshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductQuantityWithAddRemove extends StatelessWidget {
  const ProductQuantityWithAddRemove({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// Minus Button
        CircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: TSizes.md,
          color: isDark ? TColors.black : TColors.white,
          backgroundColor: isDark ? TColors.white : TColors.black,
        ),

        const SizedBox(width: TSizes.spaceBtwItems),

        /// Quantity Text
        Text(
          '2',
          style: Theme.of(context).textTheme.titleSmall,
        ),

        const SizedBox(width: TSizes.spaceBtwItems),

        /// Add Button
        const CircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: TSizes.md,
          color: TColors.white,
          backgroundColor: TColors.primary,
        ),
      ],
    );
  }
}
