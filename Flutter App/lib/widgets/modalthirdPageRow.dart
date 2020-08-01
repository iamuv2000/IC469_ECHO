import 'package:flutter/material.dart';

class ThirdPageRow extends StatefulWidget {

  String title;

  ThirdPageRow({
    this.title
  });

  @override
  _ThirdPageRowState createState() => _ThirdPageRowState();
}

class _ThirdPageRowState extends State<ThirdPageRow> {
  var duration=0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 6),
                child: Icon(Icons.mode_edit),
              ),
              Text(
                // "Meditate"
                widget.title
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 12),
                child: GestureDetector(
                  onTap: (){
                    if((duration-1)<=0)
                     {
                       duration=0;
                     }
                    setState(() {
                      duration-=1;
                    });
                  },
                  child: Text(
                    "-",
                    style: TextStyle(
                      fontSize: 39
                    ),
                  ),
                ),
              ),
              Container(
                // margin: EdgeInsets.only(right: 12),
                child: GestureDetector(
                  child: Text(
                    // "2",
                    duration.toString()=='-1'?'0':duration.toString(),
                    style: TextStyle(
                      fontSize: 21
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 12),
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      duration+=1;
                    });
                  },
                  child: Text(
                    "+",
                    style: TextStyle(
                      fontSize: 27
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}