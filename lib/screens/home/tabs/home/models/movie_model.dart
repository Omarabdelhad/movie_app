import 'package:movie_app/core/app_assets.dart';

class MovieModel {
  final String image;
  final double rating;

  const MovieModel({required this.image, required this.rating});
  static const List<MovieModel> movies = [
    MovieModel(image: AppAssets.topHome1, rating: 7.7),
    MovieModel(image: AppAssets.onBoarding6, rating: 7.7),
    MovieModel(image: AppAssets.topHome3, rating: 7.7),
    
  ];
}
