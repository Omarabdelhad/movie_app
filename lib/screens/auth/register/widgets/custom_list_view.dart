import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/screens/auth/register/widgets/list_avatar.dart';

class CustomListView extends StatefulWidget {
  CustomListView({super.key,required this.onSelected});
   final ValueChanged<int> onSelected;

@override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  int currentIndex = 0;
  late int avatarIndex;

  late CarouselSliderController carouselSlider;

  @override
  void initState() {
    carouselSlider = CarouselSliderController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 161.h,
      width: double.infinity,
      child: CarouselSlider.builder(
        carouselController: carouselSlider,
        itemCount: ListAvatar.avatarList.length,
        itemBuilder: (context, index, realIndex) {
          bool isCenter = index == currentIndex;
          return GestureDetector(
            onTap: () {
              setState(() {
                avatarIndex=index;
              });
              widget.onSelected(index);
              carouselSlider.animateToPage(index);
              print(index);
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: isCenter ? 161.h : 94.h,
              width: isCenter ? 158.w : 94.w,
              child: ListAvatar.avatarList[index],
            ),
          );
        },
        options: CarouselOptions(
          height: 161.h,
          viewportFraction: .35,
          enlargeCenterPage: false,
          onPageChanged: (index, reason) {
            setState(() {
              currentIndex = index;
            });
            print(currentIndex);
          },
        ),
      ),
    );
  }
}
