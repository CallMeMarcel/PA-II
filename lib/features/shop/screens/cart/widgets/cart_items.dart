import 'package:flutter/material.dart';
import 'package:del_cafeshop/common/widgets/products/cart/add_remove_cart.dart';
import 'package:del_cafeshop/common/widgets/products/cart/cart_item.dart';
import 'package:del_cafeshop/common/widgets/texts/product_price_text.dart';
import 'package:del_cafeshop/utils/constants/sizes.dart';

class CartItems extends StatelessWidget {
  const CartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(), // Supaya tidak bentrok dengan scroll parent
      itemCount: 10,
      separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBtwSections),
      itemBuilder: (_, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Item dalam keranjang
            const CartItem(),

            if (showAddRemoveButtons) ...[
              const SizedBox(height: TSizes.spaceBtwItems),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  // Quantity Add/Remove Button
                  Padding(
                    padding: EdgeInsets.only(left: 70), // Supaya sejajar dengan gambar item
                    child: ProductQuantityWithAddRemove(),
                  ),

                  // Harga produk
                  ProductPrice(price: '8000'),
                ],
              ),
            ],
          ],
        );
      },
    );
  }
}
