import 'package:flutter/material.dart';

class ResponsiveCenterBox extends StatelessWidget {
  final Widget child;
  final double? width;
  const ResponsiveCenterBox({
    super.key,
    required this.child,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final maxWidth = screenWidth > 600 ? width ?? 600 : double.infinity;

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: maxWidth,
        ),
        child: child,
      ),
    );
  }
}
