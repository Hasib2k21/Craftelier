import 'package:crafty_bay/data/models/category_model.dart';
import 'package:crafty_bay/presentation/state_holders/product_list_by_category_controller.dart';
import 'package:crafty_bay/presentation/ui/widget/home/centered_circular_progress_indicator.dart';
import 'package:crafty_bay/presentation/ui/widget/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProductListScreen extends StatefulWidget {
  final CategoryModel category;

  const ProductListScreen({super.key, required this.category});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<ProductListByCategoryController>().getProductListByCategory(widget.category.id!);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.categoryName??''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<ProductListByCategoryController>(
          builder: (productListByCategoryController) {
            if(productListByCategoryController.inProgress){
              return const CenteredCircularProgressIndicator();
            }
            if(productListByCategoryController.errorMessage!=null){
              return Center(
                child: Text(productListByCategoryController.errorMessage!),
              );
            }
            if(productListByCategoryController.productList.isEmpty){
              return const Center(
                child: Text('Empty product list'),
              );
            }
            return GridView.builder(
              itemCount: productListByCategoryController.productList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.85,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 4
                ),
                itemBuilder: (context, index) {
                  return  ProductCard(product: productListByCategoryController.productList[index],);
                });
          }
        ),
      ),
    );
  }
}
