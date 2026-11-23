import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_colors.dart';

class CustomGenresContainer extends StatelessWidget {
   CustomGenresContainer({super.key,required this.title});
   String title;

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 36.h,
      alignment: .center,
      width: 122.w,
      decoration: BoxDecoration(
        color: AppColors.greyColor,
        borderRadius: BorderRadius.circular(16.r),

      ),
      child: Text(title,style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: Colors.white,
          fontSize: 16.sp
      ),),
    );
  }
}
