import 'dart:developer';
import 'package:deep_linking/screens/green_screen.dart';
import 'package:deep_linking/screens/pink_screen.dart';
import 'package:deep_linking/screens/red_screen.dart';
import 'package:deep_linking/services/context_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uni_links/uni_links.dart';

class UniServices {
  static String _code = '';
  static String get code => _code;
  static bool get hasCode => _code.isNotEmpty;

  static void reset() => _code = '';
  static init() async {
    try {
      final Uri? uri = await getInitialUri();
      uniHandler(uri);
    } on PlatformException {
      log("Failed to receive the code");
    } on FormatException {
      log("Wrong format code received");
    }

    uriLinkStream.listen((Uri? uri) async {
      uniHandler(uri);
    }, onError: (error) {
      log("OnUriLink Error: $error");
    });
  }

  static uniHandler(Uri? uri) {
    if (uri == null || uri.queryParameters.isEmpty) return;

    Map<String, String> param = uri.queryParameters;
    String receivedCode = param['code'] ?? '';

    if (receivedCode == "green") {
      Navigator.push(ContextUtility.context!,
          MaterialPageRoute(builder: (_) => const GreenScreen()));
    } else if (receivedCode == "red") {
      Navigator.push(ContextUtility.context!,
          MaterialPageRoute(builder: (_) => const RedScreen()));
    } else {
      Navigator.push(ContextUtility.context!,
          MaterialPageRoute(builder: (_) => const PinkScreen()));
    }
  }
}
