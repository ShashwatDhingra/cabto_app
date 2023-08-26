import 'package:cabto_app/components/book_page_body.dart';
import 'package:flutter/material.dart';

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      //* To hide the Scroll Bar. Thats lokking shaby when scroll the available cars list,
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: Scaffold(body: BookPageBody()),
    );
  }
}
