import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../category_card.dart';

class HorizontalCategoryProductList extends StatelessWidget {
  const HorizontalCategoryProductList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return const CategoryCard();
      },
      separatorBuilder: (_, __) => const SizedBox(width: 8),
    );
  }
}
