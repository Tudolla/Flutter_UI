import 'package:flutter/material.dart';
import 'package:pet_ui/model/product_model.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 60,
          width: 60,
          padding: const EdgeInsets.all(7),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Image.asset("images/${category.image}"),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          category.name.toLowerCase(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
