import 'package:flutter/material.dart';

import 'package:parallax/models/postModel.dart';
import 'package:parallax/screens/chatList.dart';
import 'package:parallax/screens/dialogFlow.dart';
import 'package:parallax/widgets/messageCard.dart';
import 'package:parallax/scoped_models/mainModel.dart';
import 'package:parallax/screens/homePage.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class MessageList extends StatefulWidget {
  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  var messages = null;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final postController = TextEditingController();

  Future<http.Response> submitPost() {
    return http.post(
      'https://echo-cbt-server.herokuapp.com/user/create_story',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer 6H7TDIZq3vOOK4q3z6ih7cGfkc43'
      },
      body: jsonEncode(<String, String>{
        'story': postController.text,
        'isAnonymous': "isChecked.toString()"
      }),
    );
  }

  Future<http.Response> getAllPosts() {
    return http.get('https://echo-cbt-server.herokuapp.com/user/stories',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer 6H7TDIZq3vOOK4q3z6ih7cGfkc43'
        });
  }

  @override
  void initState() {
    super.initState();
    _initializePage();
  }

  void _initializePage() async {
    print("FETCHING ARTICLES!");
    var allPosts = await getAllPosts();
    final parsed = jsonDecode(allPosts.body);
    print(parsed['payload']['stories']);
//    var a = await model.getAllPosts();
    setState(() {
      messages = parsed['payload']['stories'];
    });
  }

  bool isChecked = false;

  Future<Null> updated(StateSetter updateState) async {
    updateState(() {
      isChecked = !isChecked;
    });
  }

  List<Widget> _buildAppBarActionButtons() {
    return <Widget>[
      Container(
        child: IconButton(
            icon: Icon(
              Icons.bookmark,
              size: 30,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ChatList(),
                ),
              );
            }),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
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
          body: messages == null
              ? Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : ListView.builder(
                  itemCount: messages.length,
                  padding: EdgeInsets.all(0),
                  itemBuilder: (context, index) {
                    final item = messages[index];
                    return Container(
                      child: MessageCard(message: item),
                    );
                  }),
          bottomNavigationBar: BottomAppBar(
            child: Container(
              margin: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
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
                      onPressed: () {
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
            onPressed: () {},
            backgroundColor: Colors.black,
            child: IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 33,
                ),
                onPressed: () {
                  showModalBottomSheet<void>(
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) {
                        return StatefulBuilder(builder: (context, state) {
                          return Container(
                            height: MediaQuery.of(context).size.height / 2 +
                                MediaQuery.of(context).viewInsets.bottom,
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "Create a new post",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w800),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Icon(Icons.close,
                                            color: Colors.black, size: 20),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: TextField(
                                          controller: postController,
                                          keyboardType: TextInputType.multiline,
                                          maxLines: null,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Row(
                                    children: <Widget>[
                                      Checkbox(
                                        value: isChecked,
                                        onChanged: (bool value) {
                                          updated(state);
                                        },
                                        activeColor: Colors.pink,
                                        checkColor: Colors.white,
                                        tristate: false,
                                      ),
                                      Text("Check to post anonymously")
                                    ],
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                            child: RaisedButton(
                                          onPressed: () async {
                                            var result = await submitPost();
                                            print(result.body);
                                            _initializePage();
                                            Navigator.pop(context);
                                          },
                                          padding: EdgeInsets.all(10),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          elevation: 0.5,
                                          color: Colors.lightBlueAccent,
                                          child: const Text(
                                            'Post',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white),
                                          ),
                                        ))
                                      ],
                                    ))
                              ],
                            ),
                          );
                        });
                      });
                }),
          ),
        );
      },
      // child: ,
    );
  }
}
