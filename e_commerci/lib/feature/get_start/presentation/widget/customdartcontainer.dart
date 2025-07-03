import 'package:e_commerci/feature/get_start/presentation/widget/custombodygetstart.dart';
import 'package:flutter/material.dart';

class CustomDartContainer extends StatelessWidget {
  const CustomDartContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width : double.infinity,
        height : double.infinity,
        color: Colors.black.withOpacity(0.4),
        child: CustomBodyGetStart()
        );
  }
}