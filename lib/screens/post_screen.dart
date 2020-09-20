
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:userShowCase_app/models/post.dart';
import 'package:userShowCase_app/screens/comment_screen.dart';
import 'package:userShowCase_app/services/post_services.dart';

class PostPage extends StatefulWidget {
   int userId;
   PostPage({Key key, this.userId}): super(key:key);
  @override
  _PostPageState createState() => _PostPageState(userId: this.userId);
}

class _PostPageState extends State<PostPage> {
  List<Post> posts = new List<Post>();
  int userId;
  var isLoading = false;
  //final VoidCallback onTapCallback;
 _PostPageState({this.userId});

  @override
  void initState() {
    super.initState(); 
    _loadPosts();
  }

  void _loadPosts() async {
    setState(() {
      isLoading = true;
    });
      final results = await Services.getPosts(this.userId);
      
      this.setState(() {
          isLoading = false;
          posts = results;
      });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Show Case App", style: TextStyle(fontSize: 20
        ),),
        centerTitle: true,     
        backgroundColor: Hexcolor("#313131"), 
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          }
        ),
      ),
      backgroundColor: Hexcolor("#121212"),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
          )
          :ListView.builder(
          itemCount: posts.length,
          itemBuilder: (BuildContext context, int index){
              return postCards(index);
          },
      )
    );
  }
  
  Widget postCards(int index){
    return Container(
      
      
      padding: new EdgeInsets.only(left:10.0, right: 10.0, bottom: 10.0, top:20.0),
      child: Card(
        shadowColor: Colors.grey,
        elevation: 4,
        color: Hexcolor("#313131"),
          child: Container(
            padding: new EdgeInsets.all(20.0),
            child: Stack(
              children: <Widget>[
                Container(
                  // width: 100,
                  // height: 100,
                  // color:Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        posts[index].title, 
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text( posts[index].body.toLowerCase(),
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                        ),
                        textAlign:TextAlign.justify ,
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Divider(
                        color:Colors.grey,

                      ),
                      GestureDetector( 
                        onTap: () {
                            int postId = posts[index].id;
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return new CommentPage(
                                postId: postId
                                  );
                              }));
                          },
                        child: Container(  
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.message,
                                color: Hexcolor("#03DAC5"),
                                size: 20.0,
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Text('Comments',
                              style: TextStyle(color:Colors.white) )
                            ]
                          ),
                        ),
                      ),
                    ],
                  )
                ),
                
              ],
            )
          )
      
    )
    );
   
  }


  
}