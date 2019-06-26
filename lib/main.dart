import 'package:flutter/material.dart';
import 'loginn.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'ketab khane',
    home:Scaffold(
      backgroundColor:Colors.grey,
      body:Center(
        child:logginn(),
      )
    ),
  ));
}