import 'package:del_cafeshop/common/widgets/chips/choice_chip.dart';
import 'package:del_cafeshop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:del_cafeshop/common/widgets/texts/product_price_text.dart';
import 'package:del_cafeshop/common/widgets/texts/product_title_text.dart';
import 'package:del_cafeshop/common/widgets/texts/section_heading.dart';
import 'package:del_cafeshop/utils/constants/colors.dart';
import 'package:del_cafeshop/utils/constants/sizes.dart';
import 'package:del_cafeshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ProductAttribute extends StatelessWidget {
  const ProductAttribute({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Selected Attribute Pricing & Description
        RoundedContainer(
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(TSizes.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title + Price & Stock
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SectionHeading(
                      title: 'Variation',
                      showActionButton: false,
                    ),
                    const SizedBox(width: TSizes.spaceBtwItems),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Price Row
                          Row(
                            children: [
                              const ProductTitleText(
                                title: 'Price : ',
                                smallSize: true,
                              ),
                              Text(
                                'Rp.10000',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .apply(
                                      decoration: TextDecoration.lineThrough,
                                    ),
                              ),
                              const SizedBox(width: 8),
                              const ProductPrice(price: '7500'),
                            ],
                          ),
                          const SizedBox(height: 8),

                          // Stock Row
                          Row(
                            children: [
                              const ProductTitleText(
                                title: 'Stock : ',
                                smallSize: true,
                              ),
                              Text(
                                'In Stock',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: TSizes.spaceBtwItems),

                // Variation Description
                const ProductTitleText(
                  title:
                      'This is the description of the product and it can go upto max 4 lines.',
                  smallSize: true,
                  maxLines: 4,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),

        // Topping Section
        const SectionHeading(
          title: 'Toping (opsional)',
          showActionButton: false,
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),

        // Topping Chips
       Wrap(
      spacing: 8,
      children: [
        CustomChoiceChip(
          text: 'Sauce',
          selected: true,
          onSelected: (value) {},
        ),
        CustomChoiceChip(
          text: 'Sambal Kacang',
          selected: false,
          onSelected: (value) {},
        ),
        CustomChoiceChip(
          text: 'Mayones',
          selected: false,
          onSelected: (value) {},
        ),
      ],
    ),

      ],
    );
  }
}
