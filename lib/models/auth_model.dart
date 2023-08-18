import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/api_constant.dart';

class AuthModel with ChangeNotifier {
  late String uid;
  late String phoneCountryCode;
  late String phoneNumber;
  late String name;
  late String emailAddress;
  late String gender;
  late String dob;
  late int countryId;
  late String token;



 Future<bool> getDataFromSP() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    String? data = s.getString("user_model");

    if(data == null){
      return false;
    }
    
    UserModel? _userModel = UserModel.fromMap(jsonDecode(data));
    uid = _userModel.uid;
    //store the usermodel data to 
    return _userModel != null;
  }



  




}
