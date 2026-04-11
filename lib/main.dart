import 'package:cartella/core/routing/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cartella/core/di/injection.dart';
import 'package:cartella/core/routing/app_router.dart';
import 'package:cartella/my_app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initGetIt();
  await Firebase.initializeApp();
  await ScreenUtil.ensureScreenSize();
  bool isLoggedIn = FirebaseAuth.instance.currentUser != null;
  runApp(MyApp(appRouter: AppRouter(), initialRoute: isLoggedIn ? Routes.appBottomNavBar : Routes.onBoardingScreen,));
}
