import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../state_holders/bottom_navbar_controller.dart';
import '../../widget/product_card.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value) {
        backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('WishList'),
          leading: IconButton(
            onPressed: () {
              backToHome();
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
              itemCount: 20,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.68,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 4),
              itemBuilder: (context, index) {
               // return const ProductCard();
              }),
        ),
      ),
    );
  }
  void backToHome(){
    Get.find<BottomNavbarController>().backToHome();
  }
}
