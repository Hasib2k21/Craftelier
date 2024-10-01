import 'package:crafty_bay/presentation/state_holders/bottom_navbar_controller.dart';
import 'package:crafty_bay/presentation/state_holders/category_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/new_product_list_controller.dart';
import 'package:crafty_bay/presentation/ui/utils/assets_path.dart';
import 'package:crafty_bay/presentation/ui/widget/home/centered_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../state_holders/popular_product_list_controller.dart';
import '../../../state_holders/special_product_list_controller.dart';
import '../../widget/home/appbar_icon.dart';
import '../../widget/home/horizontal_category_product_list.dart';
import '../../widget/home/horizontal_product_list_view.dart';
import '../../widget/home/search_text_field.dart';
import '../../widget/home/section_header.dart';
import '../../widget/home_banner_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 18),
              SearchTextField(
                textEditingController: TextEditingController(),
              ),
              const SizedBox(height: 15),
              const HomeBannerSlider(),
              const SizedBox(height: 15),
              _buildCategoryListView(),
              const SizedBox(height: 15),
              _buildPopularProductsSection(),
              const SizedBox(height: 15),
              _buildNewProductsSection(),
              const SizedBox(height: 15),
              _buildSpecialProductsSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPopularProductsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: 'Popular',
          onTap: () {},
        ),
        SizedBox(
          height: 210,
          child: GetBuilder<PopularProductListController>(
              builder: (popularProductListController) {
                return Visibility(
                    visible: !popularProductListController.inProgress,
                    replacement: const CenteredCircularProgressIndicator(),
                    child: HorizontalProductListView(
                      productList: popularProductListController.productList,
                    ));
              }),
        ),
      ],
    );
  }

  Widget _buildSpecialProductsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: 'Special',
          onTap: () {},
        ),
        SizedBox(
          height: 210,
          child: GetBuilder<SpecialProductListController>(
              builder: (specialProductListController) {
                return Visibility(
                    visible: !specialProductListController.inProgress,
                    replacement: const CenteredCircularProgressIndicator(),
                    child: HorizontalProductListView(
                      productList: specialProductListController.productList,
                    ));
              }),
        ),
      ],
    );
  }

  Widget _buildNewProductsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: 'New',
          onTap: () {},
        ),
        SizedBox(
          height: 210,
          child: GetBuilder<NewProductListController>(
              builder: (newProductListController) {
            return Visibility(
                visible: !newProductListController.inProgress,
                replacement: const CenteredCircularProgressIndicator(),
                child: HorizontalProductListView(
                  productList: newProductListController.productList,
                ));
          }),
        ),
      ],
    );
  }

  Widget _buildCategoryListView() {
    return Column(
      children: [
        SectionHeader(
          title: 'Category',
          onTap: () {
            Get.find<BottomNavbarController>().selectCategory();
          },
        ),
        SizedBox(
          height: 120,
          child: GetBuilder<CategoryListController>(
              builder: (categoryListController) {
            return Visibility(
                visible: !categoryListController.inProgress,
                replacement: const CenteredCircularProgressIndicator(),
                child: HorizontalCategoryProductList(
                  categoryList: categoryListController.categoryList,
                ));
          }),
        ),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.appLogoNav),
      actions: [
        AppbarIcon(onTap: () {}, iconData: Icons.person),
        const SizedBox(width: 8),
        AppbarIcon(onTap: () {}, iconData: Icons.call),
        const SizedBox(width: 8),
        AppbarIcon(onTap: () {}, iconData: Icons.notifications_active_outlined),
      ],
    );
  }
}
