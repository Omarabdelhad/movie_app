import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/core/custom_container.dart';

import '../../../core/app_colors.dart';
import '../../../core/custom_text_filled.dart';

class ForgetPassScreen extends StatefulWidget {
  const ForgetPassScreen({super.key});

  @override
  State<ForgetPassScreen> createState() => _FotgetPassScreenState();
}

class _FotgetPassScreenState extends State<ForgetPassScreen> {
  late TextEditingController emailController;
  @override
  void initState() {
    emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.blackColor,
        title: Text(
          "Forget Password",
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: AppColors.yellowColor),
        ),
        leading: Padding(
          padding:  EdgeInsets.only(left: 34.h),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back, color: AppColors.yellowColor),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Image.asset(AppAssets.forgetPass),
            SizedBox(height: 24.h,),
            CustomTextFilled(
              paddingRight: 8.9,
              paddingLeft: 9,
              iconSizeWidth: 31,
              iconSizeHeight: 25,
              hintText: "Email",
              iconPrefixPath: AppAssets.email,
              controller: emailController,
              validation: (value) {
                if (value == null || value.isEmpty) {
                  return "invalid email";
                }
                if (!RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                ).hasMatch(value)) {
                  return "email error";
                }
              }, keyboardType: .emailAddress,
            ),
            SizedBox(height: 24.h,),
            CustomContainer(text: "Verify Email", iconPath: "")

          ],
        ),
      ),
    );
  }
}
