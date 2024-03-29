import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:firstcalendar/models/user.dart';
import 'package:firstcalendar/resources/auth_method.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final AuthMethods _authMethods = AuthMethods();

  User get getUser => _user!;
  //User? get getUser => _user;

  Future<void> refreshUser() async {
    User user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
