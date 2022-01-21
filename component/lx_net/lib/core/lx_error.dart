/// 网络异常
class LxNetError implements Exception {
  final int? code;
  final String? message;
  final dynamic data;

  LxNetError(this.code, this.message, {this.data});
}
