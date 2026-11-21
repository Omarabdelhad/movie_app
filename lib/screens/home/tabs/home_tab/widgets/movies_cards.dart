import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/screens/home/tabs/home_tab/models/movie_model.dart';

class MoviesCards extends StatelessWidget {
  final MovieModel movie;
  final VoidCallback? onTap;
  const MoviesCards({super.key, required this.movie, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: Stack(
          children: [
            Positioned.fill(child: Image.asset(movie.image, fit: BoxFit.cover)),
            Positioned(
              top: 8.h,
              left: 8.w,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 5.h),

                decoration: BoxDecoration(
                  color: AppColors.blackColor.withValues(alpha: 0.7),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  children: [
                    Text(
                      movie.rating.toString(),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    SizedBox(width: 5.w),
                    SvgPicture.asset(AppAssets.rate, height: 15.h, width: 15.w),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
