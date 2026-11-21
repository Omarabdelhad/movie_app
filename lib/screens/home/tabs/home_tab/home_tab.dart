import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/core/app_routes.dart';
import 'package:movie_app/screens/home/tabs/home_tab/models/movie_model.dart';
import 'package:movie_app/screens/home/tabs/home_tab/widgets/movies_cards.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int currentIndexPage = 0;

  @override
  Widget build(BuildContext context) {
    final movies = MovieModel.movies;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            width: double.infinity,

            child: Stack(
              children: [
                Positioned(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: Image.asset(
                      movies[currentIndexPage].image,
                      key: ValueKey(currentIndexPage),
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),

                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.blackColor.withValues(alpha: 0.6),
                          AppColors.blackColor,
                        ],
                      ),
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.topCenter,

                  child: Image.asset(AppAssets.availableNow),
                ),
                Align(
                  alignment: Alignment.center,
                  child: CarouselSlider.builder(
                    itemBuilder: (context, index, realIndex) {
                      return MoviesCards(
                        movie: movies[index],
                        onTap: () {
                          Navigator.of(
                            context,
                          ).pushNamed(AppRoutes.movieDetails);
                        },
                      );
                    },
                    options: CarouselOptions(
                      height: 351.h,
                      viewportFraction: 0.55,
                      enlargeCenterPage: true,
                      
                      enlargeFactor: .3,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndexPage = index;
                        });
                      },
                    ),
                    itemCount: movies.length,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,

                  child: Image.asset(AppAssets.watchNow),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text('Action', style: Theme.of(context).textTheme.titleSmall),
                Row(
                  children: [
                    Text(
                      'See More',
                      style: Theme.of(
                        context,
                      ).textTheme.displaySmall?.copyWith(fontSize: 16),
                    ),
                    SizedBox(width: 6.w),
                    Icon(
                      Icons.arrow_forward_rounded,
                      color: AppColors.yellowColor,
                      size: 15,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 220.h,
            child: ListView.separated(
              padding: EdgeInsetsDirectional.only(start: 16.w),
              scrollDirection: .horizontal,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 190.w,
                  child: MoviesCards(
                    movie: movies[index],
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        AppRoutes.movieDetails,
                        arguments: movies[index],
                      );
                    },
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: 16.w);
              },
            ),
          ),
        ],
      ),
    );
  }
}
