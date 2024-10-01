import 'package:crafty_bay/presentation/state_holders/bottom_navbar_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/cart/cart_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/category/category_list_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/favorite/wishlist_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holders/category_list_controller.dart';
import '../../state_holders/new_product_list_controller.dart';
import '../../state_holders/popular_product_list_controller.dart';
import '../../state_holders/slider_list_controller.dart';
import '../../state_holders/special_product_list_controller.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final BottomNavbarController _navbarController =
      Get.find<BottomNavbarController>();

  final List<Widget> _screen = [
    const HomeScreen(),
    const CategoryListScreen(),
    const CartScreen(),
    const WishListScreen(),
  ];

  @override
  void initState() {
    super.initState();
    Get.find<SliderListController>().getSliderList();
    Get.find<CategoryListController>().getCategoryList();
    Get.find<NewProductListController>().getNewProductList();
    Get.find<PopularProductListController>().getPopularProductList();
    Get.find<SpecialProductListController>().getSpecialProductList();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavbarController>(builder: (_) {
      return Scaffold(
        body: _screen[_navbarController.selectedIndex],
        bottomNavigationBar: NavigationBar(
          selectedIndex: _navbarController.selectedIndex,
          onDestinationSelected: _navbarController.changeIndex,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(
                icon: Icon(Icons.category_outlined), label: 'Category'),
            NavigationDestination(
                icon: Icon(Icons.shopping_cart), label: 'Cart'),
            NavigationDestination(
                icon: Icon(Icons.favorite_border_outlined), label: 'Favorite'),
          ],
        ),
      );
    });
  }
}
