import 'package:del_cafeshop/common/widgets/appbar/appbar.dart';
import 'package:del_cafeshop/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:del_cafeshop/utils/constants/colors.dart';
import 'package:del_cafeshop/utils/constants/text_strings.dart';
import 'package:del_cafeshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    final textColor = darkMode ? TColors.light : TColors.dark;
    final iconColor = darkMode ? TColors.light : TColors.dark;

    return TAppbar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TTexts.homeAppbarTitle,
            style: Theme.of(context).textTheme.labelMedium!.apply(
                  color: darkMode ? TColors.lightGrey : TColors.darkGrey,
                ),
          ),
          Text(
            TTexts.homeAppbarSubTitle,
            style: Theme.of(context).textTheme.headlineSmall!.apply(
                  color: textColor,
                ),
          ),
        ],
      ),
      actions: [
        CartCounterIcon(
          onPressed: () {},
          iconColor: iconColor,
        ),
      ],
    );
  }
}