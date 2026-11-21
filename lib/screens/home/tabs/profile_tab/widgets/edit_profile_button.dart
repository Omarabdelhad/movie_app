import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/core/app_routes.dart';

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(double.infinity, 56.h),

        backgroundColor: AppColors.yellowColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
      ),
      onPressed: () {
        Navigator.of(context).pushNamed(AppRoutes.updateProfile);
      },
      child: Text(
        'Edit Profile',
        style: Theme.of(
          context,
        ).textTheme.titleSmall?.copyWith(color: AppColors.blackColor),
      ),
    );
  }
}
