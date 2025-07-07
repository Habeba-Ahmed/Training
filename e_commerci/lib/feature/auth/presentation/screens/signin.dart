import 'package:e_commerci/core/constant/color.dart';
import 'package:e_commerci/core/constant/text.dart';
import 'package:e_commerci/core/widget/customelevatedbutton.dart';
import 'package:e_commerci/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:e_commerci/feature/auth/presentation/screens/forgetpassword.dart';
import 'package:e_commerci/feature/auth/presentation/screens/signup.dart';
import 'package:e_commerci/feature/auth/presentation/widget/customaddsocialsection.dart';
import 'package:e_commerci/feature/auth/presentation/widget/customheadertext.dart';
import 'package:e_commerci/feature/auth/presentation/widget/customtextformfield.dart';
import 'package:e_commerci/feature/get_start/presentation/screen/getstart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
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
              suffixicon: Icon(Icons.remove_red_eye_outlined),
              obscureText: true,
              ),
            

            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ForgetPassword()));
                },
                child: Text('Forgot Password?', style: TextStyle(color: AppColor.secoundColor,fontWeight: FontWeight.w400,fontSize: 12)),
              ),
            ),

            const SizedBox(height : 30),

            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthSignInSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('LogIn Successful ')),
                  );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => GetStartPage()),
                  );
                } else if (state is AuthSignInFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                }
              },
              builder: (context, state) {
                return CustomElevatedButton(
            buttonText: 'Login', onPressed: (){
                context.read<AuthCubit>().signIn(email: usernameController.text, password: passwordController.text);

            });
              },
            ),

            SizedBox(height : 60,),

            Center(
              child: 
              CustomAuthSocialSection(
                normalText: 'Create An Account', 
                actionText: 'Sign Up', 
                width : 194, 
                hight : 136,
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUp()));
                }, )
              
              )
          ],
        ),
      ),
    )
    );
  }
}
