import 'dart:math';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:parallax/scoped_models/mainModel.dart';
import 'package:parallax/models/articleModel.dart';

class ArticleWidget extends StatefulWidget {  

  @override
  _ArticleWidgetState createState() => _ArticleWidgetState();
}

class _ArticleWidgetState extends State<ArticleWidget> {

  dynamic articles;

  var r=new Random();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final MainModel model=MainModel();
    initializePage(model);
  }

  void initializePage(MainModel model) async {
    var a=await model.getArticles();
    // print("A:");
    // print(a);
    var b=ArticlesModel(articles: a["payload"]).articles;
    // print("B:");
    // print(b);
    setState(() {
      articles=b;
    });
  }

  _launchURL(String url) async {
    // print(url);
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

  Widget articleCard(dynamic article){
    var a=r.nextInt(100)%9;
    // return Container(
    return SizedBox(
      height: 330,
          child: GestureDetector(
            onTap: (){
              _launchURL(article["url"]);
              // print(article);
            },
                      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
        ),
        child: Container(
            padding: EdgeInsets.all(15), 
                  child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  // "We found something interesting",
                  article["title"],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700
                  ),
                ),
                // SizedBox(
                //   height: 2,
                // ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Image.asset(
                    //   'images/clumsy.png',
                    //   // height: MediaQuery.of(context).size.height,
                    //   width: MediaQuery.of(context).size.width*1.0,
                    // ),
                    Image.network(
                      // article["imageUrl"]!=null?article["imageUrl"]:'images/clumsy.png',
                      article["image"],
                      // height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width*1.0,
                    ),
                  ],
                ),
                // SizedBox(
                //   height: 6,
                // ),
                Text(
                  // "Creating the perfect work-life balance",
                  article["token"].toUpperCase(),
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w800
                  ),
                ),
                // SizedBox(
                //   height: 1,
                // ),
                Text(
                  // "6 min read"
                  a.toString()+" min read"
                ),
              ],
            ),
        ),
      ),
          ),
    );
  }

  List<Widget> makeArticleList(){
    var arr=<Widget>[];
    if(articles==null)
     {
       return [Container()];
     }
    for(int i=0;i<articles.length;i++)
     {
      //  print("Article[$i]");
      //  print(articles[i]);
      //  print(articles.runtimeType);
       arr.add(
         Container(
           margin: EdgeInsets.all(15),
           child: articleCard(articles[i]),
         )
       );
     }
    return arr;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: 
      // <Widget>[
        
      // ],
      makeArticleList(),
    );
    // Container(
    //   child: makeArticleList(),
    // );
  }//articleCard()
}