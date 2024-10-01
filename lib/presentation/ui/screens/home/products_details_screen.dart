import 'package:crafty_bay/presentation/ui/screens/home/review_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/app_colors.dart';
import 'package:crafty_bay/presentation/ui/widget/product_image_slider.dart';
import 'package:crafty_bay/presentation/ui/widget/size_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:item_count_number_button/item_count_number_button.dart';
import 'package:readmore/readmore.dart';
import '../../widget/color_picker.dart';

class ProductsDetailsScreen extends StatefulWidget {
  const ProductsDetailsScreen({super.key});

  @override
  State<ProductsDetailsScreen> createState() => _ProductsDetailsScreenState();
}

class _ProductsDetailsScreenState extends State<ProductsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products Details'),
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildProductDetails(),
          ),
          _buildPriceAndAddToCartSection()
        ],
      ),
    );
  }

  Widget _buildProductDetails() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ProductImageSlider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Asus Best monitor 2024 latest model',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    ItemCount(
                      initialValue: 1,
                      minValue: 0,
                      maxValue: 10,
                      decimalPlaces: 0,
                      color: AppColors.themeColor,
                      onChanged: (value) {},
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                _buildRatingAndReview(),
                const SizedBox(
                  height: 8,
                ),
                ColorPicker(
                  colors: const [
                    Colors.redAccent,
                    Colors.blueAccent,
                    Colors.yellowAccent,
                    Colors.greenAccent,
                  ],
                  onColorSelected: (Color) {},
                ),
                const SizedBox(
                  height: 8,
                ),
                SizePicker(sizes: const [
                  'S',
                  'M',
                  'L',
                  'XL',
                  'XXL',
                ], onSizeSelected: (String selectedSize) {}),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Description',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 8,
                ),
                const ReadMoreText(
                  'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                  trimMode: TrimMode.Line,
                  trimLines: 2,
                  colorClickableText: Colors.pink,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Show less',
                  moreStyle:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingAndReview() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        const Wrap(
          children: [
            Icon(
              Icons.star,
              color: Colors.amber,
            ),
            Text('3'),
          ],
        ),
        const SizedBox(
          width: 8,
        ),
        TextButton(onPressed: () {Get.to(()=>ProductReviewsScreen());}, child: const Text('Reviews')),
        const SizedBox(
          width: 8,
        ),
        const Card(
          color: AppColors.themeColor,
          child: Padding(
            padding: EdgeInsets.all(4.0),
            child: Icon(
              Icons.favorite_border_outlined,
              size: 16,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildPriceAndAddToCartSection() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withOpacity(0.1),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(8),
          topLeft: Radius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Price'),
              Text(
                '\$1600',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.themeColor),
              ),
            ],
          ),
          SizedBox(
            width: 140,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Add To Cart"),
            ),
          ),
        ],
      ),
    );
  }
}
