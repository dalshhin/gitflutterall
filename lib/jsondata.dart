import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/services.dart';
class jsondata extends StatefulWidget {
  @override
  _jsondataState createState() => _jsondataState();
}

class _jsondataState extends State<jsondata> {

  List data;
  Future getData() async {
    http.Response response =
    await http.get("https://api.myjson.com/bins/jb58f");
    data = json.decode(response.body);
    setState(() {
      data;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(title: Text('Books'),
          backgroundColor: Color(0xff094A6F),),
        body: ListView.builder(
            itemCount: data == null ? 0 : data.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 4,bottom: 2)),
                  Card(color: Color(0xff64C8BD),elevation: 14,
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          ListTile(
                            title: Text(data[index]["bookname"]),
                            leading: CircleAvatar(
                              backgroundImage: AssetImage("lib/book.png"),
                              radius: 28,
                            ),
                            trailing: FloatingActionButton(
                                onPressed: () {
                                  Clipboard.setData(
                                      ClipboardData(text: data[index]["bookurl"]));
                                  Alert(
                                      context: context,
                                      title: (data[index]["bookname"] + ' ' + 'Copied'),
                                      type: AlertType.success,
                                      desc: ('Link has Copied , Paste in your browser'))
                                      .show();
                                },
                                child: Center(
                                  child: Icon(Icons.file_download, size: 30),
                                )),
                            subtitle: Divider(),
                          ),
                        ],
                      )
                  ),

                ],
              );
            }
        ),
    );
  }
}
