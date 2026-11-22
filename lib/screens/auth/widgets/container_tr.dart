import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/core/app_colors.dart';

class ContainerTr extends StatelessWidget {
  const ContainerTr({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: .center,
      height: 37.89.h,
      width: 92.11.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        border: BoxBorder.all(color: AppColors.yellowColor, width: 2.w),
      ),
      child: Row(

        spacing: 20.15.w,
        children: [
          Stack(
            alignment: .center,
            children: [
              Container(
                width: 38.66.w,
                height: 37.89.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: AppColors.yellowColor,
                ),
              ),
              SvgPicture.asset(AppAssets.lr),
            ],
          ),
          SvgPicture.asset(AppAssets.eg, height: 27.w, width: 27.29.w),
        ],
      ),
    );
  }
}
