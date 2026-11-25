import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/core/app_routes.dart';
import 'package:movie_app/core/custom_container.dart';
import 'package:movie_app/core/custom_text_filled.dart';
import 'package:movie_app/screens/auth/login/view_model/login_view_model.dart';
import 'package:movie_app/screens/auth/widgets/container_tr.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginViewModel(),
      child: BlocListener<LoginViewModel, LoginState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const Center(child: CircularProgressIndicator()),
            );
          }
          if (state is LoginSuccess || state is LoginFailure) {
            Navigator.of(context).pop();
          }
          if (state is LoginSuccess) {
            Navigator.pushReplacementNamed(context, AppRoutes.testHome);
          }
        },
        child: Builder(
          builder: (context) {
            final vm = context.read<LoginViewModel>();
            return Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 19.w),
                  child: Form(
                    key: vm.formKey,
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
                          controller: vm.emailController,
                          keyboardType: .emailAddress,
                          validation: (value) {
                            if (value == null || value.isEmpty) {
                              return "invalid email";
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
                          controller: vm.passController,
                          keyboardType: .visiblePassword,
                          validation: (value) {
                            if(value==null||value.isEmpty){
                              return "invalid password";
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
                        CustomContainer(
                          text: "Login",
                          iconPath: "",
                          onClick: () => vm.login(context),
                        ),
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
                          onClick: () => vm.loginWithGoogle(context),
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
          },
        ),
      ),
    );
  }
}

/* loginToAcc()async{
    if(formKey.currentState!.validate()){
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => const Center(child: CircularProgressIndicator()),
      );
      final ok = await FireStoreManager.login(
        context,
        email: emailController.text.trim(),
        password: passController.text,
      );
      if (!mounted) return ;
      Navigator.of(context).pop();
      if (ok) Navigator.pushReplacementNamed(context, AppRoutes.testHome);    }
  }

  loginWithGoogle() async{
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => const Center(child: CircularProgressIndicator()),
      );
      final ok = await FireStoreManager.loginWithGoogle(context);
      if (!mounted) return;
      Navigator.of(context).pop();
      if (ok) Navigator.pushReplacementNamed(context, AppRoutes.testHome);
  }*/
