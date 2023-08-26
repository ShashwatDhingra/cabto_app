import 'package:cabto_app/components/drawer.dart';
import 'package:cabto_app/components/home_page_body.dart';
import 'package:cabto_app/utils/cosnt/cosnts.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: yellow,
        centerTitle: true,
        title: Text('cabto'.toUpperCase(), style: titleTextStyle.copyWith(fontSize: 30))),
        body: HomePageBody(),
        drawer: MyDrawer(),
    );
  }
}