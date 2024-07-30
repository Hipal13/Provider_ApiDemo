import 'package:flutter/cupertino.dart';

import '../Models/datamodel.dart';
import '../Service/api_service.dart';

class DataClass extends ChangeNotifier {
  DataModel? post;
  bool loading = false;

  getPostData() async {
    loading = true;
    post = await ApiService().getSinglePostData();
    loading = false;

    notifyListeners();
  }
}