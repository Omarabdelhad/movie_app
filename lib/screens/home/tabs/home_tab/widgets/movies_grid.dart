import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/screens/home/tabs/home_tab/models/movie_model.dart';
import 'package:movie_app/screens/home/tabs/home_tab/widgets/movies_cards.dart';

class MoviesGrid extends StatelessWidget {
  const MoviesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final movies = MovieModel.movies;
    return GridView.builder(
      itemCount: movies.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20.w,
        mainAxisSpacing: 8.h,
        childAspectRatio: .7,
      ),
      itemBuilder: (context, index) {
        return MoviesCards(movie: movies[index]);
      },
    );
  }
}
