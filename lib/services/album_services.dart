import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:userShowCase_app/models/album.dart';

const String serverEndpoint = 
  "https://jsonplaceholder.typicode.com/users";

class AlbumServices {


  static Future<List<Album>> getAlbums(int userId) async {

      var url ="$serverEndpoint/$userId/albums";
      List<Album> albums = new List<Album>();
      final response = await http.get(url);
      if (200 == response.statusCode) {
      
        List<dynamic> x = jsonDecode(response.body);

        x.asMap().forEach((index, item){
          Album z = Album.fromJson(item);
          albums.add(z);
        });
        return albums;

        //print(posts);
      } else {
        
        throw Exception ("Error loading Albums");
      }
    
  }

}
