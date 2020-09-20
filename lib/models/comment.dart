import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Comment {
    Comment( this.postId, this.id, this.name, this.email, this.body);

    num postId;
    num id;
    String name;
    String email;
    String body;
    
    Comment.fromJson(Map<String,dynamic> json) :
      postId = json["postId"],
      id = json["id"],
      name = json["name"],
      email = json["email"],
      body = json ["body"];

    
    Map<String, dynamic> toJson() =>
    {
      'postId' : postId,
      'id' : id,
      'name' : name,
      'email' : email,
      'body' : body,
    };



}
