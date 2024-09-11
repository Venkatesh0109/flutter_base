import 'package:flutter/material.dart';
import 'package:flutter_base/common/widgets/bottom_bar/bottom_bar.dart';
import 'package:flutter_base/common/widgets/custom_scaffold.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.child});
  final Widget child;
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((e) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: widget.child,
      bottomBar: const BottomNavBar(),
    );
  }
}
