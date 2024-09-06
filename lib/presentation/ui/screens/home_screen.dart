import 'package:crafty_bay/presentation/ui/utils/app_colors.dart';
import 'package:crafty_bay/presentation/ui/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widget/appbar_icon.dart';
import '../widget/home_banner_slider.dart';
import '../widget/search_text_field.dart';
import '../widget/section_header.dart';

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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 18,
            ),
            SearchTextField(
              textEditingController: TextEditingController(),
            ),
            const SizedBox(
              height: 15,
            ),
            const HomeBannerSlider(),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(
              height: 15,
            ),
            SectionHeader(
              title: 'Categories',
              onTap: () {},
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(height: 140, child: _buildCategoryListView()),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryListView() {
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
                  borderRadius: BorderRadius.circular(10)),
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
            )
          ],
        );
      },
      separatorBuilder: (_, __) => const SizedBox(width: 8),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.appLogoNav),
      actions: [
        AppbarIcon(ontap: () {}, iconData: (Icons.person)),
        const SizedBox(
          width: 8,
        ),
        AppbarIcon(ontap: () {}, iconData: (Icons.call)),
        const SizedBox(
          width: 8,
        ),
        AppbarIcon(
            ontap: () {}, iconData: (Icons.notifications_active_outlined)),
      ],
    );
  }
}
