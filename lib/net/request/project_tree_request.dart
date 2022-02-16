import 'package:flutter_wan_android/net/request/tree_request.dart';

class ProjectTreeRequest extends TreeRequest {
  @override
  String path() {
    return "project/tree/json";
  }
}
