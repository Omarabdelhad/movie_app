import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/screens/home/widgets/custom_text_field.dart';
import 'package:movie_app/screens/home/widgets/primary_button.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back, color: AppColors.yellowColor),
        title: Text(
          'Pick Avatar',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.h),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Center(
              child: Image.asset(AppAssets.avatar, width: 150.w, height: 150.h),
            ),
            SizedBox(height: 35.h),
            CustomTextField(
              iconPath: AppAssets.person,
              hintText: 'Omar Abdelhady',
            ),
            SizedBox(height: 20.h),
            CustomTextField(iconPath: AppAssets.phone, hintText: '01234567890'),
            SizedBox(height: 30.h),
            TextButton(
              onPressed: () {},
              child: Text(
                'Reset Password',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            Spacer(),
            PrimaryButton(
              backgroundColor: AppColors.redColor,
              textColor: AppColors.whiteColor,
              text: 'Delete Account', onPressed: () {  },
            ),
            SizedBox(height: 19.h),
            PrimaryButton(
              backgroundColor: AppColors.yellowColor,
              textColor: AppColors.blackColor,
              text: 'Update Data', onPressed: () {  },
            ),
          ],
        ),
      ),
    );
  }
}
