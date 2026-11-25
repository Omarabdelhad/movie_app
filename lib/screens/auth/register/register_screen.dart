import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:movie_app/core/app_routes.dart';
import 'package:movie_app/core/custom_container.dart';
import 'package:movie_app/core/custom_text_filled.dart';
import 'package:movie_app/screens/auth/register/view_model/register_view_model.dart';
import 'package:movie_app/screens/auth/register/widgets/custom_list_view.dart';
import 'package:movie_app/screens/auth/widgets/container_tr.dart';
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterViewModel(),
      child: BlocListener<RegisterViewModel, RegisterState>(
        listener: (context, state) {
          switch (state) {
            case RegisterLoading():{
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) => const Center(child: CircularProgressIndicator()),
              );
            }
            case RegisterSuccess() || RegisterFailure():{
              Navigator.of(context).pop();
            }
            case RegisterVerified():{
              Navigator.pushReplacementNamed(context, AppRoutes.testHome);
            }
            case RegisterInitial():
              // TODO: Handle this case.
              throw UnimplementedError();
          }
        },
        child: Builder(
          builder: (context) {
            final vm = context.read<RegisterViewModel>();
            return Scaffold(
              backgroundColor: AppColors.blackColor,
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: AppColors.blackColor,
                title: Text(
                  "Register",
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: AppColors.yellowColor),
                ),
                leading: Padding(
                  padding: EdgeInsets.only(left: 34.h),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back, color: AppColors.yellowColor),
                  ),
                ),
              ),
              body: Form(
                key: vm.formKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.w, right: 16.w),
                    child: Column(
                      children: [
                        SizedBox(height: 9.h),
                        CustomListView(onSelected: (value) =>  vm.avatarIndex = value,),
                        SizedBox(height: 10.h),
                        Text(
                          "Avatar",
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall?.copyWith(color: Colors.white),
                        ),
                        SizedBox(height: 12.h),
                        CustomTextFilled(
                          paddingLeft: 6.82,
                          paddingRight: 4.55,
                          hintText: "Name",
                          iconSizeHeight: 36.78,
                          iconSizeWidth: 37.53,
                          iconPrefixPath: AppAssets.userName,
                          controller: vm.nameController,
                          keyboardType: .name,
                          validation: (value) {
                            if (value == null || value.isEmpty) {
                              return "invalid name";
                            }
                          },
                        ),
                        SizedBox(height: 24.h),
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
                            if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                            ).hasMatch(value)) {
                              return "email error";
                            }
                          },
                        ),
                        SizedBox(height: 24.h),
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
                            if (value != null && value.length < 6) {
                              return "password must be longer than 6 characters";
                            }
                          },
                          isPassword: true,
                        ),
                        SizedBox(height: 24.h),
                        CustomTextFilled(
                          paddingLeft: 12,
                          paddingRight: 11.9,
                          hintText: "Confirm Password",
                          iconSizeHeight: 31,
                          iconSizeWidth: 25,
                          iconPrefixPath: AppAssets.password,
                          controller: vm.confirmPassController,
                          keyboardType: .visiblePassword,
                          validation: (value) {
                            if (value != vm.passController.text) {
                              return "invalid Password";
                            }
                          },
                          isPassword: true,
                        ),
                        SizedBox(height: 24.h),
                        CustomTextFilled(
                          paddingRight: 10,
                          paddingLeft: 14,
                          iconSizeHeight: 25,
                          iconSizeWidth: 25,
                          hintText: "Phone Number",
                          iconPrefixPath: AppAssets.phone,
                          controller: vm.phoneController,
                          keyboardType: .phone,
                          validation: (value) {
                            if (value == null || value.isEmpty) {
                              return "invalid phone";
                            }
                          },
                        ),
                        SizedBox(height: 24.h),
                        CustomContainer(
                          text: "Create Account",
                          iconPath: "",
                          onClick: () => vm.createAccount(context),
                        ),
                        SizedBox(height: 17.67.h),
                        Row(
                          mainAxisAlignment: .center,
                          children: [
                            Text(
                              "Already Have Account ?",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: .w400,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: AppColors.yellowColor,
                                  fontSize: 14.sp,
                                  fontWeight: .w900,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 18.25.h),
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



