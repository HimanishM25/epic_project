import 'package:epic_project/screens/activeDrives.dart';
import 'package:epic_project/screens/homepages/userHomepage.dart';
import 'package:epic_project/screens/marketplace.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class navSetup extends StatefulWidget {
  const navSetup({super.key});

  @override
  State<navSetup> createState() => _navSetupState();
}

class _navSetupState extends State<navSetup> {
  int current_index = 0;
  final _pages = [
    const userHomepage(),
    const activeDrives(),
    const marketplace(),
  ];
  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Morning!';
    }
    if (hour < 17) {
      return 'Afternoon!';
    }
    return 'Evening!';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Good ${greeting()}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                
              ),
            ),
            const CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                  'https://pbs.twimg.com/media/FejTuGpUoAAPexl?format=jpg&name=large'),//add user profile picture after auth. setup
            ),
          ],
        ),
        elevation: 0,
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Theme.of(context).primaryColor,
          backgroundColor: Colors.transparent,
        ),
        child: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite_outline),
              selectedIcon: Icon(Icons.favorite),
              label: 'Donate',
            ),
            NavigationDestination(
              icon: Icon(Icons.local_grocery_store_outlined),
              selectedIcon: Icon(Icons.local_grocery_store),
              label: 'Market',
            ),
          ],
          onDestinationSelected: (int index) {
            setState(() {
              current_index = index;
            });
          },
          selectedIndex: current_index,
        ),
      ),
      body: IndexedStack(
        children: _pages,
        index: current_index,
      ),
    );
  }
}
