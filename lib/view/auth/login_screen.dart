import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter_base/common/widgets/buttons.dart';
import 'package:flutter_base/common/widgets/text.dart';
import 'package:flutter_base/common/widgets/text_fields.dart';
import 'package:flutter_base/constants/size_unit.dart';
import 'package:flutter_base/constants/space.dart';
import 'package:flutter_base/providers/auth_provider.dart';
import 'package:flutter_base/repositories/auth_repository.dart';
import 'package:flutter_base/services/route/routes.dart';
import 'package:flutter_base/theme/palette.dart';
import 'package:flutter_base/utilities/extensions/form_extension.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController contEmail = TextEditingController();
  final TextEditingController contPassword = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.pureWhite,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(SizeUnit.lg),
            child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextCustom('Welcome Back.!',
                        fontWeight: FontWeight.w700, size: 20),
                    const HeightHalf(),
                    const TextCustom(
                      'Sign In to EDII-TN by your registered email id',
                      fontWeight: FontWeight.bold,
                      color: Palette.grey,
                    ),
                    const HeightFull(multiplier: 2),
                    TextFormFieldCustom(
                        label: 'Email ID',
                        keyboardType: TextInputType.emailAddress,
                        controller: contEmail,
                        isBorderLess: false,
                        hint: 'Enter your email'),
                    const HeightFull(),
                    TextFormFieldCustom(
                        label: 'Password',
                        controller: contPassword,
                        isBorderLess: false,
                        obscured: true,
                        hint: 'Enter your password'),
                    // const HeightFull(),
                    // Align(
                    //   alignment: Alignment.centerRight,
                    //   child: TextButton(
                    //       onPressed: onForgotPassword,
                    //       child: const TextCustom(
                    //         'Forgot Password?',
                    //         color: Palette.grey,
                    //       )),
                    // ),
                    const HeightFull(multiplier: 2),
                    Consumer<AuthProvider>(
                      builder: (context, value, child) => Row(children: [
                        Expanded(
                            child: ButtonPrimary(
                          onPressed: onLogin,
                          label: 'Sign In',
                          isLoading: value.isLoading,
                        )),
                      ]),
                    ),
                    const HeightFull(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const TextCustom("Don't have an account?",
                            fontWeight: FontWeight.bold,
                            color: Palette.grey,
                            align: TextAlign.center),
                        TextButton(
                            onPressed: onRegister,
                            child: const TextCustom("SIGN UP")),
                      ],
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  void onLogin() {
    if (_formKey.hasError) return;
    Map<String, dynamic> params = {
      'username': contEmail.text,
      'password': contPassword.text
    };
    AuthRepository().login(context, params);
  }

  void onForgotPassword() {
    context.push(Routes.forgotPassword);
  }

  void onRegister() {
    context.go(Routes.register);
  }
}
