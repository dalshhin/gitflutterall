import 'package:flutter/material.dart';
import 'about.dart';
import 'jsondata.dart';
import 'loginn.dart';
class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();

}
class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    void choisac(String chose) {
      if (chose == Constent.about) {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext context) => aboutt()));
      }
      if (chose == Constent.logout) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (BuildContext context) => logginn()));
      }
      if (chose == Constent.book) {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext context) => jsondata()));
      }
    }
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff094A6F),
          title: Text('Home'),
          actions: <Widget>[
            PopupMenuButton<String>(
                onSelected: choisac,
                itemBuilder: (BuildContext context){
                  return Constent.choise.map((String chose){
                    return PopupMenuItem<String>(
                      value: chose,
                      child: Text(chose),
                    );
                  }).toList();
                }
            )
          ],
        ),

        body:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                Text('Use Menu you are in Main Page',style: TextStyle(color: Color(0xff094A6F),fontSize:30),)
        ],)
        ],)
      ],
      )
      ),

    );
  }
}
class Constent{
  static const String book ='BookStore';
  static const String logout ='LogOut';
  static const String about ='About';
  static const List<String> choise = <String>[
    book,
    logout,
    about
  ];
}
