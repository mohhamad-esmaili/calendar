import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class Auth with ChangeNotifier {
  String? username;
  String? key;
  int? otp;
  String? token;
  bool hasError = false;
  Map get userInfo {
    return {
      "token": token,
      "username": username,
      "key": key,
      "otp": otp,
    };
  }

  Future<void> login(String username, Function onDone) async {
    final url = Uri.parse('https://challenge.reval.me/v1/auth/login');

    try {
      final response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
            'accept': 'application/json',
          },
          body: json.encode({"username": username}));

      key = json.decode(response.body)['key'];
      this.username = username;

      if (response.statusCode == 200) {
        onDone();
      }
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> verify(int otp, Function onDone) async {
    final url = Uri.parse('https://challenge.reval.me/v1/auth/verify');
    try {
      final verifyResponse = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'accept': 'application/json',
        },
        body: json.encode({"username": username, "key": key, "otp": otp}),
      );
      token = json.decode(verifyResponse.body)["token"];

      if (verifyResponse.statusCode == 200) {
        onDone();
      } else {
        hasError = true;
      }
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
