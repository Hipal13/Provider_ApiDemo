import 'package:flutter/cupertino.dart';

import '../Models/profilemodel.dart';
import '../Service/profileservice.dart';

class ProfileProvider extends ChangeNotifier {
  final _service = ProfileServices();
  bool isLoading = false;
  List<Profile> _profiles = [];
  List<Profile> get Profiles => _profiles;

  Future<void> getAllProfile() async {
    isLoading = true;
    notifyListeners();

    final response = await _service.getAll();

    _profiles = response;
    isLoading = false;
    notifyListeners();
  }

  Profile findById(int id) {
    return _profiles.firstWhere((ctx) => ctx.id == id);
  }
}