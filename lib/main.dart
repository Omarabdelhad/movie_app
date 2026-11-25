import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/app_routes.dart';
import 'package:movie_app/core/app_theme.dart';
import 'package:movie_app/screens/auth/forget_pass/forget_pass_screen.dart';
import 'package:movie_app/screens/auth/home.dart';
import 'package:movie_app/screens/auth/login/login_screen.dart';
import 'package:movie_app/screens/auth/register/register_screen.dart';
import 'package:movie_app/screens/movie_deatails/movie_details_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        routes: {
          AppRoutes.register:(context)=>RegisterScreen(),
          AppRoutes.login:(context)=>LoginScreen(),
          AppRoutes.forget:(context)=>ForgetPassScreen(),
          AppRoutes.details:(context)=>MovieDetailsScreen(),
          AppRoutes.testHome:(context)=>Home(),
        },
        initialRoute: AppRoutes.login,
      )
    );
  }
}


