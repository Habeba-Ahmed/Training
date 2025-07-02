import 'package:e_commerci/core/constant/color.dart';
import 'package:e_commerci/core/constant/style.dart';
import 'package:e_commerci/core/constant/text.dart';
import 'package:e_commerci/core/widget/customelevatedbutton.dart';
import 'package:e_commerci/feature/auth/presentation/screens/forgetpassword.dart';
import 'package:e_commerci/feature/auth/presentation/screens/signin.dart';
import 'package:e_commerci/feature/auth/presentation/screens/signup.dart';
import 'package:e_commerci/feature/auth/presentation/widget/customaddsocialsection.dart';
import 'package:e_commerci/feature/auth/presentation/widget/customheadertext.dart';
import 'package:e_commerci/feature/auth/presentation/widget/customtextformfield.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHeaderText(headrtText: AppText.headerTextforgetPassword),

            const SizedBox(height : 30),

            CustomTextFormField(
              controller: emailController, 
              hintText: 'Enter your email address',
              prefixicon: Icons.email,
              ),
            const SizedBox(height : 20),

          RichText(
              text: TextSpan(
                style: AppTextStyle.agreementText,
                children: [
                  TextSpan(
                    text: '*',
                    style: TextStyle(color: AppColor.primaryColor)
                  ),
                  TextSpan(text: ' We will send you a message to set or reset \nyour new password'),
                ],
              ),
            ),

            const SizedBox(height : 30),

            CustomElevatedButton(
            buttonText: 'Submit', onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignIn()));
            }),

          ],
        ),
      ),
    );
  }
}
