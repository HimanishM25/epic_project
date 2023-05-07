import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
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
            child: StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection('drives').snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    final snap = snapshot.data!.docs;
                    return ListView.builder(
                      itemCount: snap.length,
                      itemBuilder: (context, index) {
                        return Card(child: Column(
                          children: [
                            Text(snap[index]['DriveName']),
                            Text(snap[index]['DriveOrganizer']),
                          ],
                        ));
                      },
                    );
                  }
                  else{
                    return Placeholder();}
                }),
          ),
        ],
      ),
    );
  }
}
