import 'package:cabto_app/components/tabs/city_cab_tab.dart';
import 'package:cabto_app/components/tabs/outstation_tab.dart';
import 'package:cabto_app/components/tabs/rental_cab_tab.dart';
import 'package:cabto_app/utils/cosnt/cosnts.dart';
import 'package:flutter/material.dart';

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
    return const DefaultTabController(
        length: 3,
        child: Column(children: [
          TabBar(
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.black,
            overlayColor: MaterialStatePropertyAll(Colors.transparent),
            labelColor: Colors.black,
            tabs: [
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
            children: [
              CityCabTab(),
              RentalCabTab(),
              OutStationTab()
            ],
          ))
        ]));
  }
}
