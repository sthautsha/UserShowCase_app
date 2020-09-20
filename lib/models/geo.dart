import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class Geo {
    Geo(this.lat, this.lng);

    String lat;
    String lng;
    
    Geo.fromJson(Map<String,dynamic> json) :
      lat = json["lat"],
      lng = json["lng"];

    Map<String, dynamic> toJson() =>
      {
        'lat' : lat,
        'lng' : lng
      };
}
