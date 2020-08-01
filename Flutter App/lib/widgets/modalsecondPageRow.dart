//172.17.235.30:8080/getSuggestion

import 'package:flutter/material.dart';

import 'package:parallax/widgets/activityCard.dart';

class SecondPageRow extends StatelessWidget {

  String title;
  List<String> chipTitles;

  SecondPageRow({
    this.title,
    this.chipTitles
  });

  List<Widget> something(){
    List<Widget> arr=[];
    var a=chipTitles.map((data){
      return arr.add(ActivityCard(title: data));
    });
    // print("A:");
    print(a);
    // print(arr);
    return arr;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              title,
              textAlign: TextAlign.left,
            ),
          ),
          // Row(
          Wrap(
            // mainAxisAlignment: MainAxisAlignment.center,
            alignment: WrapAlignment.center,
            children: something()
          //     <Widget>[
          //     // ActivityCard(title: "Jogging"),
          //     // ActivityCard(title: "Watch Cinema"),
              
          //  ],
          ),
        ],
      ),
    );
  }
}