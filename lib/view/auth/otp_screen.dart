import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:flutter_base/common/widgets/buttons.dart';
import 'package:flutter_base/common/widgets/text.dart';
import 'package:flutter_base/constants/size_unit.dart';
import 'package:flutter_base/constants/space.dart';
import 'package:flutter_base/providers/auth_provider.dart';
import 'package:flutter_base/theme/palette.dart';
import 'package:flutter_base/theme/theme_guide.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(SizeUnit.lg),
            child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextCustom('OTP',
                        fontWeight: FontWeight.w700, size: 20),
                    const HeightHalf(),
                    const TextCustom(
                      'Enter Correct OTP to register..',
                      fontWeight: FontWeight.bold,
                      color: Palette.grey,
                    ),
                    const HeightFull(multiplier: 2),
                    Pinput(
                      controller: otpController,
                      onCompleted: (val) {},
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      length: 4,
                      defaultPinTheme: PinTheme(
                        width: 50,
                        height: 50,
                        decoration: ThemeGuide.cardDecoration(),
                      ),
                    ),
                    const HeightFull(multiplier: 3),
                    Consumer<AuthProvider>(
                      builder: (context, value, child) => Row(children: [
                        Expanded(
                            child: ButtonPrimary(
                          onPressed: () {},
                          label: 'OTP',
                          isLoading: value.isLoading,
                        )),
                      ]),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
