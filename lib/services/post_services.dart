// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:userShowCase_app/models/post.dart';
// import 'package:userShowCase_app/models/posts.dart';



// class PostService{

//   /*
//    * Makes api call returns User Posts
//    */
//   static List<Post> posts;
//   static const String serverEndpoint = 
//     "https://jsonplaceholder.typicode.com/users";
//   static Future<Posts> loadPosts(int userId) async {
//     try{
//       var url ="$serverEndpoint/$userId/posts";
//       final response = await http.get(url);
//       if (response.statusCode == 200){
//         Posts posts =parsePosts(response.body);
//         return posts;
//       } else {
//         Posts posts = new Posts();
//           posts.posts = [];
//           return posts;
//       }
//     }catch (e){
//       Posts posts =new Posts();
//       posts.posts =[];
//       return posts;
//     }
//   }

//   static Posts parsePosts(String responseBody) {
//     final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
//     List<Post> posts =
//         parsed.map<Post>((json) => Post.fromJson(json)).toList();
//     Posts p = new Posts();
//     p.posts = posts;
//     return p;
//   }
  
// }

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:userShowCase_app/models/post.dart';

const String serverEndpoint = 
  "https://jsonplaceholder.typicode.com/users";

class Services {


  static Future<List<Post>> getPosts(int userId) async {

      var url ="$serverEndpoint/$userId/posts";
      List<Post> posts = new List<Post>();
      final response = await http.get(url);
      if (200 == response.statusCode) {
      
        List<dynamic> x = jsonDecode(response.body);

        x.asMap().forEach((index, item){
          Post z = Post.fromJson(item);
          posts.add(z);
        });
        return posts;
      } else {
        
        throw Exception ("Error loading Albums");
      }
    
  }

}