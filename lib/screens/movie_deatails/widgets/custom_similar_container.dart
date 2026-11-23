import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/app_assets.dart';

class CustomSimilarContainer extends StatelessWidget {
   CustomSimilarContainer({super.key,required this.imagePath});
  String imagePath;
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
      Container(
      height: 279.h,
      width: 189.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        image: DecorationImage(image: AssetImage(imagePath),fit: .cover),
      ),
    ),
        Align(
          alignment: .topStart,
          child: Padding(
            padding:  EdgeInsets.only(top: 13.h,left: 10.w ),
            child: Container(
              height: 28.h,
              width: 58.w,
              alignment: .center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Color(0xb5121312)
              ),
              child: Row(
                mainAxisAlignment: .center,
                spacing: 5.w,
                children: [
                  Text("7.7",style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 16.sp),),
                  SvgPicture.asset(AppAssets.rate,height: 15.h,width: 15.w,)
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
