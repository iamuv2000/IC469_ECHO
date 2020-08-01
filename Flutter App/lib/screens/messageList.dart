import 'package:flutter/material.dart';

import 'package:parallax/models/postModel.dart';
import 'package:parallax/screens/chatList.dart';
import 'package:parallax/screens/dialogFlow.dart';
import 'package:parallax/widgets/messageCard.dart';
import 'package:parallax/scoped_models/mainModel.dart';
import 'package:parallax/screens/homePage.dart';
import 'package:parallax/screens/dialogFlow.dart';
import 'package:scoped_model/scoped_model.dart';
// import 'package:parallax/models/chatList.dart';

class MessageList extends StatefulWidget {
  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {

  var messages=null;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState(){
    super.initState();
    final MainModel model=MainModel();
    _initializePage(model);
  }

  void _initializePage(MainModel model) async {
    var a=await model.getAllPosts();
    // print(a);
    // print(a["payload"]["posts"]);
    setState(() {
      // messages=PostsModel.fromJson(a["payload"]["posts"]).messages;
      messages=PostsModel.fromJson(a["payload"]["posts"]).posts;
    });
    // print(messages.messages);
    // var messages=PostsModel.fromJson(a["payload"]["posts"]);
  }

  List<Widget> _buildAppBarActionButtons(){
    return <Widget>[
          Container(
            child: IconButton(
              icon: Icon(
                Icons.bookmark,
                size: 30,
                color: Colors.black,
              ),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ChatList(),
                  // builder: (context) => HomePageDialogflow(),
                ),);
              }
            ),
          ),
        ];
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model){
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            elevation: 0,
            title: Text(
              "Posts",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            actions: _buildAppBarActionButtons(),
            backgroundColor: Colors.white,
            leading: Container(),
          ),
          body: 
          messages==null
          ?Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
          :
          ListView.builder(
            itemCount: messages.length,
            // itemCount: 1,
            padding: EdgeInsets.all(0),
            itemBuilder: (BuildContext context, int index){
              return Container(
                // child: Text("2"),
                child: MessageCard(message: messages[index], model: model),
                // child: MessageCard(PostModel(
                //   description: "Somenhting",
                //   isAno: true,
                //   messageId: "Somehitng",
                //   timeStamp: "Somebgujrng",
                //   title: "SOmelfn",
                //   uid: "asdlandjk"
                // )),
              );
            }
          ),
          bottomNavigationBar: BottomAppBar(
            child: Container(
              margin: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      // Navigator.push(context, ChatList());
                      // Navigator.of(context).pop();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          // builder: (context) => ChatList(),
                          builder: (context) => HomePage(),
                        ),
                      );
                      // Navigator.popUntil(context, ModalRoute.withName('/home'));
                      // Navigator.of(context).pushNamed('/home');
                    },
                    child: Container(
                      child: Icon(Icons.home),
                    ),
                  ),
                  Container(
                    child: Icon(Icons.people),
                  ),
                  Container(
                    child: IconButton(
                      icon: Icon(Icons.message),
                      onPressed: (){
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            // builder: (context) => ChatList(),
                            builder: (context) => HomePageDialogflow(),
                          ),
                        );
                      },
                    ),
                  ),
                  // Container(
                  //   // child: Column(
                  //   //   children: <Widget>[
                  //   //     Icon(Icons.home),
                  //   //     Text("Home"),
                  //   //   ],
                  //   // ),
                  // ),
                  // Container(
                  //   child: Icon(Icons.home),
                  // ),
                  // Container(
                  //   child: Icon(Icons.home),
                  // ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){},
            backgroundColor: Colors.black,
            child: IconButton(
              icon: Icon(
                Icons.note_add,
                color: Colors.white,
                size: 33,
              ),
              onPressed: (){
                scaffoldKey.currentState.showBottomSheet((context)=>Container(
                  height: 150.0,
                  color: Colors.red
                )
               );
              }
            ),
          ),
        );
       },
            // child: ,
      );
    }
}