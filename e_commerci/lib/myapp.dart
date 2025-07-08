import 'package:e_commerci/core/connection/apptheme.dart';
import 'package:e_commerci/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_ , child) {
        return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        getPages: routes,
        initialRoute: "/", 
      );
}
);}
}