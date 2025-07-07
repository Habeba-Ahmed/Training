import 'package:e_commerci/core/constant/color.dart';
import 'package:e_commerci/core/constant/text.dart';
import 'package:e_commerci/core/widget/customelevatedbutton.dart';
import 'package:e_commerci/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:e_commerci/feature/auth/presentation/screens/signin.dart';
import 'package:e_commerci/feature/auth/presentation/widget/customheadertext.dart';
import 'package:e_commerci/feature/auth/presentation/widget/customtextformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPassword extends StatelessWidget {
  final String email;
  const ResetPassword({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    TextEditingController verifyCodeController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmpasswordController = TextEditingController();

    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHeaderText(headrtText: AppText.headerTextresetPassword),

            const SizedBox(height : 30),
          CustomTextFormField(
  controller: verifyCodeController,
  hintText: 'Verify Code',
  prefixicon: Icons.lock,
  suffixicon: IconButton(
    icon: const Icon(Icons.content_paste),
    tooltip: 'Paste from clipboard',
    onPressed: () async {
      final clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
      if (clipboardData?.text != null) {
        verifyCodeController.text = clipboardData?.text?.trim() ?? '';
      }
    },
  ),
),

            const SizedBox(height : 20),

            CustomTextFormField(
              controller: passwordController, 
              hintText: 'Password',
              prefixicon: Icons.lock,
              suffixicon: Icon(Icons.remove_red_eye_outlined),
              obscureText: true,
            ),
            const SizedBox(height : 20),
            CustomTextFormField(
              controller: confirmpasswordController, 
              hintText: 'Confirm Password',
              prefixicon: Icons.lock,
              suffixicon: Icon(Icons.remove_red_eye_outlined),
              obscureText: true,
            ),
            const SizedBox(height : 20),


            const SizedBox(height : 30),

            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthResetPasswordSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Password reset successfully!"))
                  );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => SignIn()),
                  );
                } else if (state is AuthResetPasswordFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                }
              },

              builder: (context, state) {
                return CustomElevatedButton(
            buttonText: 'Submit', onPressed: (){
              context.read<AuthCubit>().updatePassword(passwordController.text,confirmpasswordController.text,email);
            });
              },
            )

          ],
        ),
      ),
    )
    );
  }
}
