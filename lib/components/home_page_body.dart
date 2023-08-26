import 'package:cabto_app/components/cab_options_tab.dart';
import 'package:flutter/material.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> with SingleTickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(
          flex: 5,
          child: Placeholder()),
        Expanded(
          flex: 5,
          child: CabOptionTab())
      ],
    );
  }
}