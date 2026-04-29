import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cartella/core/theming/colors.dart';
import 'package:cartella/core/theming/styles.dart';
import 'package:cartella/features/categories/ui/widgets/tab_view_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
          centerTitle: true,
          title: Text(
            "Categories",
            style: TextStyles.font11myBlack400W.copyWith(fontSize: 18.sp),
          ),
          bottom: TabBar(
            labelColor: ColorsManager.myblack,
            unselectedLabelColor: ColorsManager.myblack,
            labelStyle: TextStyles.font11myBlack400W.copyWith(fontSize: 20.sp),
            unselectedLabelStyle: TextStyles.font11myBlack400W.copyWith(
              fontSize: 15.sp,
            ),
            indicatorColor: ColorsManager.mainRed,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(text: "Women"),
              Tab(text: "Men"),
              Tab(text: "Kids"),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
          child: TabBarView(
            children: [TabViewScreen(), TabViewScreen(), TabViewScreen()],
          ),
        ),
      ),
    );
  }
}
