import 'dart:ui';

import 'package:flutter/material.dart';

/// 高斯模糊
class LxBlur extends StatelessWidget {
  final double sigma;
  final Color color;
  final Widget? child;

  const LxBlur(
      {Key? key, this.sigma = 10, this.color = Colors.white54, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
      child: Container(
        color: color,
        child: child,
      ),
    );
  }
}
