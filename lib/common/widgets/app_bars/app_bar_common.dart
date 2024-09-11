import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_base/common/widgets/buttons.dart';
import 'package:flutter_base/common/widgets/text.dart';
import 'package:flutter_base/constants/size_unit.dart';
import 'package:flutter_base/constants/space.dart';
import 'package:flutter_base/theme/palette.dart';

class AppBarCommon extends StatelessWidget {
  const AppBarCommon({
    super.key,
    this.title = '',
    this.subTitle = '',
    this.onRefresh,
    this.safeArea = true,
    this.automaticLeadingImplies = true,
    this.actions = const [],
    this.isStacked = false,
    this.isText = false,
  });
  final String title, subTitle;
  final VoidCallback? onRefresh;
  final bool safeArea;
  final bool automaticLeadingImplies, isStacked, isText;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          child: Container(
            padding: const EdgeInsets.all(SizeUnit.lg),
            child: Row(children: [
              if (automaticLeadingImplies) ...[
                if (isStacked)
                  SecondaryIconButton(context,
                      onPressed: () => context.pop(),
                      icon: const Icon(Icons.arrow_back_ios_new))
                else
                  InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back_ios_new,
                          color: Palette.dark)),
                const WidthFull()
              ],
              if (isText) ...[
                TextCustom(title,
                    maxLines: 1, size: 18, fontWeight: FontWeight.w800),
              ],
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextCustom(title,
                      maxLines: 1, size: 18, fontWeight: FontWeight.w800),
                  if (subTitle.isNotEmpty)
                    TextCustom(subTitle,
                        color: Palette.secondary,
                        size: 12,
                        fontWeight: FontWeight.bold),
                ],
              )),
              ...actions
            ]),
          ),
        ),
      ],
    );
  }
}
