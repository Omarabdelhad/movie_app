import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/screens/home/tabs/explore_tab.dart';
import 'package:movie_app/screens/home/tabs/home/home_tab.dart';
import 'package:movie_app/screens/home/tabs/profile_tab.dart';
import 'package:movie_app/screens/home/tabs/search_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [HomeTab(), SearchTab(), ExploreTab(), ProfileTab()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(9),

        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: NavigationBar(
            height: 61.h,
            selectedIndex: selectedIndex,
            onDestinationSelected: (value) {
              setState(() {
                selectedIndex = value;
              });
            },
            backgroundColor: AppColors.greyColor,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            indicatorColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            shadowColor: Colors.transparent,

            destinations: [
              NavigationDestination(
                icon: SvgPicture.asset(
                  AppAssets.home,
                  colorFilter: ColorFilter.mode(
                    AppColors.whiteColor,
                    BlendMode.srcIn,
                  ),
                ),
                selectedIcon: SvgPicture.asset(
                  AppAssets.home,
                  colorFilter: ColorFilter.mode(
                    AppColors.yellowColor,
                    BlendMode.srcIn,
                  ),
                ),

                label: '',
              ),
              NavigationDestination(
                icon: SvgPicture.asset(
                  AppAssets.search,
                  colorFilter: ColorFilter.mode(
                    AppColors.whiteColor,
                    BlendMode.srcIn,
                  ),
                ),
                selectedIcon: SvgPicture.asset(
                  AppAssets.search,
                  colorFilter: ColorFilter.mode(
                    AppColors.yellowColor,
                    BlendMode.srcIn,
                  ),
                ),

                label: '',
              ),
              NavigationDestination(
                icon: SvgPicture.asset(
                  AppAssets.explore,
                  colorFilter: ColorFilter.mode(
                    AppColors.whiteColor,
                    BlendMode.srcIn,
                  ),
                ),
                selectedIcon: SvgPicture.asset(
                  AppAssets.explore,
                  colorFilter: ColorFilter.mode(
                    AppColors.yellowColor,
                    BlendMode.srcIn,
                  ),
                ),

                label: '',
              ),
              NavigationDestination(
                icon: SvgPicture.asset(
                  AppAssets.profile,
                  colorFilter: ColorFilter.mode(
                    AppColors.whiteColor,
                    BlendMode.srcIn,
                  ),
                ),
                selectedIcon: SvgPicture.asset(
                  AppAssets.profile,
                  colorFilter: ColorFilter.mode(
                    AppColors.yellowColor,
                    BlendMode.srcIn,
                  ),
                ),

                label: '',
              ),
            ],
          ),
        ),
      ),
      body: tabs[selectedIndex],
    );
  }
}
