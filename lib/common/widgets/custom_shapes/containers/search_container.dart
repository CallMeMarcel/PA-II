import 'package:del_cafeshop/utils/constants/colors.dart';
import 'package:del_cafeshop/utils/constants/sizes.dart';
import 'package:del_cafeshop/utils/device/device_utility.dart';
import 'package:del_cafeshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SearchContainer extends StatelessWidget {
  final String text;
  final TextEditingController? controller;
  final bool showBorder;

  const SearchContainer({
    super.key,
    required this.text,
    this.controller,
    this.showBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: showBorder
            ? Border.all(color: Colors.grey)
            : Border.all(color: Colors.transparent),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: text,
          border: InputBorder.none,
          icon: const Icon(Icons.search),
        ),
      ),
    );
  }
}
