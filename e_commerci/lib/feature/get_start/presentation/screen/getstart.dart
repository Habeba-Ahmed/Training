
import 'package:e_commerci/feature/get_start/presentation/widget/custombackground.dart';
import 'package:e_commerci/feature/get_start/presentation/widget/customdartcontainer.dart';
import 'package:flutter/material.dart';

class GetStartPage extends StatelessWidget {
  const GetStartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomBackgroundImage(),
        CustomDartContainer()

      ],
    );
  }
}
