import 'package:flutter/material.dart';
import 'package:parallax/screens/dialogFlow.dart';

import 'package:parallax/widgets/dateWidget.dart';
import 'package:parallax/widgets/activityWidget.dart';
import 'package:parallax/widgets/articleWidget.dart';
import 'profilePage.dart';
import 'package:parallax/screens/messageList.dart';
import 'package:parallax/widgets/modalsecondPageRow.dart';
import 'package:parallax/widgets/modalthirdPageRow.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  // void showModal(BuildContext context){
  //   showBottomSheet(
  //     context: context,
  //     builder: (BuildContext context){
  //     return Container(
  //       height: 150.0,
  //       child: Text("Fenil"),
  //     );
  //   });
  // }

  bool showFab = true;

  double _height = 240.0;

  int pageNumber = 1, _moodIndex = -1;

  List<String> activities = [], activityKeys = [];
  List<int> timeSpent = [];

  void updateActivites(String newActivity) {
    print("Adding: $newActivity");
    var activityKey = "";
    if(newActivity == "Jogging") {
      activityKey = "jogging";
    } else if(newActivity == "Exercise") {
      activityKey = "exercise";
    } else if(newActivity == "Meditate") {
      activityKey = "meditate";
    } else if(newActivity == "Paint") {
      activityKey = "paint";
    } else if(newActivity == "Read") {
      activityKey = "read";
    } else if(newActivity == "Code") {
      activityKey = "code";
    } else if(newActivity == "Video Games") {
      activityKey = "games";
    } else if(newActivity == "Socialize") {
      activityKey = "socialize";
    } else if(newActivity == "Social Media") {
      activityKey = "socialMedia";
    } else if(newActivity == "Good Sleep") {
      activityKey = "goodSleep";
    } else if(newActivity == "Moderate Sleep") {
      activityKey = "moderateSleep";
    } else if(newActivity == "Bad Sleep") {
      activityKey = "badSleep";
    } else if(newActivity == "Streaming Platforms") {
      activityKey = "netflix";
    } else if(newActivity == "Smoking") {
      activityKey = "smoke";
    } else if(newActivity == "Junk Food") {
      activityKey = "junkFood";
    }
    setState(() {
      activities.add(newActivity);
      activityKeys.add(activityKey);
      timeSpent.add(0);
    });
    Navigator.pop(context);
    _modalBottomSheetMenu();
  }

  void updateTimeSpent(int index, hours) {
    setState(() {
      timeSpent[index] = hours;
    });
  }

  void showFoatingActionButton(bool value) {
    setState(() {
      showFab = value;
    });
  }

  Widget modalFirstSheetPage(double h) {
    return Container(
      height: h,
      color: Colors.transparent,
      child: new Container(
          padding: EdgeInsets.all(10),
          // decoration: new BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: new BorderRadius.only(
          //         topLeft: const Radius.circular(20.0),
          //         topRight: const Radius.circular(20.0)
          //       )
          //     ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "How was your day?",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Container(
                      child: IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                    ),
                  ],
                ),
                // Wrap(
                //                 children: [
                // Row(
                Wrap(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _moodIndex = 0;
                        });
                        Navigator.pop(context);
                        _modalBottomSheetMenu();
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: _moodIndex == 0
                                  ? Colors.lightBlue
                                  : Colors.transparent,
                              maxRadius: 27,
                              backgroundImage:
                                  AssetImage("images/awesome_icon.png"),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 6),
                              child: Text("Amazing"),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _moodIndex = 1;
                        });
                        Navigator.pop(context);
                        _modalBottomSheetMenu();
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: _moodIndex == 1
                                  ? Colors.lightBlue
                                  : Colors.transparent,
                              maxRadius: 27,
                              backgroundImage:
                                  AssetImage("images/good_icon.png"),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 6),
                              child: Text("Good"),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _moodIndex = 2;
                        });
                        Navigator.pop(context);
                        _modalBottomSheetMenu();
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: _moodIndex == 2
                                  ? Colors.lightBlue
                                  : Colors.transparent,
                              maxRadius: 27,
                              backgroundImage:
                                  AssetImage("images/meh_icon.png"),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 6),
                              child: Text("Meh"),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _moodIndex = 3;
                        });
                        Navigator.pop(context);
                        _modalBottomSheetMenu();
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: _moodIndex == 3
                                  ? Colors.lightBlue
                                  : Colors.transparent,
                              maxRadius: 27,
                              backgroundImage:
                                  AssetImage("images/bad_icon.png"),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 6),
                              child: Text("Bad"),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _moodIndex = 4;
                        });
                        Navigator.pop(context);
                        _modalBottomSheetMenu();
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: _moodIndex == 4
                                  ? Colors.lightBlue
                                  : Colors.transparent,
                              maxRadius: 27,
                              backgroundImage:
                                  AssetImage("images/awful_icon.png"),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 6),
                              child: Text("Aweful"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                //                 ]
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          pageNumber = 2;
                        });
                        Navigator.of(context).pop();
                        _modalBottomSheetMenu();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width - 80,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        margin: EdgeInsets.only(top: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blueAccent,
                        ),
                        child: Text(
                          "NEXT",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }

  Widget modalSecondSheetPage(double h) {
    return Container(
      height: h,
      color: Colors.transparent,
      child: SingleChildScrollView(
        child: new Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "What were you up to?",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Container(
                      child: IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                    ),
                  ],
                ),
                SecondPageRow(
                  title: "Self-care",
                  chipTitles: ["Jogging", "Exercise", "Meditate"],
                  activities: activities,
                  updateActivites: updateActivites,
                ),
                SecondPageRow(
                  title: "Hobby",
                  chipTitles: ["Paint", "Read", "Code", "Video Games"],
                  activities: activities,
                  updateActivites: updateActivites,
                ),
                SecondPageRow(
                  title: "Interaction",
                  chipTitles: ["Socialize", "Social Media"],
                  activities: activities,
                  updateActivites: updateActivites,
                ),
                SecondPageRow(
                  title: "Sleep",
                  chipTitles: ["Good Sleep", "Moderate Sleep", "Bad Sleep"],
                  activities: activities,
                  updateActivites: updateActivites,
                ),
                SecondPageRow(
                  title: "Others",
                  chipTitles: ["Streaming Platforms", "Smoking", "Junk Food"],
                  activities: activities,
                  updateActivites: updateActivites,
                ),
                // SecondPageRow(title: "Something", chipTitles: ["Jogging", ""]),
                // SecondPageRow(title: "Something", chipTitles: ["Jogging", "Netflix"]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          pageNumber = 3;
                        });
                        Navigator.of(context).pop();
                        _modalBottomSheetMenu();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width - 80,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        margin: EdgeInsets.only(top: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blueAccent,
                        ),
                        child: Text(
                          "NEXT",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }

  Widget modalThirdSheetPage(double h) {
    return SingleChildScrollView(
      child: Container(
        //height: h,
        color: Colors.transparent,
        child: Container(
          child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text(
                          "What were you up to?",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Container(
                        child: IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                      ),
                    ],
                  ),
                  Column(
                    children: activities
                        .asMap()
                        .map((index, data) {
                          return MapEntry(
                              index,
                              ThirdPageRow(
                                title: data,
                                index: index,
                                updateTimeSpent: updateTimeSpent,
                              ));
                        })
                        .values
                        .toList(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          print(_moodIndex);
                          print(activities);
                          print(timeSpent);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width - 80,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          margin: EdgeInsets.only(top: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blueAccent,
                          ),
                          child: Text(
                            "SUBMIT",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }

  void _modalBottomSheetMenu() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          if (pageNumber == 1) {
            return modalFirstSheetPage(330.0);
          } else if (pageNumber == 2) {
            return modalSecondSheetPage(
                MediaQuery.of(context).size.height * 0.7);
          } else if (pageNumber == 3) {
            return modalThirdSheetPage(
                MediaQuery.of(context).size.height * 1.2);
          } else {
            return modalThirdSheetPage(
                MediaQuery.of(context).size.height * 0.7);
          }
          // return modalFirstSheetPage(240.0);
          // return modalSecondSheetPage(MediaQuery.of(context).size.height*0.7);
          // return modalThirdSheetPage(MediaQuery.of(context).size.height*0.7);
        });
  }

  List<Widget> constructColumn() {
    var arr = <Widget>[
      DateWidget(),
      ActivityWidget(),
    ];
    arr.add(ArticleWidget());
    return arr;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Container(),
        title: Text(
          "Hello, Gagan",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(),
                  ),
                );
              },
              child: CircleAvatar(
                backgroundColor: Colors.grey,
              ),
            ),
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      // body: ListView(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(21),
        // children: <Widget>[
        child: Column(children: constructColumn()
            // <Widget>[
            //   DateWidget(),
            //   ActivityWidget(),
            // ].add(ArticleWidget()),
            ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          margin: EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              GestureDetector(
                onTap: () {},
                child: Container(
                  child: IconButton(icon: Icon(Icons.home), onPressed: () {}),
                ),
              ),
              Container(
                child: IconButton(
                  icon: Icon(Icons.people),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MessageList(),
                      ),
                    );
                  },
                ),
              ),
              Container(
                child: IconButton(
                  icon: Icon(Icons.message),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePageDialogflow(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: showFab
          ? FloatingActionButton(
              backgroundColor: Colors.black,
              onPressed: () {},
              child: IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  _modalBottomSheetMenu();
                },
                iconSize: 33,
              ),
            )
          : Container(),
    );
  }
}
