import 'package:flutter/material.dart';

class ComponentOne extends StatelessWidget {
  const ComponentOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          Image.network(
            'https://media.istockphoto.com/id/1131013367/vector/destination-icon-with-pin-location-from-start-to-end-destination.jpg?s=612x612&w=0&k=20&c=Yfd8X4TkdK8CfbR7sizPz_j0MW0qMCo5e1Iy3w4-IIA=',
            width: 70,
            height: 70,
          ),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Source Location',
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  'Delhi',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 32.0),
                  child: Divider(),
                ),
                Text(
                  'Source Location',
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  'Dubai',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ],
            ),
          )
        ]),
        Divider()
      ],
    );
  }
}
