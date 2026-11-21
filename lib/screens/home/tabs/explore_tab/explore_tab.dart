import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/screens/home/tabs/home_tab/widgets/movies_grid.dart';

class ExploreTab extends StatefulWidget {
  const ExploreTab({super.key});

  @override
  State<ExploreTab> createState() => _ExploreTabState();
}

class _ExploreTabState extends State<ExploreTab> {
  final sections = ['Action', 'Adventure', 'Animation', 'Biography'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: sections.length,
        child: Column(
          children: [
            Builder(
              builder: (context) {
                final controller = DefaultTabController.of(context);
                return TabBar(
                  isScrollable: true,
                  tabAlignment: .start,
                  dividerColor: Colors.transparent,
                  indicatorColor: Colors.transparent,
                  labelPadding: REdgeInsets.symmetric(horizontal: 5.w),
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  tabs: List.generate(sections.length, (index) {
                    return AnimatedBuilder(
                      animation: controller.animation!,
                      builder: (context, child) {
                        final isSelected = controller.index == index;
                        return Container(
                          padding: REdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.yellowColor
                                : AppColors.blackColor,
                            border: Border.all(
                              color: AppColors.yellowColor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Text(
                            sections[index],
                            style: isSelected
                                ? Theme.of(context).textTheme.bodyLarge
                                      ?.copyWith(color: AppColors.blackColor)
                                : Theme.of(context).textTheme.bodyLarge,
                          ),
                        );
                      },
                    );
                  }),
                );
              },
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.w, 25.h, 16.w, 0),
                child: TabBarView(
                  children: sections.map((e) => MoviesGrid()).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
