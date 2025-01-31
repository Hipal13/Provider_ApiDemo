import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import '../Models/datamodel.dart';
import 'package:http/http.dart' as http;

class ApiService{
  Future<DataModel?> getSinglePostData() async {
    DataModel? result;
    try {
      final response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/posts/4"),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },);
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        result = DataModel.fromJson(item);
      } else {
        print("error");
      }
    } catch (e) {
      log(e.toString());
    }
    return result;
  }
}