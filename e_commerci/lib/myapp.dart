import 'package:e_commerci/core/connection/apptheme.dart';
import 'package:e_commerci/feature/auth/presentation/cubit/firebase/auth_cubit.dart';
import 'package:e_commerci/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        getPages: routes,
        initialRoute: "/", 
      );
  }
}
