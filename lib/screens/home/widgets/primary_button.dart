import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final void Function()? onPressed;
  const PrimaryButton({
    super.key,
    required this.backgroundColor,
    required this.textColor,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 56.h),
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(
            context,
          ).textTheme.titleSmall?.copyWith(color: textColor),
        ),
      ),
    );
  }
}
