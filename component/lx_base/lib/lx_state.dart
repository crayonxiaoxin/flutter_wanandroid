import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// dispose 时，忽略 setState()
/// 默认保持实例
abstract class LxState<T extends StatefulWidget> extends State<T>
    with AutomaticKeepAliveClientMixin {
  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    } else {
      if (kDebugMode) {
        print("lx_state: 本次 setState() 调用将不执行: ${toString()}");
      }
    }
  }

  @override
  bool get wantKeepAlive => true;
}
