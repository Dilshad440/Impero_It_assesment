import 'package:flutter/material.dart';
import 'package:impero_it_assesment/core/theme/app_text_style.dart';

import '../../src/features/products/models/response/product_response.dart';

class ProductWidgets extends StatelessWidget {
  const ProductWidgets({super.key, required this.category});

  final SubCategories category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${category.name}", style: AppTextStyle.title.medium),
          SizedBox(
            height: 120,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: category.product?.length ?? 0,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final product = category.product?[index];
                return Container(
                  width: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(product?.imageName ?? ""),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 20),
            ),
          ),
          Text(
            "Poduct Name",
            style: AppTextStyle.body.medium.regular,
          ),
        ],
      ),
    );
  }
}
