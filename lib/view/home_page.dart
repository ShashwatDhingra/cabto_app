import 'package:cabto_app/components/app_bar.dart';
import 'package:cabto_app/components/drawer.dart';
import 'package:cabto_app/components/home_page_body.dart';
import 'package:cabto_app/utils/cosnt/cosnts.dart';
import 'package:cabto_app/view_model/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar,
        body: HomePageBody(),
        drawer: MyDrawer(),
    );
  }
}