import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/app_routes.dart';
import 'package:movie_app/core/app_theme.dart';
import 'package:movie_app/screens/home/home_screen.dart';
import 'package:movie_app/screens/home/movie_details/movie_details.dart';
import 'package:movie_app/screens/home/tabs/profile_tab/widgets/update_profile.dart/update_profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(519, 926),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          initialRoute: AppRoutes.home,
          routes: {
            
            AppRoutes.home: (context)=>const HomeScreen(),
            AppRoutes.updateProfile:(context)=> const UpdateProfileScreen(),
            AppRoutes.movieDetails:(context)=> const MovieDetails()
            }
            
          
        );
      },
    );
  }
}
