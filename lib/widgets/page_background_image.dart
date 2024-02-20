import 'package:flutter/material.dart';

class PageBackgroundImage extends StatelessWidget {
  final Widget child;

  const PageBackgroundImage({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover),
      ),
      child: child,
    );
  }
}
