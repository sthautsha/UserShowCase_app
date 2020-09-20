import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:userShowCase_app/models/comment.dart';
import 'package:userShowCase_app/services/comment_services.dart';

class CommentPage extends StatefulWidget {
  int postId;
  CommentPage({Key key, this.postId}): super(key: key);
  @override
  _CommentPageState createState() => _CommentPageState(postId : this.postId);
}

class _CommentPageState extends State<CommentPage> {
  List<Comment> comments = new List<Comment>();
  int postId;
  var isLoading = false;
  _CommentPageState({this.postId});

  @override
  void initState() {
    super.initState(); 
    _loadComments();
  }

  void _loadComments() async {
    setState(() {
      isLoading = true;
    });
      final results = await CommentServices.getComments(this.postId);
      this.setState(() {
          isLoading = false;
          comments = results;
          //print(comments);
      });
  }

  @override
  Widget build(BuildContext context) {
    print(this.postId);
    return Scaffold(
      appBar: AppBar(
        title: Text("Comments", style: TextStyle(fontSize: 20
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
      backgroundColor: Hexcolor("#313131"),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
          )
          :ListView.builder(
          itemCount: comments.length,
          itemBuilder: (BuildContext context, int index){
              return commentList(index);
          },
      )
    );
  }

  Widget commentList(int index){
    return Container(
      child: Card(
        color: Hexcolor("#313131"),
        child:Container(
          padding: new EdgeInsets.all(20.0),
          child: Column(
          children: <Widget>[
             Icon(
              Icons.account_circle,
              color: Colors.white,
              size: 30.0
              ),
              SizedBox(
                height: 12.0,
              ),
              Column(
                children: <Widget>[
                  Text(comments[index].name,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  Text(comments[index].email,
                    style: TextStyle(
                      fontSize:12,
                      color:Colors.grey,
                      
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ]
              ),
              SizedBox(
                height: 12.0,
              ),
              Text(comments[index].body,
                style: TextStyle(
                  fontSize:14,
                  color: Colors.white,
                ),
              )    
          ]
        )

        )
        
       
      )
    );
  }
}