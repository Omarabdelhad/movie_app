import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/core/app_routes.dart';
import 'package:movie_app/core/custom_container.dart';
import 'package:movie_app/core/custom_text_filled.dart';
import 'package:movie_app/screens/auth/widgets/container_tr.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passController;

  @override
  void initState() {
    emailController = TextEditingController();
    passController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }
  GlobalKey<FormState>formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 19.w),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(height: 67.h),
                Image.asset(AppAssets.watch0, height: 118.h, width: 121.w),
                SizedBox(height: 69.h),
                CustomTextFilled(
                  paddingRight: 8.9,
                  paddingLeft: 9,
                  iconSizeWidth: 31,
                  iconSizeHeight: 25,
                  hintText: "Email",
                  iconPrefixPath: AppAssets.email,
                  controller: emailController,
                  keyboardType: .emailAddress,
                  validation: (value) {
                    if (value == null || value.isEmpty) {
                      return "invalid email";
                    }
                    if (emailController.text!="yousef@gmail.com") {
                      return "email error";
                    }
                  },
                ),
                SizedBox(height: 22.4.h),
                CustomTextFilled(
                  paddingLeft: 12,
                  paddingRight: 11.9,
                  iconSizeHeight: 31,
                  iconSizeWidth: 25,
                  hintText: "Password",
                  iconPrefixPath: AppAssets.password,
                  controller: passController,
                  keyboardType: .visiblePassword,
                  validation: (value) {
                    if(value==null||value.isEmpty){
                      return "invalid password";
                    }
                        if(passController.text!="11111111"){
                          print("IT'S GOOD TO NAVIGATE");
                        }
                   },
                  isPassword: true,
                ),
                SizedBox(height: 17.8.h),
                Align(
                  alignment: .centerEnd,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(AppRoutes.forget);
                    },
                    child: Text(
                      "Forget Password ?",
                      textAlign: .end,
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: AppColors.yellowColor),
                    ),
                  ),
                ),
                CustomContainer(text: "Login", iconPath: "",onClick: loginToAcc,),
                SizedBox(height: 22.74.h),
                Row(
                  mainAxisAlignment: .center,
                  children: [
                    Text(
                      "Don't Have Account ?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: .w400,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.register);
                      },
                      child: Text(
                        "Create One",
                        style: TextStyle(
                          color: AppColors.yellowColor,
                          fontSize: 14.sp,
                          fontWeight: .w900,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 27.7.h),
                Row(
                  mainAxisAlignment: .center,
                  children: [
                    Container(
                      width: 91.84.w,
                      height: 1.12.h,
                      decoration: BoxDecoration(color: AppColors.yellowColor),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 11.2.w),
                      child: Text(
                        "OR",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.yellowColor,
                          fontSize: 15.sp,
                        ),
                      ),
                    ),
                    Container(
                      width: 91.84.w,
                      height: 1.12.h,
                      decoration: BoxDecoration(color: AppColors.yellowColor),
                    ),              ],
                ),
                SizedBox(height: 28.h),
                CustomContainer(
                  onClick: () {

                  },
                  text: "Login With Google",
                  iconPath: AppAssets.google,
                ),
                SizedBox(height: 33.6.h),
                ContainerTr(),
              ],
            ),
          ),
        ),
      ),
    );
  }
  loginToAcc(){
    if(formKey.currentState!.validate()){
      print("IT'S GOOD TO NAVIGATE");
    }
  }
}
