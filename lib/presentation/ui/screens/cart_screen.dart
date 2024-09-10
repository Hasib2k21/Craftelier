import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holders/bottom_navbar_controller.dart';

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
      onPopInvoked: (value){
        backToHome();
      },
      child: const Scaffold(
        body: Center(child: Text('Cart Screen')),
      ),
    );
  }
  void backToHome(){
    Get.find<BottomNavbarController>().backToHome();
  }
}
