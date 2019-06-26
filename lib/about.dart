import 'package:flutter/material.dart';
import 'loginn.dart';
import 'jsondata.dart';
class aboutt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void pushhh(){

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (BuildContext context) => jsondata()));
    }
    return Material(

      child:Scaffold(
        appBar: AppBar(title: Text('About'),elevation: 0,backgroundColor: Color(0xff094A6F),),
        backgroundColor: Color(0xff64C8BD),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Column(mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                Text('نام و نام خانوادگی',style:TextStyle(fontSize: 17,color:Color(0xff094A6F))),
                  Padding(padding: EdgeInsets.all(8)),
                  Text('دانیال شارزاده',style:TextStyle(fontSize: 20,color: Color(0xff094A6F))),
                  Padding(padding: EdgeInsets.all(8)),
                  Text('شماره دانشجویی',style:TextStyle(fontSize: 17,color: Color(0xff094A6F))),
                  Padding(padding: EdgeInsets.all(8)),
                  Text('96211033206030',style:TextStyle(fontSize: 20,color:Color(0xff094A6F))),
                  Padding(padding: EdgeInsets.all(8)),
                  Text('استاد',style:TextStyle(fontSize: 17,color:Color(0xff094A6F))),
                  Padding(padding: EdgeInsets.all(8)),
                  Text('سعید ولی پور عالم',style:TextStyle(fontSize: 20,color: Color(0xff094A6F))),
                  Padding(padding: EdgeInsets.all(8)),
                Divider(indent: 60,),
                  InkWell(child: Text('Click and Go to Book',style:TextStyle(fontSize: 22,color:Color(0xff094A6F))),
                    onTap: (){
                      pushhh();
                    },
                  ),
              ],
              )
            ],)
          ],
        ),
      )
    );
  }
}