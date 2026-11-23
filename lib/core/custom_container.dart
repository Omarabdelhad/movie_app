import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/core/app_colors.dart';

class CustomContainer extends StatelessWidget {
  CustomContainer({super.key,required this.text,required this.iconPath,required this.onClick});
  String text;
  String iconPath;
  void Function()onClick;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        alignment: .center,
        height: 55.7.h,
        width: .infinity,
        decoration: BoxDecoration(
          color: AppColors.yellowColor,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Row(
          mainAxisAlignment: .center,
          spacing: 11.w,
          children: [
          SvgPicture.asset(iconPath),
          Text(text,style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.blackColor)),
        ],)
      ),
    );
  }
}
