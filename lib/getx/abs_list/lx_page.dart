import 'package:flutter/material.dart';
import 'package:lx_base/lx_state.dart';

/// 通用保活页面
class LxPage extends StatefulWidget {
  final Widget child;

  const LxPage(this.child, {Key? key}) : super(key: key);

  @override
  _LxPageState createState() => _LxPageState();
}

class _LxPageState extends LxState<LxPage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }
}
