import 'package:del_cafeshop/common/widgets/appbar/appbar.dart';
import 'package:del_cafeshop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:del_cafeshop/common/widgets/success_screen/success_screen.dart';
import 'package:del_cafeshop/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:del_cafeshop/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:del_cafeshop/features/shop/screens/checkout/widgets/build_payment_option.dart';
import 'package:del_cafeshop/navigation_menu.dart';
import 'package:del_cafeshop/utils/constants/colors.dart';
import 'package:del_cafeshop/utils/constants/image_strings.dart';
import 'package:del_cafeshop/utils/constants/sizes.dart';
import 'package:del_cafeshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final totalAmount = 30000;
    int selectedPaymentMethod = 0; // 0=Credit Card, 1=Gopay, 2=OVO, etc.

    return Scaffold(
      appBar: TAppbar(
        showBackArrow: true,
        title: Text('Order Summary', style: Theme.of(context).textTheme.headlineSmall),
      ),
      
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            const CartItems(showAddRemoveButtons: false),
            const SizedBox(height: TSizes.spaceBtwSections),

            // Payment Methods Section
            RoundedContainer(
              showBorder: true,
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Padding(
                padding: const EdgeInsets.all(TSizes.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Payment Method', style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    
                    // Payment Options
                    buildPaymentOption(
                      context,
                      index: 0,
                      selected: selectedPaymentMethod == 0,
                      icon: Iconsax.mobile,
                      title: "Dana",
                      iconImage: TImages.dana,
                      onTap: () => selectedPaymentMethod = 0,
                    ),
                    buildPaymentOption(
                      context,
                      index: 1,
                      selected: selectedPaymentMethod == 1,
                      icon: Iconsax.mobile,
                      title: "Gopay",
                      subtitle: "Pay with Gopay Wallet",
                      iconImage: TImages.gopay,
                      onTap: () => selectedPaymentMethod = 1,
                    ),
                    buildPaymentOption(
                      context,
                      index: 2,
                      selected: selectedPaymentMethod == 2,
                      icon: Iconsax.mobile,
                      title: "OVO",
                      subtitle: "Pay with OVO Wallet",
                      iconImage: TImages.ovo,
                      onTap: () => selectedPaymentMethod = 2,
                    ),
                    
                    const SizedBox(height: TSizes.spaceBtwItems),
                    const Divider(thickness: 1),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    
                    // Order Summary
                    const BillingAmountSection(),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    
                    // Terms Agreement
                    Row(
                      children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: Checkbox(
                            value: true, 
                            onChanged: (value) {},
                            activeColor: TColors.primary,
                          ),
                        ),
                        const SizedBox(width: TSizes.spaceBtwItems),
                        Expanded(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'I agree to ',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                TextSpan(
                                  text: 'Terms & Conditions',
                                  style: Theme.of(context).textTheme.bodySmall!.apply(
                                    color: TColors.primary,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        decoration: BoxDecoration(
          color: dark ? TColors.dark : TColors.white,
          boxShadow: [BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),)
          ],
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: TSizes.md),
          ),
          onPressed: () => Get.to(() => SuccessScreen(
            image: TImages.emailVerification2,
            title: 'Payment Successful!',
            subTitle: 'Your order has been placed',
            onPressed: () => Get.offAll(() => const NavigationMenu()),
          )),
          child: Text(
            'Pay Rp${totalAmount.toStringAsFixed(0)}',
            style: Theme.of(context).textTheme.titleMedium?.apply(color: TColors.white),
          ),
        ),
      ),
    );
  }
}