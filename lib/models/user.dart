import 'package:json_annotation/json_annotation.dart';
import "package:userShowCase_app/models/address.dart";

@JsonSerializable()
class User {
    User(this.id, this.name,this.username,
        this.email,this.address,this.phone,this.website,);

    num id;
    String name;
    String username;
    String email;
    String phone;
    String website;
    String address;
    
    User.fromJson(Map<String,dynamic> json) :
      id = json["id"],
      name = json["name"].toString(),
      username = json["username"].toString(),
      email = json["email"].toString(),
      address = Address.fromJson(json["address"]).toString(),
      phone = json["phone"].toString(),
      website = json["website"].toString();

    Map<String, dynamic> toJson() =>
      {
        'id' : id,
        'name' : name,
        'username' : username,
        'email' : email,
        'address' : address,
        'phone' : phone,
        'website' :website
      };

    createTabeQuerry(){

    }

    insertQuerry(){
       return "Insert into User (id NUM PRIMARY KEY, name TEXT, username TEXT, email TEXT, address TEXT, phone TEXT, website TEXT )";
     }
    
}
