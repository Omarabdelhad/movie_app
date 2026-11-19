import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/app_colors.dart';

class ExitButton extends StatelessWidget {
  const ExitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(double.infinity, 56.h),
        backgroundColor: AppColors.redColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
      ),
      onPressed: () {},
      child: Row(
        children: [
          Text('Exit', style: Theme.of(context).textTheme.titleSmall),
          SizedBox(width: 10.w),
          Icon(Icons.logout, color: AppColors.whiteColor),
        ],
      ),
    );
  }
}
