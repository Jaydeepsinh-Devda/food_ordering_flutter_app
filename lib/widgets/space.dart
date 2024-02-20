import 'package:flutter/material.dart';

class Space extends StatelessWidget {
  final double? width;
  final double? height;

  const Space({
    this.width,
    this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
    );
  }
}
