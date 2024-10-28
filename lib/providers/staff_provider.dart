import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hong_hung_application/api/repository/admin_repo.dart';
import 'package:hong_hung_application/models/models/staff_list.dart';

class StaffProvider extends ChangeNotifier {
  List<StaffList>? _staffs;
  bool _isLoading = true;

  List<StaffList> get staffs => _staffs!;
  bool get isLoading => _isLoading;

  Future<void> fetchStaffList() async {
    try {
      _staffs = await AdminRepo().getAllStaff();
    } catch (ex) {
      log(ex.toString());
    }
    _isLoading = false;
    notifyListeners();
  }

  set staffs(List<StaffList> staff) {
    _staffs = staff;
    notifyListeners();
  }
}
