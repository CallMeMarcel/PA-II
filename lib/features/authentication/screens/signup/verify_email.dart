import 'package:del_cafeshop/common/widgets/success_screen/success_screen.dart';
import 'package:del_cafeshop/features/authentication/screens/login/login.dart';
import 'package:del_cafeshop/utils/constants/image_strings.dart';
import 'package:del_cafeshop/utils/constants/sizes.dart';
import 'package:del_cafeshop/utils/constants/text_strings.dart';
import 'package:del_cafeshop/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEMailScreen extends StatelessWidget {
  const VerifyEMailScreen({super. key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.offAll(() => const LoginScreen()), icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        /// padding to Give Default Equal Space on all sides in all screens.
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
              ///Image
            children: [
               Image(image: const AssetImage(TImages.emailVerification1), width: THelperFunctions.screenWidth() * 0.6),
               const SizedBox(height: TSizes.spaceBtwSections),

              ///TItle & Subtitle
              Text(TTexts.confirmEmail, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text('pedromhutagaol@gmail.com' ,style: Theme.of(context).textTheme.labelLarge,textAlign: TextAlign.center),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(TTexts.confirmEmailSubTitle, style:  Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: TSizes.spaceBtwSections),
              ///Buttons
              SizedBox(width: double.infinity,
               child: ElevatedButton(
                onPressed: () => Get.to(
                () => SuccessScreen(
                image: TImages.emailVerification2,
                title: TTexts.yourAccountCreatedTitle,
                subTitle: TTexts.youtAccountCreatedSubTitle,
                onPressed: () => Get.to(() => const LoginScreen()),
                )),
               child: const Text(TTexts.tContinue))),
               const  SizedBox(height: TSizes.spaceBtwItems),
               SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: const Text(TTexts.resendEmail)),)
            ],
          ),
      ),
    ),
    );
  }
}
