import 'package:e_commerci/core/constant/color.dart';
import 'package:e_commerci/core/constant/text.dart';
import 'package:e_commerci/core/widget/customelevatedbutton.dart';
import 'package:e_commerci/feature/auth/presentation/cubit/firebase/auth_cubit.dart';
import 'package:e_commerci/feature/auth/presentation/screens/forgetpassword.dart';
import 'package:e_commerci/feature/auth/presentation/screens/signup.dart';
import 'package:e_commerci/feature/auth/presentation/widget/customaddsocialsection.dart';
import 'package:e_commerci/feature/auth/presentation/widget/customheadertext.dart';
import 'package:e_commerci/feature/auth/presentation/widget/customtextformfield.dart';
import 'package:e_commerci/feature/get_start/presentation/screen/getstart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubitFireBase(),
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
                suffixicon: const Icon(Icons.remove_red_eye_outlined),
                obscureText: true,
              ),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => ForgetPassword()));
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                        color: AppColor.secoundColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                  ),
                ),
              ),
              const SizedBox(height : 30),

              BlocConsumer<AuthCubitFireBase, AuthStateFireBase>(
                listener: (context, state) {
                  if (state is AuthSignInSuccessFireBase) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('LogIn Successful')),
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const GetStartPage()),
                    );
                  } else if (state is AuthSignInFailedFireBase) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoadingFireBase) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return CustomElevatedButton(
                    buttonText: 'Login',
                    onPressed: () {
                      context.read<AuthCubitFireBase>().signIn(
                          email: usernameController.text.trim(),
                          password: passwordController.text.trim());
                    },
                  );
                },
              ),

              const SizedBox(height : 60),

              Center(
                child: CustomAuthSocialSection(
                  normalText: 'Create An Account',
                  actionText: 'Sign Up',
                  width : 194,
                  hight: 136,
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const SignUp()));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
