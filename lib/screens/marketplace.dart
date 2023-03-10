import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class marketplace extends StatefulWidget {
  const marketplace({super.key});

  @override
  State<marketplace> createState() => _marketplaceState();
}

class _marketplaceState extends State<marketplace> {
  String item_name = 'Watermelon';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome to the Farmer\'s Market!',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            'Buy fresh produce directly from farmers.',
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(height: 20),
          //make a listview of the products
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Image.asset('assets/images/Marketplaceholder.png'),
                    title: Text('$item_name'),
                    subtitle: Text('Price: \$${Random().nextInt(100)}'),
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
