import 'package:flutter/material.dart';

class CustomScrollWidget extends StatelessWidget {
  final Widget child;
  
  const CustomScrollWidget({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: child,
        ),
      );
    });
  }
}
