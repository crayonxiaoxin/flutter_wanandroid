import 'package:flutter/material.dart';

/// 子widget 获取 父widget 对应比例的高度
typedef AdaptiveBuilder = Widget? Function(double height);

/// 响应式 Container
class AdaptiveContainer extends StatelessWidget {
  final Widget? child;
  final AdaptiveBuilder? builder;
  final double aspectRatio;

  const AdaptiveContainer(
      {Key? key, this.child, this.builder, this.aspectRatio = 16 / 9})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        var width = constraints.maxWidth;
        var height = width / aspectRatio;
        return SizedBox(
          width: width,
          height: height,
          child: builder == null ? child : builder!.call(height),
        );
      },
    );
  }
}
