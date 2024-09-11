import 'package:flutter/material.dart';
import 'package:flutter_base/theme/palette.dart';

class DividerCustom extends Divider {
  /// The lineColor to use when painting the line of [Divider]
  /// The default color is `Colors.grey.shade300`
  final Color? lineColor;

  /// Creates a customized [Divider]
  const DividerCustom({
    super.key,
    this.lineColor,
    super.thickness,
  }) : super(color: lineColor ?? Palette.secondary);
}
