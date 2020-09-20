import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:userShowCase_app/models/user.dart';

class Services {
  static const String url = 'https://jsonplaceholder.typicode.com/users';
  static Future<List<User>> getUsers() async {
    
      final response = await http.get(url);
      if (200 == response.statusCode) {
        List<User> users = new List<User>();
        List<dynamic> x = jsonDecode(response.body);

        x.asMap().forEach((index, item){
          User z = User.fromJson(item);
          users.add(z);
        });
        return users;
      } else {
        
        throw Exception ("Error loading Albums");
      }
    
  }

}