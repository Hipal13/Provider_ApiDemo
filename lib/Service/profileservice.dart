import 'dart:convert';

import '../Models/profilemodel.dart';
import 'package:http/http.dart' as http;

class ProfileServices {
  Future<List<Profile>> getAll() async {
    const url = 'https://fakestoreapi.com/products';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final todos = json.map((e) {
        return Profile(
          id: e['id'],
          name: e['title'],
          image: e['image'],
        );
      }).toList();
      return todos;
    }
    return [];
    // throw "Something went wrong";
  }
}