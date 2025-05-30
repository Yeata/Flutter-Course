// TODO-2: Import http and dart:convert
import 'package:http/http.dart';
import 'dart:convert';

class UsersService {
  static final UsersService _singleton = UsersService._internal();
  UsersService._internal();
  static UsersService get instance => _singleton;
  final String baseURL = 'https://681835da5a4b07b9d1ce39fc.mockapi.io';
  // TODO-3: Add base URL

  Future<List<dynamic>> getUsers() async {
    Response response = await get(Uri.parse('$baseURL/users'));
    if (response.statusCode == 200) {
      print('Response: ${response.body}');
      return jsonDecode(response.body);
    } else {
      throw response.statusCode;
    }
  }

  Future<dynamic> updateUser(String id, Map<String, dynamic> data) async {
    Response response = await patch(Uri.parse('$baseURL/users/$id'), body: data);
       if (response.statusCode == 200) {
        print('Response: ${response.body}');
        return jsonDecode(response.body);
      } else {
        throw response.statusCode;
      }
  }

  Future<dynamic> createUser(Map<String, dynamic> data) async {
    Response response = await post(Uri.parse('$baseURL/users'), body: data);
    if (response.statusCode == 201) {
      print('Response: ${response.body}');
      return jsonDecode(response.body);
    } else {
      throw response.statusCode;
    }
  }

  Future<dynamic> deleteUser(String id) async {
    Response response = await delete(Uri.parse('$baseURL/users/$id'));
    if (response.statusCode == 200) {
      print('Response: ${response.body}');
      return jsonDecode(response.body);
    } else {
      throw response.statusCode;
    }
  }
}
