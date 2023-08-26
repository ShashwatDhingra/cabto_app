import 'package:cabto_app/components/my_button.dart';
import 'package:cabto_app/utils/cosnt/cosnts.dart';
import 'package:cabto_app/view/search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CityCabTab extends StatefulWidget {
  const CityCabTab({super.key});

  @override
  State<CityCabTab> createState() => _CityCabTabState();
}

class _CityCabTabState extends State<CityCabTab> {
  final _controller = TextEditingController();



  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Hero(
      tag: "search",
      child: Material(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                  elevation: 6,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(20),
                    width: size.width * 0.9,
                    height: size.height * 0.24,
                    decoration: BoxDecoration(
                        color: white, borderRadius: BorderRadius.circular(12)),
                    child: TextField(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage(),));
                      },
                      keyboardType: TextInputType.streetAddress,
                      decoration: InputDecoration(
                          labelStyle: TextStyle(color: black),
                          label: Text('Destination'),
                          prefixIcon: Icon(CupertinoIcons.search),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                          filled: true,
                          fillColor: grey.withOpacity(0.1)),
                    ),
                  )),
                  MyButton(onTap: () {}, size: size, title: 'Next',)
            ],
          ),
        ),
      ),
    );
  }
}
