import 'package:flutter/material.dart';
import 'package:flutter_base/common/widgets/text.dart';
import 'package:flutter_base/constants/size_unit.dart';
import 'package:flutter_base/constants/space.dart';
import 'package:flutter_base/theme/palette.dart';

class Heading extends StatelessWidget {
  const Heading(
    this.value, {
    super.key,
    this.onSeeAll,
  });
  final String value;
  final VoidCallback? onSeeAll;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SizeUnit.lg),
      child: Row(children: [
        Expanded(
          child: TextCustom(value,
              color: Palette.dark, fontWeight: FontWeight.w700, size: 16),
        ),
        if (onSeeAll != null) ...[
          const WidthFull(),
          TextButton(
            onPressed: onSeeAll,
            child: const Row(
              children: [
                TextCustom('SEE ALL'),
                Icon(Icons.chevron_right),
              ],
            ),
          )
        ]
      ]),
    );
  }
}
