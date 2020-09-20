import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import "geo.dart";


@JsonSerializable()
class Address {
    Address({this.street, this.suite, this.city, this.zipcode});
    String street;
    String suite;
    String city;
    String zipcode;
  
  
    Address.fromJson(Map<String,dynamic> json) :
      street = json["street"],
      suite = json["suite"],
      city = json["city"],
      zipcode = json["zipcode"];
     

    Map<String, dynamic> toJson() =>
      {
        'street' : street,
        'suite' : suite,
        'city' : city,
        'zipcode' : zipcode,
        
      };

    static fromString(String stringAddress){
        var items = stringAddress.split(",");
        return new Address(
          street: items[0],
          suite :items[1],
          city : items[2],
          zipcode: items[3]
        );
    }

    toString(){
      return(this.street + "," + this.suite + "," + this.city +"," + this.zipcode);
    }
     
}

