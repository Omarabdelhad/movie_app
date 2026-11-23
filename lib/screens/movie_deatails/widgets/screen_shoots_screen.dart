import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/app_assets.dart';

class ScreenShootsScreen extends StatelessWidget {
   ScreenShootsScreen({super.key,required this.imagePath});
  String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 167.h,
      width: .infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        image: DecorationImage(image: AssetImage(imagePath),fit: .cover),
      ),
    );
  }
}
