import 'package:flutter/material.dart';
import 'drivers.dart';
import 'constructors.dart';
import 'season.dart';

void main() {
  runApp(const Formule1());
}

class Formule1 extends StatelessWidget {
  const Formule1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
          length: 3,
          child: Scaffold(
            body: const TabBarView(
              children: [
                DriversPage(),
                TeamsPage(),
                SeasonPage(),
              ],
            ),
            bottomNavigationBar: _bottomNavigation(),
          )),
    );
  }

  Widget _bottomNavigation() {
    return SizedBox(
      height: 80,
      child: Container(
        color: Colors.black,
        child: TabBar(
          tabs: [
            Tab(
              icon: Column(
                children: const [
                  Icon(
                    Icons.sports_motorsports,
                    color: Colors.red,
                  ),
                  Text(
                    'Drivers',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Tab(
              icon: Column(
                children: const [
                  Icon(
                    Icons.construction,
                    color: Colors.red,
                  ),
                  Text(
                    'Constructors',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Tab(
              icon: Column(
                children: const [
                  Icon(
                    Icons.flag,
                    color: Colors.red,
                  ),
                  Text(
                    'Season',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
