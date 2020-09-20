import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class Album {
    Album(this. albumId, this.id, this.title, this.url, this. thumbnailUrl);

    num albumId;
    num id;
    String title;
    String url;
    String thumbnailUrl;
    
    Album.fromJson(Map<String,dynamic> json) :
    albumId = json["albumId"],
    id = json["id"],
    title = json["title"],
    url = json["url"],
    thumbnailUrl = json["thumbnailUrl"];

     Map<String, dynamic> toJson() =>
      {
        'albumId' : albumId,
        'id' : id,
        'title' : title,
        'url' : url,
        'thumbnailUrl' : thumbnailUrl,
      };

    
}
