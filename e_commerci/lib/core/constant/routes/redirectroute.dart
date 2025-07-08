import 'package:e_commerci/core/cache/chachehelper.dart';
import 'package:e_commerci/core/constant/routes/routes.dart';
import 'package:flutter/material.dart';

class ReDirectRoute {
  static RouteSettings redirect(String? route) {
    final step = Chachehelper.getDate(key: 'step');

    if (step == "3") {
      return const RouteSettings(name: AppRoutes.homepage);
    } else if (step == "2") {
      return const RouteSettings(name: AppRoutes.getStart);
    }else if (step == "1") {
      return const RouteSettings(name: AppRoutes.signin);
    } else {
      return const RouteSettings(name: AppRoutes.onBoarding);
    }
  }
}
