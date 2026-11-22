import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/app_assets.dart';
import 'package:movie_app/core/app_colors.dart';

class CustomTextFilled extends StatefulWidget {
  CustomTextFilled({
    super.key,
    required this.hintText,
    required this.iconPrefixPath,
    this.iconSuffixPath = "",
    required this.controller,
    required this.keyboardType,
    this.isPassword = false, required this.validation,
    required this.iconSizeHeight,
    required this.iconSizeWidth,
    required this.paddingLeft,
    required this.paddingRight
  });

  final String hintText;
  final String iconPrefixPath;
  final String iconSuffixPath;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isPassword;
  final String? Function(String?)validation;
  double iconSizeWidth;
  double iconSizeHeight;
  double paddingLeft;
  double paddingRight;

  @override
  State<CustomTextFilled> createState() => _CustomTextFilledState();
}

class _CustomTextFilledState extends State<CustomTextFilled> {
  bool visibleOff = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      height:55.72.h ,
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: .w400),
        validator: widget.validation,
        controller: widget.controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 16.w,
          ),
          prefixIconConstraints: BoxConstraints(
            minWidth: 48.w,
            minHeight: 55.72.h,
          ),

          suffixIconConstraints: BoxConstraints(
            minWidth: 48.w,
            minHeight: 55.72.h,
          ),
          filled: true,
          errorStyle: TextStyle(color: Colors.red),
          fillColor: AppColors.greyColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(color: Colors.red),
          ) ,
          hintText: widget.hintText,
          hintStyle: Theme.of(context).textTheme.bodySmall,
          prefixIcon: Padding(
            padding:  EdgeInsets.only(left: widget.paddingLeft.w,right: widget.paddingRight.w  ),
            child: SvgPicture.asset( widget.iconPrefixPath,
              width: widget.iconSizeWidth.w,
              height: widget.iconSizeHeight.h,
            ),
          ),
          suffixIcon: widget.isPassword
              ?
          IconButton(
            constraints: BoxConstraints(
              minWidth: 48.w,
              minHeight: 55.72.h,
            ),
            padding: EdgeInsets.zero,
            onPressed: () {
              setState(() {
                visibleOff = !visibleOff;
              });
            },
            icon: Padding(
              padding:  EdgeInsets.only(right: 16.w, top: 8.h, bottom: 8.h),
              child: SvgPicture.asset(
                visibleOff?AppAssets.visibleOff
                    :AppAssets.visibleOn,
                height: 24.h,
                width: 24.w,
                colorFilter: .mode(Colors.white,.srcIn),
              ),
            ),
          )
              : null,
        ),
        keyboardType: widget.keyboardType,
        obscureText: widget.isPassword? visibleOff:false,
        onTapOutside: (event) {
          Duration(milliseconds: 2);
          FocusScope.of(context).unfocus();
        },
      ),
    );
  }
}
