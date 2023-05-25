import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RaceResultPage extends StatelessWidget {
  final String raceId;
  final String raceName;

  const RaceResultPage({
    Key? key,
    required this.raceId,
    required this.raceName,
  }) : super(key: key);

  Future<List<dynamic>> _fetchRaceResults() async {
    final response = await http
        .get(Uri.parse('https://ergast.com/api/f1/2023/$raceId/results.json'));
    final json = jsonDecode(response.body);
    return json['MRData']['RaceTable']['Races'][0]['Results'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('$raceName Results',
            style: const TextStyle(color: Colors.red)),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _fetchRaceResults(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final driverData = snapshot.data![index]['Driver'];
                final constructorData = snapshot.data![index]['Constructor'];
                return ListTile(
                  leading: Icon(
                    Icons.sports_motorsports,
                    color: Colors.red,
                  ),
                  title: Text(
                      driverData['givenName'] + ' ' + driverData['familyName']),
                  subtitle: Text(constructorData['name']),
                  trailing: Text(snapshot.data![index]['points']),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text('Race nog niet gereden'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
