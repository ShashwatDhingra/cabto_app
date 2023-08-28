import 'package:cabto_app/components/my_button.dart';
import 'package:cabto_app/services/utils/cosnt/cosnts.dart';
import 'package:cabto_app/view/search_page.dart';
import 'package:cabto_app/view_model/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CityCabTab extends StatefulWidget {
  const CityCabTab({super.key});

  @override
  State<CityCabTab> createState() => _CityCabTabState();
}

class _CityCabTabState extends State<CityCabTab> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(20),
          width: size.width * 0.9,
          decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(12)),
          child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchPage(),
                    ));
              },
              child: Container(
                  alignment: Alignment.center,
                  width: size.width * 0.9,
                  height: size.height * 0.07,
                  decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(10)),
                  child: const ListTile(leading: Icon(Icons.search, color: black,), title: Text('Enter Destination',
                      style: const TextStyle(
                          fontSize: 18, color: black)))))),
    );
  }
}
