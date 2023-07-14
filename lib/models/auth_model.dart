import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/api_constant.dart';

class AuthModel with ChangeNotifier {
  late String userId;

  late String phoneCountryCode;
  late String phoneNumber;
  late String token;

  //Loging user in
  Future<void> login(Map<String, String> loginData) async {
    try {
      final res = await http.post('$KBASE_URL/login' as Uri,
          headers: {'Content-Type': 'application/json'},
          body: json.encode(loginData));

      final statusCode = res.statusCode;
      final decodedRes = json.decode(res.body);

      if (statusCode >= 400) {
        throw HttpException(decodedRes['error_message']);
      }

      //If status code is 200
      setDataToLocalStorage(decodedRes);
    } catch (err) {
      // ignore: use_rethrow_when_possible
      throw err;
    }
  } //End of login method

  Future<void> setDataToLocalStorage(Map<String, dynamic> decodedRes) async {
    userId = decodedRes['userID'].toString();

    phoneCountryCode = decodedRes['phoneCountryCode'];
    phoneNumber = decodedRes['phoneNumber'];
    token = decodedRes['token'];
    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String userData = json.encode({
      'userId': userId,
      'phoneCountryCode': phoneCountryCode,
      'phoneNumber': phoneNumber,
      'token': token,
    });

    prefs.setString('userData', userData);
  }
}
