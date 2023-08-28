import 'package:cabto_app/services/utils/cosnt/cosnts.dart';
import 'package:flutter/material.dart';

class CarCard extends StatelessWidget {
  const CarCard({super.key, required this.selected, required this.iamgeUrl, required this.category, required this.info, required this.price});

  final String iamgeUrl;
  final String category;
  final String info;
  final String price;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding:  EdgeInsets.all(10.0),
      child: Container(
        decoration: selected ? BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(blurRadius: 7, color: grey.withOpacity(0.5), spreadRadius: 1)]) : null,
        padding: EdgeInsets.all(8),
        width: size.width * 0.99,
        child: ListTile(
          leading: Image.network(iamgeUrl, width: 50, height: 50,),
          title: Text(category, style: TextStyle(fontWeight: FontWeight.bold),),
          subtitle: Text(info),
          trailing: Column(children: [
            Text('Rs'+price, style: TextStyle(color: green, fontSize: 16),),
            Icon(Icons.info_outline, size: 22,)
          ]),
        ),
      ),
    );
  }
}
