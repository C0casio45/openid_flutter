library openid_flutter;

import 'package:http/http.dart' as http;
import 'package:jose/jose.dart';
import 'package:openid_flutter/src/repository/repository.dart';
import 'src/models/models.dart';
import 'src/openid_impl_stub.dart'
    if (dart.library.io) 'openid_io_service.dart'
    if (dart.library.js) 'openid_browser_service.dart';

part "src/openid_flow.dart";
part "src/openid_issuer.dart";
part "src/openid.dart";

abstract class OpenidImpl {
  static late OpenidImpl _instance;

  static OpenidImpl get instance {
    _instance;
    return _instance;
  }
}
