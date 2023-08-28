import 'package:cabto_app/components/book_page_component/component_one.dart';
import 'package:cabto_app/components/book_page_component/component_two.dart';
import 'package:cabto_app/components/map_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookPageBody extends StatefulWidget {
  const BookPageBody({super.key, required this.destination});

  final String destination;

  @override
  State<BookPageBody> createState() => _BookPageBodyState();
}

class _BookPageBodyState extends State<BookPageBody> {
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.topLeft, children: [
       Column(children: [
        Expanded(
          flex: 3,
          child: MapView(destination: widget.destination),
        ),
        Expanded(flex: 7, child: Column(children: [ComponentOne(destination: widget.destination,), Expanded(child: ComponenetTwo())]))
      ]),
      IconButton(
          enableFeedback: false,
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 30,
          ))
    ]);
  }
}
