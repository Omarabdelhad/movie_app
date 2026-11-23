import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/screens/movie_deatails/widgets/custom_genres_container.dart';
import 'package:movie_app/screens/movie_deatails/widgets/custom_rating_container.dart';
import 'package:movie_app/screens/movie_deatails/widgets/cutom_actor_container.dart';
import 'package:movie_app/screens/movie_deatails/widgets/screen_shoots_screen.dart';
import 'package:movie_app/screens/movie_deatails/widgets/similar_grade.dart';

import '../../core/app_colors.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(color: Colors.black),
                ShaderMask(
                  shaderCallback: (bounds) {
                    return const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFF121312), Color(0x33121312)],
                      stops: [0.6, 1.0],
                    ).createShader(bounds);
                  },
                  blendMode: BlendMode.dstIn,
                  child: Opacity(
                    opacity: .3,
                    child: Image.asset(
                      AppAssets.onBoarding5,
                      width: double.infinity,
                      height: 645.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.w, right: 22.w, top: 29.h),
                  child: Column(
                    crossAxisAlignment: .center,
                    children: [
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                          Icon(Icons.bookmark, color: Colors.white, size: 25),
                        ],
                      ),
                      SizedBox(height: 190.h),
                      Image.asset(
                        AppAssets.watchMovie,
                        height: 97.h,
                        width: 97.w,
                      ),
                      SizedBox(height: 188.h),
                      Text(
                        "Doctor Strange in the Multiverse of Madness",
                        textAlign: .center,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Align(
                    alignment: .center,
                    child: Text(
                      "2022",
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(color: Color(0xffADADAD)),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      alignment: .center,
                      height: 58.h,
                      width: .infinity,
                      decoration: BoxDecoration(
                        color: AppColors.redColor,
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Text(
                        "Watch",
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(color: AppColors.whiteColor),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      CustomRatingContainer(iconPath: AppAssets.love, num: 18),
                      CustomRatingContainer(iconPath: AppAssets.time, num: 18),
                      CustomRatingContainer(iconPath: AppAssets.rate, num: 18),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "Screen Shots",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: 9.h),
                  ScreenShootsScreen(imagePath: AppAssets.screenShot1),
                  SizedBox(height: 14.h),
                  ScreenShootsScreen(imagePath: AppAssets.screenShot1),
                  SizedBox(height: 14.h),
                  ScreenShootsScreen(imagePath: AppAssets.screenShot1),
                  SizedBox(height: 16.h),
                  Text(
                    "Similar",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: 16.h),
                  SimilarGrade(),
                  SizedBox(height: 16.h),
                  Text(
                    "Summary",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "Following the events of Spider-Man No Way Home, Doctor Strange unwittingly casts a forbidden spell that accidentally opens up the multiverse. With help from Wong and Scarlet Witch, Strange confronts various versions of himself as well as teaming up with the young America Chavez while traveling through various realities and working to restore reality as he knows it. Along the way, Strange and his allies realize they must take on a powerful new adversary who seeks to take over the multiverse.—Blazer346",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white,fontSize: 16.sp),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "Cast",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: 8.h),
                  CustomActorContainer(),
                  SizedBox(height: 8.h),
                  CustomActorContainer(),
                  SizedBox(height: 8.h),
                  CustomActorContainer(),
                  SizedBox(height: 16.h),
                  Text(
                    "Genres",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: 8.h),
                  Column(
                    spacing: 11.h,
                    children: [
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          CustomGenresContainer(title: "Action"),
                          CustomGenresContainer(title: "Action"),
                          CustomGenresContainer(title: "Action"),
                        ],
                      ),
                      Row(
                        spacing: 16.w,
                        children: [
                          CustomGenresContainer(title: "Action"),
                          CustomGenresContainer(title: "Action"),
                        ],
                      ),
                    ],
                  )




                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
