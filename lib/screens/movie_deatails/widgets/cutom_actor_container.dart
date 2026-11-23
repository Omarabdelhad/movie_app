import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/app_colors.dart';

class CustomActorContainer extends StatelessWidget {
  const CustomActorContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: .center,
      padding: EdgeInsets.only(left:11.w,top: 11.h,bottom: 11.h ),
      height: 92.h,
      width: .infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.greyColor,
      ),
      child: Row(
        spacing: 10.w,
        children: [
          Image.asset("assets/images/actor11.png", height: 70.h, width: 70.w),
          Padding(
            padding:  EdgeInsets.only(top: 5.h),
            child: Column(
              crossAxisAlignment: .start,
              spacing:11.h ,
              children: [
                Text(
                  "Name : murtada mansoure",
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(fontSize: 20.sp),
                ),
                Text(
                  "Character : murtada mansoure",
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(fontSize: 20.sp),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
