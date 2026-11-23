import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/app_colors.dart';

class CustomRatingContainer extends StatelessWidget {
   CustomRatingContainer({super.key,required this.iconPath,required this.num});
  String iconPath;
  double num;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47.h,
      alignment: .center,
      width: 122.w,
      decoration: BoxDecoration(
        color: AppColors.greyColor,
        borderRadius: BorderRadius.circular(16.r),

      ),
      child: Row(
        mainAxisAlignment: .center,
        spacing: 14.w,
        children: [
          SvgPicture.asset(iconPath),
          Text("${num}",style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: Colors.white,
            fontSize: 24.sp
          ),)
        ],
      ),
    );
  }
}
