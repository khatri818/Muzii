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
  late String name;
  late String emailAddress;
  late String gender;
  late String dob;
  late int countryId;
  late String token;

  //Loging user in
  Future<void> login(Map<String, String> loginData) async {
    try {
      final res = await http.post('$KBASE_URL_user/login' as Uri,
          headers: {'Content-Type': 'application/json'},
          body: json.encode(loginData));
      print('Response : $res');
      final statusCode = res.statusCode;
      final decodedRes = json.decode(res.body);
      if (statusCode >= 400) {
        throw HttpException(decodedRes['error_message']);
      }

      //If status code is 200
      setDataToLocalStorageLogin(decodedRes);
    } catch (err) {
      // ignore: use_rethrow_when_possible
      throw err;
    }
  } //End of login method

  //signup start
  Future<void> signup(Map<String, String> signupData) async {
    try {
      final res = await http.post('$KBASE_URL/adminSignUp' as Uri,
          headers: {'Content-Type': 'application/json'},
          body: json.encode(signupData));

      final statusCode = res.statusCode;
      final decodedRes = json.decode(res.body);

      if (statusCode >= 400) {
        throw HttpException(decodedRes['error_message']);
      }

      //If status code is 200
      setDataToLocalStorageSignup(decodedRes);
    } catch (err) {
      // ignore: use_rethrow_when_possible
      throw err;
    }
  } //End of signup method

  Future<void> setDataToLocalStorageLogin(
      Map<String, dynamic> decodedRes) async {
    phoneNumber = decodedRes['phoneNo'];
    phoneCountryCode = decodedRes['phoneCountryCode'];
    // userId = decodedRes['userID'].toString();
    //
    //  token = decodedRes['token'];
    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String userData = json.encode({
      'phoneNo': phoneNumber,
      'phoneCountryCode': phoneCountryCode,
      // 'userId': userId,
      //
      //  'token': token,
    });

    prefs.setString('userData', userData);
  }

  Future<void> setDataToLocalStorageSignup(
      Map<String, dynamic> decodedRes) async {
    userId = decodedRes['userID'].toString();

    phoneCountryCode = decodedRes['phoneCountryCode'];
    phoneNumber = decodedRes['phoneNumber'];

    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String userData = json.encode({
      'name': name,
      'emailAddress': emailAddress,
      'gender': gender,
      'DOB': dob,
      "countryId": countryId,
    });

    prefs.setString('userData', userData);
  }
}
