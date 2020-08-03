import 'package:flutter/material.dart';
import 'addMentor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../widgets/myStoryCard.dart';
FirebaseUser loggedInUser;

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final _auth = FirebaseAuth.instance;
  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.displayName);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<http.Response> getMyPosts() {
    return http.get('https://echo-cbt-server.herokuapp.com/user/getUserStories',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${loggedInUser.uid}'
        });
  }

  TabController _tabController;

  var posts = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    getCurrentUser();
    _initializePage();
  }

  void _initializePage() async {
    print("FETCHING ARTICLES!");
    var allPosts = await getMyPosts();
    final parsed = jsonDecode(allPosts.body);
    print(parsed['payload']);
//    var a = await model.getAllPosts();
    setState(() {
      posts = parsed['payload']['userStories'];
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.all(10),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Text(
              "Profile",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddMentor(),
                  ),
                );
              },
              child: Icon(
                Icons.add,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 50),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    loggedInUser.photoUrl,
                  ),
                  backgroundColor: Colors.grey,
                  radius: 60.0,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text(
                  loggedInUser.displayName,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text(
                  loggedInUser.email,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          Container(
            height: 80.0,
            child: TabBar(
              controller: _tabController,
              tabs: [
                Tab(
                    child: Text(
                  'Stories',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )),
                Tab(
                    child: Text(
                  'Stats',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: TabBarView(
                controller: _tabController,
                children: [
                  posts.length == 0
                  ?
                      Center(
                        child: Text(
                          'No stories to display!',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      )
                      :
                  ListView.builder(
                      itemCount: posts.length,
                      padding: EdgeInsets.all(0),
                      itemBuilder: (context, index) {
                        final item = posts[index];
                        return Container(
                          child: MessageCard(message: item),
                        );
                      }),
                  ListView(
                    padding: const EdgeInsets.all(8),
                    children: <Widget>[
                      Card(
                        elevation: 8.0,
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              title: Text('Steak 16'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
