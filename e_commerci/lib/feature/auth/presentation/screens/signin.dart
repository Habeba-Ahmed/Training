import 'package:e_commerci/core/constant/color.dart';
import 'package:e_commerci/core/constant/style.dart';
import 'package:e_commerci/core/constant/text.dart';
import 'package:e_commerci/core/widget/customelevatedbutton.dart';
import 'package:e_commerci/feature/auth/presentation/widget/customaddsocialsection.dart';
import 'package:e_commerci/feature/auth/presentation/widget/customheadertext.dart';
import 'package:e_commerci/feature/auth/presentation/widget/customtextformfield.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHeaderText(headrtText: AppText.headerTextSignIn),

            const SizedBox(height : 30),

            CustomTextFormField(
              controller: usernameController, 
              hintText: 'Username or Email',
              prefixicon: Icons.person,
              ),

            const SizedBox(height : 20),

            CustomTextFormField(
              controller: passwordController, 
              hintText: 'Password',
              prefixicon: Icons.lock,
              suffixicon: Icons.remove_red_eye_outlined,
              obscureText: true,
              ),
            

            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text('Forgot Password?', style: TextStyle(color: AppColor.secoundColor,fontWeight: FontWeight.w400,fontSize: 12)),
              ),
            ),

            const SizedBox(height : 30),

            CustomElevatedButton(
            buttonText: 'Login', onPressed: (){}),

            SizedBox(height : 60,),

            Center(
              child: 
              CustomAuthSocialSection(
                normalText: 'Create An Account', 
                actionText: 'Sign Up', 
                onPressed: () {},)
              
              )
          ],
        ),
      ),
    );
  }
}
