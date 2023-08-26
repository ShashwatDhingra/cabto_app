import 'package:cabto_app/utils/cosnt/cosnts.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.onTap, required this.title, required this.size});

  final Function() onTap;
  final String title;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(30)),
        width: size.width * 0.9,
        height: size.height * 0.07,
        child: Center(child: Text(title, style: const TextStyle(color: white, fontSize: 18),)),
      ),
    );
  }
}
