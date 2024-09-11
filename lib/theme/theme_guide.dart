import 'package:flutter/material.dart';
import 'package:flutter_base/constants/size_unit.dart';
import 'package:flutter_base/theme/palette.dart';

class ThemeGuide {
  /// Primary Card Decoration
  static BoxDecoration cardDecoration(
          {Color? color,
          Gradient? gradient,
          Border? border,
          DecorationImage? image,
          BorderRadius? borderRadius}) =>
      BoxDecoration(
        color: color ?? Palette.pureWhite,
        gradient: gradient,
        border: border,
        image: image,
        borderRadius:
            borderRadius ?? BorderRadius.circular(SizeUnit.borderRadius),
        boxShadow: color == Colors.transparent ? null : primaryShadow,
      );

  /// Primary Dark Box Shadow
  static List<BoxShadow>? primaryShadow = [
    BoxShadow(
        color: Palette.grey.withOpacity(.3), blurRadius: .5, spreadRadius: .5)
  ];

  /// Primary Text Shadow
  static List<Shadow>? primaryTextShadow = [
    Shadow(
        offset: const Offset(0.0, 0.0),
        blurRadius: 3.0,
        color: Colors.black.withOpacity(.8))
  ];

  /// Focused Outlined Input Border
  static OutlineInputBorder focussedBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Palette.primary, width: 1.5),
      borderRadius: borderRadius());

  /// default Outlined Input Border
  static OutlineInputBorder defaultBorder({Color? color}) => OutlineInputBorder(
      borderSide: BorderSide(color: color ?? Colors.transparent, width: 1.5),
      borderRadius: borderRadius());

  /// error Outlined Input Border
  static OutlineInputBorder errorBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Palette.red, width: 1.5),
      borderRadius: borderRadius());

  /// Border Radius
  static BorderRadius borderRadius({double radius = SizeUnit.borderRadius}) =>
      BorderRadius.circular(radius);

  ///  Radius
  static Radius radius = const Radius.circular(SizeUnit.borderRadius);
}
