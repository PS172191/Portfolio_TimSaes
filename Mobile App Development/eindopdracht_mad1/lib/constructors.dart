import 'package:eindopdracht_mad1/drawer.dart';
import 'package:eindopdracht_mad1/appbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TeamsPage extends StatelessWidget {
  const TeamsPage({Key? key}) : super(key: key);

  Future<List<dynamic>> _getConstructorStandings() async {
    final response = await http.get(Uri.parse(
        'https://ergast.com/api/f1/2023/constructorStandings.json'));
    final json = jsonDecode(response.body);
    return json['MRData']['StandingsTable']['StandingsLists'][0]
        ['ConstructorStandings'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Formule1AppBar(),
      drawer: Formule1Drawer(context),
      body: FutureBuilder<List<dynamic>>(
        future: _getConstructorStandings(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final constructorData = snapshot.data![index]['Constructor'];
                return ListTile(
                  leading: const Icon(
                    Icons.construction,
                    color: Colors.blue,
                  ),
                  title: Text(constructorData['name']),
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
