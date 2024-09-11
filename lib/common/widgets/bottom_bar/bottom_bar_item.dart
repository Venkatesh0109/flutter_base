import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_base/common/widgets/bottom_bar/bottom_bar_data.dart';
import 'package:flutter_base/common/widgets/text.dart';
import 'package:flutter_base/constants/size_unit.dart';
import 'package:flutter_base/constants/space.dart';
import 'package:flutter_base/theme/Palette.dart';

// ignore: must_be_immutable
class BottomBarItem extends StatelessWidget {
  BottomBarItem({super.key, required this.data});
  final BottomBarDatum data;

  @override
  Widget build(BuildContext context) {
    isSelected = GoRouterState.of(context).uri.path == data.route;
    return InkWell(
      onTap: () => context.go(data.route),
      child: AnimatedContainer(
        padding: EdgeInsets.symmetric(
            vertical: SizeUnit.sm * .5,
            horizontal: isSelected ? SizeUnit.lg : SizeUnit.md),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        duration: const Duration(milliseconds: 400),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          image(data.image),
          const HeightHalf(),
          TextCustom(
            data.title,
            color: color,
            size: 11,
            fontWeight: FontWeight.w800,
          )
        ]),
      ),
    );
  }

  Widget image(String image) =>
      Image.asset(image, color: color, height: 25, width: 25);

  bool isSelected = false;

  Color? get color => isSelected ? Palette.primary : Palette.dark;
}
