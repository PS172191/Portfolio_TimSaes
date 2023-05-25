import 'package:eindopdracht_mad1/drawer.dart';
import 'package:eindopdracht_mad1/appbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DriversPage extends StatelessWidget {
  const DriversPage({Key? key}) : super(key: key);

  Future<List<dynamic>> _getDriverStandings() async {
    final response = await http.get(
        Uri.parse('https://ergast.com/api/f1/2023/driverStandings.json'));
    final json = jsonDecode(response.body);
    return json['MRData']['StandingsTable']['StandingsLists'][0]
        ['DriverStandings'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Formule1AppBar(),
      drawer: Formule1Drawer(context),
      body: FutureBuilder<List<dynamic>>(
        future: _getDriverStandings(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final driverData = snapshot.data![index]['Driver'];
                final constructorData =
                    snapshot.data![index]['Constructors'][0];
                return ListTile(
                  title: Text(
                      driverData['givenName'] + ' ' + driverData['familyName']),
                  subtitle: Text(constructorData['name']),
                  leading: const Icon(
                    Icons.sports_motorsports,
                    color: Colors.red,
                  ),
                  trailing: Text(snapshot.data![index]['points']),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
