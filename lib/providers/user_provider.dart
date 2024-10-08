import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hong_hung_application/api/repository/admin_repo.dart';
import 'package:hong_hung_application/models/models/user.dart';

class UserProvider extends ChangeNotifier {
  List<User>? _users;
  bool _isLoading = true;

  List<User> get users => _users!;
  bool get isLoading => _isLoading;

  Future<void> fetchUsers() async {
    try {
      _users = await AdminRepo().getAllUser();
    } catch (e) {
      log(e.toString());
    }
    _isLoading = false;
    notifyListeners();
  }
}
