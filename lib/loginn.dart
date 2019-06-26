import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import './home.dart';
import 'new_user.dart';
import 'dart:async';

var _controller1 = new TextEditingController();
var _controller2 = new TextEditingController();

class logginn extends StatefulWidget {
  @override
  _logginnState createState() => _logginnState();
}

class _logginnState extends State<logginn> {

  @override
  Widget build(BuildContext context) {
    Future<bool> getSortingOrder(String email,String pass) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> _logdata= prefs.getStringList(email);
      if(pass==_logdata[2]&&email==_logdata[1]){
        return true;
      }
      else {
        return false;
      }
    }
    void _checkpress()async{
      if(await getSortingOrder(_controller1.text, _controller2.text)){
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (BuildContext context) => homepage()));
      }
      else {
        Alert(
            context: context,
            title: ('Not True'),
            type: AlertType.error,
            desc: ('Your email or password is not true'))
            .show();
      }

    }

    void pushhh(){

        Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (BuildContext context) => Nuser()));
    }


    return Material(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff64C8BD),
            title: Center(child: Text('Login')),
            elevation: 0,
          ),
          backgroundColor: Color(0xff094A6F),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                          width: 250,
                          child: Center(
                            child: TextFormField(
                              controller: _controller1,
                              decoration: InputDecoration(
                                  labelText: 'Set Your Email',
                                  hintText: 'Write Your Email',
                                  border: UnderlineInputBorder(
                                      borderRadius: BorderRadius.all(null)),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 30.0)),
                            ),
                          )),
                      Padding(padding: EdgeInsets.all(8)),
                      Container(
                          width: 250,
                          child: Center(
                            child: TextFormField(
                              controller: _controller2,
                              obscureText: true,
                              decoration: InputDecoration(
                                  labelText: 'Set Your PassWord',
                                  hintText: 'Write Your PassWord',
                                  border: UnderlineInputBorder(
                                      borderRadius: BorderRadius.all(null)),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 30.0)),
                              maxLength: 25,
                            ),
                          )),
                      Padding(padding: EdgeInsets.all(8)),
                      RaisedButton(
                        onPressed: (){
                       _checkpress();
                      },
                        child: Text('Creat'),
                      ),
                      Padding(padding: EdgeInsets.all(8)),
                      Padding(padding: EdgeInsets.all(8)),
                      InkWell(child: Text('if you dont have user click here',style:TextStyle(fontSize: 15,color: Colors.blueAccent)),
                      onTap: (){
                        pushhh();
                      },
                      ),
                    ],
                  )
                ],
              )
            ],
          )),
    );
  }
}
