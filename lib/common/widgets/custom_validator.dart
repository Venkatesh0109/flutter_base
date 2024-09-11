import 'package:flutter/material.dart';
import 'package:flutter_base/common/widgets/text.dart';
import 'package:flutter_base/constants/size_unit.dart';
import 'package:flutter_base/theme/palette.dart';

class CustomValidator extends StatelessWidget {
  const CustomValidator(this.value, {super.key, required this.isShow});
  final String value;
  final bool isShow;
  @override
  Widget build(BuildContext context) {
    if (!isShow) return const SizedBox();
    return Padding(
      padding: const EdgeInsets.only(top: SizeUnit.sm, left: SizeUnit.md),
      child: TextCustom(
        value,
        size: 13,
        color: Palette.red,
      ),
    );
  }
}
