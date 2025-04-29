import 'package:flutter/material.dart';
import 'package:del_cafeshop/common/widgets/layouts/grid_layout.dart';
import 'package:del_cafeshop/common/widgets/products/brand/brand_show_case.dart';
import 'package:del_cafeshop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:del_cafeshop/common/widgets/texts/section_heading.dart';
import 'package:del_cafeshop/utils/constants/image_strings.dart';
import 'package:del_cafeshop/utils/constants/sizes.dart';

import 'package:del_cafeshop/data/models/product.dart';
import 'package:del_cafeshop/data/services/product_service.dart';

class CategoryTab extends StatefulWidget {
  const CategoryTab({super.key});

  @override
  State<CategoryTab> createState() => _CategoryTabState();
}

class _CategoryTabState extends State<CategoryTab> {
  late Future<List<Product>> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = ProductService.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Brands
              const BrandShowCase(images: [TImages.productImages5, TImages.productImages6, TImages.productImages7]),
              const BrandShowCase(images: [TImages.productImages8, TImages.productImages9, TImages.productImages10]),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Product Section
              SectionHeading(title: 'You might like', onPressed: () {}),
              const SizedBox(height: TSizes.spaceBtwItems),

              FutureBuilder<List<Product>>(
                future: futureProducts,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text('No products available');
                  }

                  final products = snapshot.data!;
                  return GridLayout(
                    itemCount: products.length,
                    itemBuilder: (_, index) {
                      return ProductCardVertical(product: products[index]);
                    },
                  );
                },
              ),

              const SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ),
      ],
    );
  }
}
