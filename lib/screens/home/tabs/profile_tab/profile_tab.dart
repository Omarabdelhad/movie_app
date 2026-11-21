import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/screens/home/tabs/profile_tab/widgets/edit_profile_button.dart';
import 'package:movie_app/screens/home/tabs/profile_tab/widgets/exit_button.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 50.h),
            width: .infinity,
            height: MediaQuery.of(context).size.height * .44,
            color: AppColors.greyColor,
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: Image.asset(
                          AppAssets.avatar,
                          height: 118.h,
                          width: 118.w,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              '12',
                              style: Theme.of(context).textTheme.headlineMedium
                                  ?.copyWith(fontSize: 36),
                            ),
                            SizedBox(height: 15.h),
                            Text(
                              'Wish List',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              '10',
                              style: Theme.of(context).textTheme.headlineMedium
                                  ?.copyWith(fontSize: 36),
                            ),
                            SizedBox(height: 15.h),

                            Text(
                              'History',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.h),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Text(
                    'Omar Abdelhady',
                    style: Theme.of(
                      context,
                    ).textTheme.headlineMedium?.copyWith(fontSize: 20),
                  ),
                ),
                SizedBox(height: 23.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    spacing: 12.w,
                    children: [
                      Expanded(child: EditProfileButton()),
                      ExitButton(),
                    ],
                  ),
                ),
                SizedBox(height: 42.h),
                TabBar(
                  unselectedLabelStyle: Theme.of(context).textTheme.titleSmall,
                  labelStyle: Theme.of(context).textTheme.titleSmall,
                  dividerColor: Colors.transparent,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    Tab(
                      icon: SvgPicture.asset(AppAssets.watchList),
                      text: 'Watch List',
                    ),
                    Tab(
                      icon: SvgPicture.asset(
                        AppAssets.history,
                        height: 42.h,
                        width: 42.w,
                      ),
                      text: 'History',
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(child: Image.asset(AppAssets.empty)),
        ],
      ),
    );
  }
}
