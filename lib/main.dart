import 'package:flutter/material.dart';
import 'package:flutter_getx/recent_page.dart';
import 'package:get/get.dart';
import 'content_page.dart';
import 'my_detail_page.dart';
import 'my_home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final String _HOME ="/";
  final String _DETAIL = "/detail";
  final String _RECENT = "/recent";
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
     initialRoute: _HOME,
     getPages: [
       GetPage(name: _HOME, page: ()=>MyHomePage()),
       GetPage(name: _DETAIL, page: ()=> DetailPage()),
       GetPage(name: _RECENT, page: ()=>RecentPage())
       ],
    );
  }
}
 