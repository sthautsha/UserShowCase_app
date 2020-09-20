import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Post {
    Post( this.userId, this.id, this.title, this.body);

    num userId;
    num id;
    String title;
    String body;
    
    Post.fromJson(Map<String,dynamic> json) :
      userId = json["userId"],
      id = json["id"],
      title = json["title"],
      body = json ["body"];
    
    Map<String, dynamic> toJson() =>
    {
      'userId' : userId,
      'id' : id,
      'title' : title,
      'body' : body
    };



}
