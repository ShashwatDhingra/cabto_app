import 'package:cabto_app/services/utils/app_url.dart';
import 'package:flutter/material.dart';

class ComponentOne extends StatelessWidget {
  const ComponentOne({super.key, required this.destination});

  final String destination;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          Image.network(
            MARKERS_IMAGE_LINK,
            width: 70,
            height: 70,
          ),
           Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Source Location',
                  style: TextStyle(color: Colors.grey),
                ),
                const Text(
                  'Your Location',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 32.0),
                  child: Divider(),
                ),
                const Text(
                  'Source Location',
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  destination,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ],
            ),
          )
        ]),
        const Divider()
      ],
    );
  }
}
