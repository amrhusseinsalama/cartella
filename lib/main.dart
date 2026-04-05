import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cartella/core/di/injection.dart';
import 'package:cartella/core/routing/app_router.dart';
import 'package:cartella/my_app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  initGetIt();
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(MyApp(appRouter: AppRouter()));
}

