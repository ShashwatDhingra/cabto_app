import 'package:cabto_app/utils/cosnt/cosnts.dart';
import 'package:flutter/material.dart';

class CarCard extends StatelessWidget {
  const CarCard({super.key, required this.selected});

  final bool selected;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: selected ? BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(blurRadius: 7, color: grey.withOpacity(0.5), spreadRadius: 1)]) : null,
        padding: EdgeInsets.all(8),
        width: size.width * 0.99,
        child: const ListTile(
          leading: Icon(Icons.car_crash),
          title: Text('Sedan', style: TextStyle(fontWeight: FontWeight.bold),),
          subtitle: Text('Maruti Swift Dzire or Similar'),
          trailing: Column(children: [
            Text('\$192', style: TextStyle(color: green, fontSize: 16),),
            Icon(Icons.info_outline, size: 22,)
          ]),
        ),
      ),
    );
  }
}
