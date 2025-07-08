
import 'package:e_commerci/core/constant/routes/routes.dart';
import 'package:e_commerci/feature/auth/presentation/screens/forgetpassword.dart';
import 'package:e_commerci/feature/auth/presentation/screens/signin.dart';
import 'package:e_commerci/feature/auth/presentation/screens/signup.dart';
import 'package:e_commerci/feature/get_start/presentation/screen/getstart.dart';
import 'package:e_commerci/feature/home_page/presentation/screens/homepage.dart';
import 'package:e_commerci/feature/onboarding/presentation/screens/onboarding.dart';
import 'package:e_commerci/feature/splash_screen/splash.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

var routes = [
  GetPage(name: "/", page: () => const SplashScreen() ),

  GetPage(name: AppRoutes.onBoarding, page: () => const OnBoarding()),
  GetPage(name: AppRoutes.signin, page: () => const SignIn()),
  GetPage(name: AppRoutes.signUp, page: () => const SignUp()),
  GetPage(name: AppRoutes.forgetPassword, page: () => ForgetPassword()),
  GetPage(name: AppRoutes.getStart, page: () => const GetStartPage()),
  GetPage(name: AppRoutes.homepage, page: () => const HomePage()),


];

