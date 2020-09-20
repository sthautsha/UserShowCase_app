import 'package:flutter/material.dart';
import 'package:userShowCase_app/screens/loading_screen.dart';

void main(){
  runApp(new MaterialApp(
    //home: new UserListDemo(),
    home: new HomePage(),
    
  ));
}
class HomePage extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    // TO DO: implement build
    
    return Scaffold(
      
      body:MainFetchData(),
    );
    //return formTag(); 
    
  }

}


