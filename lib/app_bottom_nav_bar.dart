import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cartella/core/theming/colors.dart';
import 'package:cartella/core/theming/styles.dart';
import 'package:cartella/features/cart/ui/cart_screen.dart';
import 'package:cartella/features/favorites/ui/favorite_screen.dart';
import 'package:cartella/features/home/ui/home_screen.dart';
import 'package:cartella/features/profile/profile.dart';
import 'package:cartella/features/categories/ui/categories_screen.dart';

class AppBottomNavBar extends StatefulWidget {
  const AppBottomNavBar({super.key});

  @override
  State<AppBottomNavBar> createState() => _AppBottomNavBarState();
}

class _AppBottomNavBarState extends State<AppBottomNavBar> {
  int currentIndex = 0;

  List<Widget> pages = [
    HomeScreen(),
    CategoriesScreen(),
    CartScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  BottomNavigationBarItem bottomNavItem(IconData icon, String label) {
    return BottomNavigationBarItem(icon: Icon(icon), label: label);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: Container(
        height: 70.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10.r)],
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          unselectedLabelStyle: TextStyles.font10gray400W,
          elevation: 0,
          selectedItemColor: ColorsManager.mainRed,
          unselectedItemColor: ColorsManager.mygray,
          items: [
            bottomNavItem(Icons.home, "Home"),
            bottomNavItem(Icons.category_outlined, "Categories"),
            bottomNavItem(Icons.shopping_cart_outlined, "Cart"),
            bottomNavItem(Icons.favorite_border, "Favorites"),
            bottomNavItem(Icons.person_outline, "Profile"),
          ],
        ),
      ),
    );
  }
}
