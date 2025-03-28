import 'package:del_cafeshop/features/authentication/screens/signup/verify_email.dart';
import 'package:del_cafeshop/features/authentication/screens/signup/widgets/terms_condition.dart';
import 'package:del_cafeshop/utils/constants/sizes.dart';
import 'package:del_cafeshop/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FormSignUP extends StatelessWidget {
  const FormSignUP({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(labelText: TTexts.firstName,prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(width: TSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(labelText: TTexts.lastName,prefixIcon: Icon(Iconsax.user)),
                ),
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
    
          ///username
          TextFormField(
                  decoration: const InputDecoration(labelText: TTexts.username,prefixIcon: Icon(Iconsax.user_edit)),
                ),           
          const SizedBox(height: TSizes.spaceBtwInputFields),       
          /// Email
          TextFormField(
                  decoration: const InputDecoration(labelText: TTexts.email,prefixIcon: Icon(Iconsax.direct)),
                ),
    
          const SizedBox(height: TSizes.spaceBtwInputFields),
          /// Phone Number
          TextFormField(
                  decoration: const InputDecoration(labelText: TTexts.phoneNo,prefixIcon: Icon(Iconsax.call)),
                ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
    
          /// Password
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              labelText: TTexts.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
    
          /// Terms & Condition Checkbox
          const TermsCondition(),
          const SizedBox(height: TSizes.spaceBtwSections),
    
          /// Signup Button
          SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.to(() => const VerifyEMailScreen()), child: const Text(TTexts.createAccount))),
        ],
      ) 
      );
  }
}

