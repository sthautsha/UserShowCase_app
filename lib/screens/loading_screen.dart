
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:userShowCase_app/models/address.dart';
import 'package:userShowCase_app/models/user.dart';
import 'package:userShowCase_app/screens/post_screen.dart';
import 'package:userShowCase_app/services/user_services.dart';


class MainFetchData extends StatefulWidget {
  
  @override
  _MainFetchDataState createState() => _MainFetchDataState();
}

class _MainFetchDataState extends State<MainFetchData> {
  List<User> list = List();
  var isLoading = false;
  @override
  void initState() {// called when initilization state and load the componneets
    super.initState(); 
    _loadPosts();
    
  }

   _loadPosts() async {
     setState(() {
       isLoading = true;
     });
     final results = await Services.getUsers();
       setState(() {
         isLoading = false;
         list = results;
       });
   }
  // _loadPosts() async {
  //   setState(() {
  //     isLoading = true;
  //   });

  //   var apiProvider = UserApiProvider();
  //   await apiProvider.getAllUsers();
  //   print(apiProvider.getAllUsers());
  //   // wait for 2 seconds to simulate loading of data
  //   await Future.delayed(const Duration(seconds: 2));

  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  Widget userCards(int index) {
    return Container(
      padding: new EdgeInsets.only(left:10.0, right: 10.0, top:20.0, bottom: 10.0),
      child: Card(
        shadowColor: Colors.grey,
        elevation: 4,
        color: Hexcolor("#313131"),
          child: Container(
            padding: new EdgeInsets.all(12.0),
            child: Stack(
              children: <Widget>[
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        list[index].name,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text( "username: "+ list[index].username.toLowerCase(),
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      GestureDetector( 
                        onTap: () {
                            int userId = list[index].id;
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                            return new PostPage(
                              userId: userId
                                  );
                              }));
                            },
                          child: Container(
                              
                              child: Chip(
                                label: Text('View Post'),
                                shadowColor: Colors.grey,
                                backgroundColor: Hexcolor("#03DAC5"),
                                elevation: 10,
                                autofocus: true,
                              )),
                        ),
                    ],
                  )
                ),
                Positioned(    
                  right: 1.0,
                  child:Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Container(
                          child:Row(
                            children:  <Widget>[
                              Icon(
                                  Icons.phone,
                                  color: Colors.grey,
                                  size: 12.0,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                list[index].phone.toLowerCase(),
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ]
                          )
                        ),
                        new Container(
                          child:Row(
                            children:  <Widget>[
                              Icon(
                                  Icons.mail,
                                  color: Colors.grey,
                                  size: 12.0,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                list[index].email.toLowerCase(),
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ]
                          )
                        ),
                        new Container(
                          child:Row(
                            children:  <Widget>[
                              Icon(
                                  Icons.location_on,
                                  color: Colors.grey,
                                  size: 12.0,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                (Address.fromString(list[index].address)).city,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ]
                          )
                        ),
                        

                      ]
                    )
                  )  
                )
              ],
            )
          )  
    )
    );
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Show Case App", style: TextStyle(fontSize: 20
        ),),
        centerTitle: true,     
        backgroundColor: Hexcolor("#313131"), 
      ),
      backgroundColor: Hexcolor("#121212"),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          :ListView.builder(
             itemCount: list.length,
             itemBuilder: (BuildContext context, int index) {
              
               return userCards(index);
             },
           ),
    );
  }

  // _buildUserListView() {
  //   return FutureBuilder(
  //     future: DBProvider.db.getAllUsers(),
  //     builder: (BuildContext context, AsyncSnapshot snapshot) {
  //       if (!snapshot.hasData) {
  //         return Center(
  //           child: CircularProgressIndicator(),
  //         );
  //       }else {
  //         return ListView.separated(
  //           separatorBuilder: (context, index) => Divider(
  //             color: Colors.black12,
  //           ),
  //           itemCount: snapshot.data.length,
  //           itemBuilder: (BuildContext context, int index) {
  //             return ListTile(
  //               leading: Text(
  //                 "${index + 1}",
  //                 style: TextStyle(fontSize: 20.0),
  //               ),
  //               title: Text(
  //                   "Name: ${snapshot.data[index].name} "),
  //               subtitle: Text('EMAIL: ${snapshot.data[index].email}'),
  //             );
  //           }
  //         );
  //       }
  //     }
  //   );
  // }
}