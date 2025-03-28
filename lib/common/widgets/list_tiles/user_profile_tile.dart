import 'package:del_cafeshop/common/widgets/images/circular_image.dart';
import 'package:del_cafeshop/utils/constants/colors.dart';
import 'package:del_cafeshop/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key, required Future? Function() onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
     leading: const CircularImages(image: TImages.user,width: 50,height :50, padding: 0),
    
     title: Text('Pedro Marcel Hutagaol' , style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white)),
     subtitle: Text('pedromhutagaol@gmail.com' , style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white)),
     trailing: IconButton(onPressed: (){}, icon: const Icon(Iconsax.edit, color: TColors.white)),
                        );
  }
}