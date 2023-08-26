import 'package:cabto_app/components/my_button.dart';
import 'package:cabto_app/utils/cosnt/cosnts.dart';
import 'package:cabto_app/view/search_page.dart';
import 'package:cabto_app/view_model/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RentalCabTab extends StatefulWidget {
  const RentalCabTab({super.key, required this.onTap});

  final Function() onTap;

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
    return Hero(
      tag: "search",
      child: Material(
        child: SingleChildScrollView(
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
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    Text('80 KM')
                                  ]),
                                ),
                              )),
                        ),
                        TextField(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SearchPage(),
                                ));
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
                      ],
                    ),
                  )),
              MyButton(
                onTap: widget.onTap,
                size: size,
                title: 'Next',
              )
            ],
          ),
        ),
      ),
    );
  }
}
