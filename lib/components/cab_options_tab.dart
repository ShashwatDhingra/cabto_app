import 'dart:math';

import 'package:cabto_app/components/tabs/city_cab_tab.dart';
import 'package:cabto_app/components/tabs/outstation_tab.dart';
import 'package:cabto_app/components/tabs/rental_cab_tab.dart';
import 'package:cabto_app/services/utils/cosnt/cosnts.dart';
import 'package:cabto_app/view/book_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/provider.dart';

class CabOptionTab extends StatefulWidget {
  const CabOptionTab({super.key});

  @override
  State<CabOptionTab> createState() => _CabOptionTabState();
}

class _CabOptionTabState extends State<CabOptionTab> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyProvider>(context);
    return DefaultTabController(
        length: 3,
        child: Column(children: [
          TabBar(
            onTap: (value) {
              // Conditions for setting ratio of element on screen
              if (value == 0) {
                provider.toogleRatio([7, 2]);
              } else {
                provider.toogleRatio([7, 5]);
              }
            },
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.black,
            overlayColor: MaterialStatePropertyAll(Colors.transparent),
            labelColor: Colors.black,
            tabs: const [
              Tab(
                icon: Icon(
                  Icons.local_taxi,
                  size: 40,
                ),
                text: 'CityCab',
              ),
              Tab(
                icon: Icon(
                  Icons.car_rental,
                  size: 40,
                ),
                text: 'Rental Cab',
              ),
              Tab(
                icon: Icon(
                  Icons.hail_outlined,
                  size: 40,
                ),
                text: 'OutStation',
              )
            ],
          ),
          Expanded(
              child: TabBarView(
            children: [CityCabTab(), RentalCabTab(), OutStationTab()],
          ))
        ]));
  }
}
