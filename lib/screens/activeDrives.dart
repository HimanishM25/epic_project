import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class activeDrives extends StatefulWidget {
  const activeDrives({super.key});

  @override
  State<activeDrives> createState() => _activeDrivesState();
}

class _activeDrivesState extends State<activeDrives> {
  @override
  String drive_name = 'Drive Name';
  String drive_host = 'Unicef';
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Donate to a campaign today',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'You can donate to a campaign you\'re interested in.',
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(
            height: 20,
          ),
          //make a listview of the products
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Image.asset('assets/images/Donateplaceholder.png'),
                    title: Text('$drive_name'),
                    subtitle: Text('Organized by ${drive_host}'),
                    trailing: const Icon(Icons.arrow_forward),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
