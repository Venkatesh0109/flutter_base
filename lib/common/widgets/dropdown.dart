import 'package:flutter/material.dart';
import 'package:flutter_base/common/widgets/text.dart';
import 'package:flutter_base/constants/size_unit.dart';
import 'package:flutter_base/theme/palette.dart';
import 'package:flutter_base/theme/theme_guide.dart';

class DropDownCustom<T> extends DropdownButtonFormField<T> {
  /// Optional text that describes the input field.
  final String? labelText;

  final bool isNoBorder;
  final EdgeInsets? contentPadding;
  final bool isFilled;

  /// A [DropDownCustom] that contains a [DropdownButton].
  ///
  /// This is a convenience widget that wraps a [DropdownButton] widget in a
  /// [FormField].
  ///
  /// A [Form] ancestor is not required. The [Form] allows one to
  /// save, reset, or validate multiple fields at once. To use without a [Form],
  /// pass a [GlobalKey] to the constructor and use [GlobalKey.currentState] to
  /// save or reset the form field.
  DropDownCustom({
    super.key,
    super.value,
    required super.items,
    required super.onChanged,
    this.labelText,
    this.contentPadding,
    this.isFilled = true,
    this.isNoBorder = false,
  }) : super(
          validator: (input) {
            if (value == null && (labelText ?? '').isNotEmpty) {
              return "$labelText is required";
            }

            return null;
          },
          icon: const Icon(Icons.expand_more_rounded),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              errorStyle: const TextStyle(fontSize: 13, color: Palette.red),
              filled: isFilled,
              labelStyle: const TextStyle(color: Colors.grey, fontSize: 14),
              labelText: labelText,
              contentPadding:
                  contentPadding ?? const EdgeInsets.all(SizeUnit.lg),
              border: isNoBorder ? InputBorder.none : ThemeGuide.focussedBorder,
              errorBorder:
                  isNoBorder ? InputBorder.none : ThemeGuide.errorBorder,
              enabledBorder:
                  isNoBorder ? InputBorder.none : ThemeGuide.defaultBorder(),
              focusedBorder:
                  isNoBorder ? InputBorder.none : ThemeGuide.focussedBorder),
        );
}

Widget dropdownButton(
    var value, String hint, List list, String key, Function(Object?)? onChanged,
    {bool isDisabled = false, height}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        decoration: BoxDecoration(
            color: Palette.pureWhite,
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            border: Border.all(color: Colors.grey.withOpacity(.3))),
        height: height ?? 44,
        child: DropdownButtonFormField(
            isExpanded: true,
            value: value,
            focusColor: Palette.grey,
            decoration: InputDecoration(
                filled: false,
                counterText: "",
                hintText: hint,
                contentPadding: const EdgeInsets.only(left: 16),
                errorStyle: const TextStyle(fontSize: 13),
                hintStyle: TextStyle(
                    // height: list.isEmpty ? 3.5 : null,
                    height: hint.isNotEmpty ? 3.5 : null,
                    fontSize: 13,
                    color: Palette.grey.withOpacity(.8),
                    fontWeight: FontWeight.w400),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide:
                        BorderSide(width: .5, color: Colors.transparent)),
                fillColor: Palette.pureWhite,
                suffixIcon: const Icon(Icons.expand_more, color: Palette.grey)),
            iconDisabledColor: Palette.pureWhite,
            iconEnabledColor: Palette.pureWhite,
            items: list.map((items) {
              return DropdownMenuItem(
                  value: items,
                  enabled: !isDisabled,
                  child: TextCustom(
                    '${items[key] ?? ''}',
                    color: isDisabled ? Palette.dark : null,
                    size: 14,
                    fontWeight: FontWeight.w400,
                  ));
            }).toList(),
            onChanged: onChanged),
      ),
      const SizedBox(height: 10),
    ],
  );
}
