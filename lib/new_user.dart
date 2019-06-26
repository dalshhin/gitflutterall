import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './home.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'loginn.dart';
import 'package:flutter_counter/flutter_counter.dart';

var _controller = new TextEditingController();
var _controller1 = new TextEditingController();
var _controller2 = new TextEditingController();

class Nuser extends StatefulWidget {
  @override
  _NuserState createState() => _NuserState();
}

class _NuserState extends State<Nuser> {
  Future<bool> getSortingOrder(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> _logdata = prefs.getStringList(email);
    if (email == _logdata[1]) {
      return false;
    } else
      return true;
  }


  void savedadaa(){
    if(_controller1.text != null &&
        _controller2.text != null &&
        _controller1.text.isNotEmpty &&
        _controller.text.isNotEmpty &&
        _controller2.text.isNotEmpty) {
      String email = _controller1.text;
      String pass = _controller2.text;
      String name = _controller.text;
      alldatatt(name, email, pass);
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => logginn()));
    }
    else{
      Alert(
          context: context,
          title: ('Empty'),
          type: AlertType.error,
          desc: ('Write in all text fild'))
          .show();
    }

  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff64C8BD),
            title: Center(child: Text('New User')),
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
                              controller: _controller,
                              decoration: InputDecoration(
                                  labelText: 'Set Your Name',
                                  hintText: 'Write Your Name',
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
                        onPressed: () {
                          savedadaa();
                        },
                        child: Text('Creat'),
                      ),
                      Padding(padding: EdgeInsets.all(8)),
                    ],
                  )
                ],
              )
            ],
          )),
    );
  }
}

void alldatatt(String name, String email, String pass) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setStringList(email, [name, email, pass]);
}
