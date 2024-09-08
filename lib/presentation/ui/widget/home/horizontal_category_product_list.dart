import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

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
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.themeColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.computer,
                size: 48,
                color: AppColors.themeColor,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Electronics',
              style: TextStyle(
                color: AppColors.themeColor,
              ),
            ),
          ],
        );
      },
      separatorBuilder: (_, __) => const SizedBox(width: 8),
    );
  }
}