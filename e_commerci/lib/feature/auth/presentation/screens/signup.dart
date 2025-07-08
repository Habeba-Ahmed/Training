import 'package:e_commerci/core/constant/color.dart';
import 'package:e_commerci/core/constant/routes/routes.dart';
import 'package:e_commerci/core/constant/style.dart';
import 'package:e_commerci/core/translate/text.dart';
import 'package:e_commerci/core/widget/customelevatedbutton.dart';
import 'package:e_commerci/feature/auth/presentation/cubit/FireBase/auth_cubit.dart';
import 'package:e_commerci/feature/auth/presentation/screens/signin.dart';
import 'package:e_commerci/feature/auth/presentation/widget/customaddsocialsection.dart';
import 'package:e_commerci/feature/auth/presentation/widget/customheadertext.dart';
import 'package:e_commerci/feature/auth/presentation/widget/customtextformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    AppText text=AppText();

    return BlocProvider(
      create: (context) => AuthCubitFireBase(),
      child: Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 48.0.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomHeaderText(headrtText: text.keys['4']!), // Create Account
                SizedBox(height : 30.h),

                CustomTextFormField(
                  controller: usernameController,
                  hintText: text.keys['6']!, // Username or Email
                  prefixicon: Icons.person,
                ),
                SizedBox(height : 20.h),

                CustomTextFormField(
                  controller: passwordController,
                  hintText: text.keys['7']!, // Password
                  prefixicon: Icons.lock,
                  suffixicon: const Icon(Icons.remove_red_eye_outlined),
                  obscureText: true,
                ),
                SizedBox(height : 20.h),

                CustomTextFormField(
                  controller: confirmPasswordController,
                  hintText: text.keys['12']!, // Confirm Password
                  prefixicon: Icons.lock,
                  suffixicon: const Icon(Icons.remove_red_eye_outlined),
                  obscureText: true,
                ),
                SizedBox(height : 30.h),

                RichText(
                  text: TextSpan(
                    style: AppTextStyle.agreementText,
                    children: [
                      TextSpan(text: text.keys['13']!), // By clicking the
                      TextSpan(
                        text: text.keys['14']!, // Register
                        style: TextStyle(color: AppColor.primaryColor),
                      ),
                      TextSpan(text: text.keys['15']!), // , you agree to the public offer
                    ],
                  ),
                ),
                SizedBox(height  : 30.h),

                BlocConsumer<AuthCubitFireBase, AuthStateFireBase>(
                  listener: (context, state) {
                    if (state is AuthSignUpSuccessFireBase) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(text.keys['17']!)), // Created Account Successfully
                      );
                      Get.offNamed(AppRoutes.signin);
                    } else if (state is AuthSignUpFailedFireBase) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.message)),
                      );
                    }
                  },
                  builder: (context, state) {
                    final cubit = context.read<AuthCubitFireBase>();
                    if (state is AuthLoadingFireBase) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return CustomElevatedButton(
                      buttonText: text.keys['16']!, // Create Account
                      onPressed: () {
                        cubit.signUp(
                          email: usernameController.text.trim(),
                          password: passwordController.text.trim(),
                          confirmpassword: confirmPasswordController.text,
                        );
                      },
                    );
                  },
                ),

                SizedBox(height : 60.h),

                Center(
                  child: CustomAuthSocialSection(
                    width : 250.w,
                    hight: 150.h,
                    normalText: text.keys['18']!, // I Already Have an Account
                    actionText: text.keys['19']!, // Login
                    onPressed: () {
                      Get.offNamed(AppRoutes.signin);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
