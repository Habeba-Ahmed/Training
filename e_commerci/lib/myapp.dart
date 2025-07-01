import 'package:e_commerci/feature/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:e_commerci/feature/onboarding/presentation/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OnboardingCubit(),
        ),
      ],
      child: MaterialApp(
      home: SplashScreen()
    )
    );
  }
}
