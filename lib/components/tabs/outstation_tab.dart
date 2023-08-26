import 'package:cabto_app/components/my_button.dart';
import 'package:cabto_app/utils/cosnt/cosnts.dart';
import 'package:cabto_app/view/search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/provider.dart';

class OutStationTab extends StatefulWidget {
  const OutStationTab({super.key});

  @override
  State<OutStationTab> createState() => _OutStationTabState();
}

class _OutStationTabState extends State<OutStationTab> {
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
                        SizedBox(
                          height: 20,
                        ),
                        Consumer<MyProvider>(
                          builder: (context, myProvider, child) {
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    InputChip(
                                      selectedColor: grey.withOpacity(0.1),
                                      label: Text("One-way"),
                                      onSelected: (value) {
                                        myProvider.toogle(1);
                                      },
                                      selected:
                                          myProvider.outStation_selected_chip ==
                                                  1
                                              ? true
                                              : false,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    InputChip(
                                      selectedColor: grey.withOpacity(0.1),
                                      label: Text("Two-way"),
                                      onSelected: (value) {
                                        myProvider.toogle(2);
                                      },
                                      selected:
                                          myProvider.outStation_selected_chip ==
                                                  2
                                              ? true
                                              : false,
                                    )
                                  ],
                                ),
                                SizedBox(height: 10),
                                myProvider.outStation_selected_chip == 2 ? Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.grey.withOpacity(0.2)),
                                  width: size.width * 0.9,
                                  height: size.height * 0.07,
                                  child: Text(
                                    'Return Data',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ) : Container() // This empty container means nothing to show
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  )),
              MyButton(
                onTap: () {},
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
