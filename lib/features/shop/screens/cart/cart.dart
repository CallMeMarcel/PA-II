import 'package:del_cafeshop/common/widgets/appbar/appbar.dart';
import 'package:del_cafeshop/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:del_cafeshop/features/shop/screens/checkout/checkout.dart';
import 'package:del_cafeshop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: TAppbar(
        showBackArrow: true,
        title: Text('cart', style: Theme.of(context).textTheme.headlineSmall)),
      body: const Padding(
      padding:  EdgeInsets.all(TSizes.defaultSpace),
      // Item in cart
      child: CartItems(),
      
            ),

      //
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(onPressed: () => Get.to(() => const CheckoutScreen()), child: const Text('Checkout')),
      ),
    );
  }
}

                   