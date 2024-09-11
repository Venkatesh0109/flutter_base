import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter_base/common/widgets/app_bars/app_bar_common.dart';
import 'package:flutter_base/common/widgets/buttons.dart';
import 'package:flutter_base/common/widgets/custom_scaffold.dart';
import 'package:flutter_base/common/widgets/text.dart';
import 'package:flutter_base/common/widgets/text_fields.dart';
import 'package:flutter_base/constants/size_unit.dart';
import 'package:flutter_base/constants/space.dart';
import 'package:flutter_base/providers/auth_provider.dart';
import 'package:flutter_base/repositories/auth_repository.dart';
import 'package:flutter_base/services/route/routes.dart';
import 'package:flutter_base/theme/palette.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController contEmail = TextEditingController();
  final TextEditingController contPassword = TextEditingController();
  final TextEditingController contConfirmPassword = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const AppBarCommon(),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(SizeUnit.lg),
            child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextCustom('Forgot Password',
                        fontWeight: FontWeight.w700, size: 20),
                    const HeightHalf(),
                    const TextCustom(
                      'You can change your password by entering the email and new password',
                      fontWeight: FontWeight.bold,
                      color: Palette.grey,
                    ),
                    const HeightFull(multiplier: 2),
                    TextFormFieldCustom(
                        label: 'Email ID',
                        controller: contEmail,
                        hint: 'Enter your email'),
                    const HeightFull(),
                    TextFormFieldCustom(
                        label: 'Password',
                        controller: contPassword,
                        obscured: true,
                        hint: 'Enter your password'),
                    const HeightFull(),
                    TextFormFieldCustom(
                        label: 'Confirm Password',
                        controller: contPassword,
                        obscured: true,
                        hint: 'Re-enter the password'),
                    // const HeightFull(),

                    const HeightFull(multiplier: 2),
                    Consumer<AuthProvider>(
                      builder: (context, value, child) => Row(children: [
                        Expanded(
                            child: ButtonPrimary(
                                onPressed: onSubmit,
                                label: 'Submit',
                                isLoading: value.isLoading)),
                      ]),
                    ),
                    const HeightFull(multiplier: 2),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  void onSubmit() {
    AuthRepository().navigateHome(context);
  }

  void onForgotPassword() {}

  void onRegister() {
    context.go(Routes.register);
  }
}
