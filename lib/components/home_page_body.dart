import 'package:cabto_app/components/cab_options_tab.dart';
import 'package:cabto_app/components/map_view.dart';
import 'package:cabto_app/view_model/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyProvider>(context);
    return Column(
      children: [
        Expanded(flex: provider.ratio[0], child: MapView()),
        Expanded(flex: provider.ratio[1], child: CabOptionTab())
      ],
    );
  }
}
