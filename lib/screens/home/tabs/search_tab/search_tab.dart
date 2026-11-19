import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/core/app_colors.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: Theme.of(context).textTheme.bodySmall,
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 25.w, right: 15.w),
                  child: SvgPicture.asset(AppAssets.search),
                ),
                prefixIconConstraints: BoxConstraints(
                  maxHeight: 60,
                  maxWidth: 60,
                ),
                fillColor: AppColors.greyColor,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
              ),
            ),
          ),
          Expanded(child: Image.asset(AppAssets.empty)),
        ],
      ),
    );
  }
}
