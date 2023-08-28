import 'package:cabto_app/components/my_button.dart';
import 'package:cabto_app/services/utils/cosnt/cosnts.dart';
import 'package:cabto_app/view/search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../../view_model/provider.dart';

class OutStationTab extends StatefulWidget {
  const OutStationTab({super.key});
  @override
  State<OutStationTab> createState() => _OutStationTabState();
}

class _OutStationTabState extends State<OutStationTab> {
  String? _returnDate;

  Future<String> _showDatePicker() async {
    DateTime? _selectedDateTime = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(
            DateTime.now().year, DateTime.now().month + 1, DateTime.now().day));

    if (_selectedDateTime != null) {
      // Using Date Formatter to Format Date
      DateFormat dateFormat = DateFormat.MMMMd();
      String formattedDate = dateFormat.format(_selectedDateTime);
      return formattedDate;
    } else {
      return _returnDate == null ? 'Return Date' : _returnDate!;
    }
  }

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
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SearchPage(),
                                  ));
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
                                        style: const TextStyle(
                                            fontSize: 18, color: black))))),
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
                                      backgroundColor: Colors.white,
                                      selectedColor: grey.withOpacity(0.2),
                                      label: Text("One-way"),
                                      onPressed: () {
                                        myProvider.toogleOutstationChip(1);
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
                                      selectedColor: grey.withOpacity(0.2),
                                      label: Text("Two-way"),
                                      onPressed: () {
                                        myProvider.toogleOutstationChip(2);
                                      },
                                      selected:
                                          myProvider.outStation_selected_chip ==
                                                  2
                                              ? true
                                              : false,
                                    )
                                  ],
                                ),
                                const SizedBox(height: 10),
                                myProvider.outStation_selected_chip == 2
                                    ? GestureDetector(
                                        onTap: () async {
                                          _returnDate = await _showDatePicker();
                                          setState(() {});
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color:
                                                  Colors.grey.withOpacity(0.2)),
                                          width: size.width * 0.9,
                                          height: size.height * 0.07,
                                          child: Text(
                                            _returnDate == null
                                                ? 'Return Date'
                                                : _returnDate!,
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                      )
                                    : Container() // This empty container means nothing to show
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
