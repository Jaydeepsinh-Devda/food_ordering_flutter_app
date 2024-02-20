import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final Widget? leading;
  final Widget? middle;
  final Widget? trailing;
  final Color? trailingIconBackgroundColor;
  final VoidCallback? onClick;

  const CustomAppBar({
    this.leading,
    this.middle,
    this.trailing,
    this.trailingIconBackgroundColor = const Color(0xFFF5F5F5),
    this.onClick,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _leading(),
        ),
        if (middle != null) middle!,
        Expanded(
          child: _trailing(),
        )
      ],
    );
  }

  Widget _leading() => Align(
        alignment: Alignment.centerLeft,
        heightFactor: 1,
        child: leading,
      );

  Widget _trailing() => Align(
        alignment: Alignment.centerRight,
        heightFactor: 1,
        child: _trailingIconButton(),
      );

  Widget _trailingIconButton() => Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: trailingIconBackgroundColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: IconButton(
          iconSize: 24,
          onPressed: onClick,
          icon: SizedBox(child: trailing),
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(
              const Color(0xFF061737),
            ),
          ),
        ),
      );
}
