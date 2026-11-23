import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/screens/movie_deatails/widgets/custom_similar_container.dart';


class SimilarGrade extends StatelessWidget {
  const SimilarGrade({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.h,
      children: [
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            CustomSimilarContainer(imagePath: AppAssets.onBoarding1),
            CustomSimilarContainer(imagePath: AppAssets.onBoarding2),
          ],
        ),
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            CustomSimilarContainer(imagePath: AppAssets.onBoarding1),
            CustomSimilarContainer(imagePath: AppAssets.onBoarding2),
          ],
        ),
      ],
    );
  }
}
