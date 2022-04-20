import 'package:flutter_test/flutter_test.dart';

import 'package:openid_flutter/openid_impl.dart';
import 'dart:convert';
import 'dart:io';

import 'issuer_model.dart';

void main() {
  late Map<String, dynamic> data;

  test('test OIDC discovering', () async {
    final oidc = await Issuer.discover(IssuerModel.google().document_discovery);
    // expect(calculator.addOne(2), 3);
    // expect(calculator.addOne(-7), -6);
    // expect(calculator.addOne(0), 1);
  });
}
