import 'package:flutter/material.dart';

import 'addMentor.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
                Icons.settings,
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
                  'Gagan Verma',
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
                  'gagan.v@gmail.com',
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
                  ListView(
                    padding: const EdgeInsets.all(8),
                    children: <Widget>[
                      Card(
                        elevation: 8.0,
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: CircleAvatar(
                                radius: 16,
                              ),
                              title: Text('Posted Anonymously'),
                              subtitle: Text('A month ago.'),
                              trailing: Icon(Icons.more_vert),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Non enim nulla turpis id. Id sed tellus, velit laoreet amet ipsum netus. Sed proin duis et leo, nam vitae porta. Enim, lorem curabitur id facilisis nisi, pulvinar magnis cursus neque. Ut ipsum et, felis nam euismod. ',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        elevation: 8.0,
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: CircleAvatar(
                                radius: 16,
                              ),
                              title: Text('Posted Anonymously'),
                              subtitle: Text('A month ago.'),
                              trailing: Icon(Icons.more_vert),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Non enim nulla turpis id. Id sed tellus, velit laoreet amet ipsum netus. Sed proin duis et leo, nam vitae porta. Enim, lorem curabitur id facilisis nisi, pulvinar magnis cursus neque. Ut ipsum et, felis nam euismod. ',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        elevation: 8.0,
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: CircleAvatar(
                                radius: 16,
                              ),
                              title: Text('Posted Anonymously'),
                              subtitle: Text('A month ago.'),
                              trailing: Icon(Icons.more_vert),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Non enim nulla turpis id. Id sed tellus, velit laoreet amet ipsum netus. Sed proin duis et leo, nam vitae porta. Enim, lorem curabitur id facilisis nisi, pulvinar magnis cursus neque. Ut ipsum et, felis nam euismod. ',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
