import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/core/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String iconPath;
  final String hintText;
  const CustomTextField({
    super.key,
    required this.iconPath,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.titleSmall,
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 25.w, right: 15.w),
            child: SvgPicture.asset(iconPath),
          ),
          prefixIconConstraints: BoxConstraints(maxHeight: 60, maxWidth: 60),
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
    );
  }
}
