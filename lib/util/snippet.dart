import 'package:flutter/services.dart';

class Snippet {
  static Future<String> get(String name) async {
    return await rootBundle.loadString('snippet/$name.snippet');
  }
}
