import 'package:del_cafeshop/common/widgets/image_widget/vertical_image.dart';
import 'package:del_cafeshop/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

class HomeCategory extends StatelessWidget {
  const HomeCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index){
          return  VerticalImageText(
            image: TImages.food,  
            title: 'Food', 
            onTap: () {}
            );
        },
      ),
    );
  }
}

