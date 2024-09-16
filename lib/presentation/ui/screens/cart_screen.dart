import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../state_holders/bottom_navbar_controller.dart';
import '../utils/app_colors.dart';
import '../widget/cart_item_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value) {
        backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
            title: const Text(
              "Carts",
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Get.find<BottomNavbarController>().backToHome();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            )),
        body: Column(
          children: [
            Expanded(
              child: ListView.separated(
                  itemCount: 10,
                  itemBuilder: (context, index){
                    return const CartItemWidget();
                  }, separatorBuilder: (_,__ ) =>const SizedBox(height: 8,),
              ),
            ),
            _buildProductAddToCartSection()
          ],
        ),
      ),
    );
  }

Widget _buildProductAddToCartSection() {
    return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
                color: AppColors.themeColor.withOpacity(0.1),
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(16),
                    topLeft: Radius.circular(16))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Price",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "\$240",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.themeColor),
                    )
                  ],
                ),
                SizedBox(
                    width: 120,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text("Checkout")))
              ],
            ),
          );
  }
  void backToHome(){
    Get.find<BottomNavbarController>().backToHome();
  }
}