import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/cosnt/cosnts.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  
  // Focus Node to put focus when user come to the page 
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
    FocusScope.of(context).requestFocus(_focusNode);
  });

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "search",
      child: Scaffold(
          appBar: AppBar(
            title: Text('Enter Destination'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
              focusNode: _focusNode,
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
    );
  }
}
