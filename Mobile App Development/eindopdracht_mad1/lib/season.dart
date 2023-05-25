import 'package:eindopdracht_mad1/drawer.dart';
import 'package:eindopdracht_mad1/appbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'race_results.dart';

class SeasonPage extends StatelessWidget {
  const SeasonPage({Key? key}) : super(key: key);

  Future<List<dynamic>> _fetchRaceData() async {
    final response =
        await http.get(Uri.parse('https://ergast.com/api/f1/2023.json'));
    final json = jsonDecode(response.body);
    return json['MRData']['RaceTable']['Races'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Formule1AppBar(),
      drawer: Formule1Drawer(context),
      body: FutureBuilder<List<dynamic>>(
        future: _fetchRaceData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final raceData = snapshot.data![index];
                return ListTile(
                  title: Text(raceData['raceName']),
                  subtitle: Text(raceData['date'] + ' - ' + raceData['time']),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RaceResultPage(
                          raceId: raceData['round'],
                          raceName: raceData['raceName'],
                        ),
                      ),
                    );
                  },
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
