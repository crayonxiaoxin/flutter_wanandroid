import 'package:flutter/material.dart';

/// 自动增长的值
class AnimatedCount extends ImplicitlyAnimatedWidget {
  final int value;
  final int begin;
  final TextStyle? style;

  const AnimatedCount(
      {Key? key,
      required this.value,
      this.style,
      this.begin = 0,
      duration = const Duration(milliseconds: 500)})
      : super(key: key, duration: duration);

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() =>
      _AnimatedCountState();
}

class _AnimatedCountState extends AnimatedWidgetBaseState<AnimatedCount> {
  IntTween? _count;

  @override
  Widget build(BuildContext context) {
    return Text("${_count?.evaluate(animation)}", style: widget.style);
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _count = visitor(_count, widget.value, (value) => IntTween(begin: value))
        as IntTween?;
  }
}
