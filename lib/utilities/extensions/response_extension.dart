import 'package:flutter_base/models/response.dart';
import 'package:flutter_base/utilities/message.dart';

extension ResponseExtension on ResponseData {
  bool get hasError {
    int statusCode = this.statusCode;
    if (statusCode == 200 || statusCode == 201) {
      return false;
    }
    if (statusCode == 401) return true;
    String errMsg = data['message'] ?? data['error'] ?? '';
    if (errMsg.isNotEmpty) showMessage(errMsg);
    return true;
  }
}
