import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_getx/content_page.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';

class RecentPage extends StatefulWidget {
  const RecentPage({Key? key}) : super(key: key);

  @override
  _RecentPageState createState() => _RecentPageState();
}

class _RecentPageState extends State<RecentPage> {
  List info = [];

  void _readData() async {
    //How to load a  json file
    await DefaultAssetBundle.of(context)
        .loadString("json/recent.json")
        .then((value) {
      setState(() {
        info = json.decode(value);
      });
    });

    await DefaultAssetBundle.of(context)
        .loadString("json/detail.json")
        .then((value) {
      setState(() {
        info = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    _readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(

      ), 
      body: Container(
        margin: EdgeInsets.only(bottom: 10, left: 20, right: 10, top: 60),
        child: SingleChildScrollView(
            child: Column(
          children: [
            for (int i = 0; i < info.length; i++)
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: GestureDetector(
                  onTap: () {
                    Get.to(()=>ContentPage());
                    },
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    height: 220,
                    width: MediaQuery.of(context).size.width - 20,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color:
                            i.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc)),
                    child: Column(
                      children: [
                        Container(
                            child: Row(
                          children: [
                            Text(
                              info[i]["title"],
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            Expanded(child: Container())
                          ],
                        )),
                        SizedBox(height: 10),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            info[i]["text"],
                            style:
                                TextStyle(fontSize: 18, color: Colors.white60),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Divider(
                          thickness: 1.0,
                        ),
                        Row(children: [
                          for (int i = 0; i < 4; i++)
                            Container(
                              width: 50,
                              height: 50,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    image: DecorationImage(
                                        image: AssetImage(info[i]["img"]),
                                        fit: BoxFit.cover)),
                              ),
                            )
                        ]),
                      ],
                    ),
                  ),
                ),
              )
          ],
        )),
      ),
    );
  }
}
