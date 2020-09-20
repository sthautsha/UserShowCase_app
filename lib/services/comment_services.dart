import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:userShowCase_app/models/comment.dart';

const String commentServerEndPoint = "https://jsonplaceholder.typicode.com/posts";

class CommentServices {


  static Future<List<Comment>> getComments(int postId) async {

      var url ="$commentServerEndPoint/$postId/comments";
      List<Comment> comments = new List<Comment>();
      final response = await http.get(url);
      if (200 == response.statusCode) {
      
        List<dynamic> x = jsonDecode(response.body);
        print(x);
        x.asMap().forEach((index, item){
          print(item);
          Comment z = Comment.fromJson(item);
          comments.add(z);
          print(z);
        });
        
        return comments;

        //print(posts);
      } else {
        
        throw Exception ("Error loading Albums");
      }
    
  }

}