import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:parallax/screens/chatScreen.dart';
import 'package:parallax/scoped_models/mainModel.dart';
import 'package:parallax/scoped_models/shared.dart';
import 'package:parallax/models/user.dart';

class MessageCard extends StatelessWidget {

  var message;
  MainModel model;

  MessageCard({
    this.message,
    this.model
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        // color: Colors.black,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        // shape: ,
        child: Container(
          // margin: EdgeInsets.all(10),
          color: Colors.white,
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 15, left: 10, right: 10, top: 10),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            // child: Text(message.title),
                            child: Text(message.name),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 25),
                            child: Text("10 hours ago"),
                          ),
                          // Text("10 hours ago"),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  // margin: EdgeInsets.symmetric(horizontal: 5),
                  margin: EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        // margin: EdgeInsets.only(top: 0),
                        child: Flexible(
                          child: Text(
                            message.description,
                            softWrap: true,
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
               GestureDetector(
                 onTap: () async {
                  //  print("Message UID:");
                  //  print(message.uid);
                   var a=Shared.getUserDetails();
                  //  print(a);
                  dynamic user;
                  await a.then((data){
                    //  print(data);
                    //  print(data.runtimeType);
                    //  print(jsonDecode(data));
                    print("Something!");
                    print(data.runtimeType);
                    user=data;
                   });
                  //  print(user);
                  //  print(user);
                   var c=await model.startChat(user["uid"], message.uid);
                  //  print(c);
                   if(c["status"]==200)
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatScreen(),
                        ),
                      );
                    }
                 },
                child: Container(
                   margin: EdgeInsets.only(top: 10),
                   padding: EdgeInsets.symmetric(vertical: 10),
                   width: double.infinity,
                  child: Text(
                    "Message Anonymous Ant",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                  color: Colors.black,
                 ),
               ),
              ],
            ),
          ),
        ),
    );
  }
}