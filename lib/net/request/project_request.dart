import 'package:flutter_wan_android/net/request/base_request.dart';
import 'package:lx_net/request/lx_base_request.dart';

class ProjectRequest extends BaseRequest {
  int page;
  int projectId;

  ProjectRequest(this.page, this.projectId);

  @override
  HttpMethod httpMethod() {
    return HttpMethod.GET;
  }

  @override
  bool needLogin() {
    return false;
  }

  @override
  String path() {
    return "project/list/$page/json";
  }
}
