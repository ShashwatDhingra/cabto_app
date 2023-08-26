import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Expanded(
          flex: 3,
          child: ListView(
            children: [
              DrawerHeader(
                  child: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, size: 100, color: Colors.grey[100]),
              ))
            ],
          ),
        ),
        const Expanded(
          flex: 8,
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.payment),
                title: Text('Payment'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Setting'),
              ),
              ListTile(
                leading: Icon(Icons.support),
                title: Text('Support'),
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text('About'),
              ),
              Spacer(),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Log-Out'),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
