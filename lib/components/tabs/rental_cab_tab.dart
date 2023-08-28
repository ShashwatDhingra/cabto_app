import 'package:flutter/material.dart';
import 'package:cabto_app/view/search_page.dart';
import 'package:cabto_app/components/my_button.dart';
import 'package:cabto_app/services/utils/cosnt/cosnts.dart';

class RentalCabTab extends StatefulWidget {
  const RentalCabTab({super.key});

  @override
  State<RentalCabTab> createState() => _RentalCabTabState();
}

class _RentalCabTabState extends State<RentalCabTab> {
  final _controller = TextEditingController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [Material(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                    elevation: 6,
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(20),
                      width: size.width * 0.9,
                      decoration: BoxDecoration(
                          color: white, borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Select Packages',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.black),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                                elevation: 6,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(children: [
                                      Text(
                                        '8Hr',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text('80 KM')
                                    ]),
                                  ),
                                )),
                          ),
                          GestureDetector(
                              onTap: () {
                                
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  width: size.width * 0.9,
                                  height: size.height * 0.07,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[400],
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const ListTile(
                                      leading: Icon(
                                        Icons.search,
                                        color: black,
                                      ),
                                      title: Text('Enter Destination',
                                          style:  TextStyle(
                                              fontSize: 18, color: black))))),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
      Container(color: Colors.white.withOpacity(0.7), height:  double.infinity, width: double.infinity,),
      Placeholder(color: Colors.grey.withOpacity(0.3),),
      Center(child: Text('Service Not Started' ,style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: black.withOpacity(0.9)),),)
      ]
    );
  }
}
