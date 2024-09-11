import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter_base/common/widgets/buttons.dart';
import 'package:flutter_base/common/widgets/loaders.dart';
import 'package:flutter_base/common/widgets/text.dart';
import 'package:flutter_base/constants/size_unit.dart';
import 'package:flutter_base/constants/space.dart';
import 'package:flutter_base/providers/auth_provider.dart';
import 'package:flutter_base/repositories/auth_repository.dart';
import 'package:flutter_base/theme/palette.dart';
import 'package:flutter_base/theme/theme_guide.dart';

class LogoutScreen extends StatefulWidget {
  const LogoutScreen({super.key});

  @override
  State<LogoutScreen> createState() => _LogoutScreenState();
}

class _LogoutScreenState extends State<LogoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.dark.withOpacity(.2),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: ThemeGuide.cardDecoration(),
            padding: const EdgeInsets.all(SizeUnit.lg),
            margin: const EdgeInsets.all(SizeUnit.lg),
            child: Column(children: [
              const TextCustom('Logout', fontWeight: FontWeight.w600, size: 16),
              const HeightHalf(),
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextCustom(
                    "Are you sure you want to logout, it will clear all your local data",
                    align: TextAlign.center,
                    color: Palette.grey,
                  )),
              const HeightFull(),
              Consumer<AuthProvider>(
                builder: (context, value, child) => value.isLoading
                    ? const Center(child: Loader())
                    : Row(
                        children: [
                          Expanded(
                              child: ButtonSecondary(
                                  onPressed: () => context.pop(),
                                  label: "Cancel")),
                          const WidthFull(),
                          Expanded(
                              child: ButtonPrimary(
                                  onPressed: () =>
                                      AuthRepository().logout(context),
                                  label: "Logout")),
                        ],
                      ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
