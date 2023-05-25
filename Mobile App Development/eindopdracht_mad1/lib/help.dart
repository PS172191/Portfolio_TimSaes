import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Help', style: TextStyle(color: Colors.red),),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          Text(
            'Welkom bij de Help-pagina van onze Formule 1 app! Hier vindt u antwoorden op veelgestelde vragen en informatie over het gebruik van de app.',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 16.0),
          Text(
            'Veelgestelde vragen',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          ListTile(
            title: Text('Hoe kan ik de ranglijst van de coureurs bekijken?'),
            subtitle: Text('Om de ranglijst van de coureurs te bekijken, ga je naar de "Drivers" tab en scrol je door de lijst van coureurs. De coureurs worden gerangschikt op basis van hun puntenaantal.'),
          ),
          Divider(),
          ListTile(
            title: Text('Hoe kan ik de ranglijst van de teams bekijken?'),
            subtitle: Text('Om de ranglijst van de teams te bekijken, ga je naar de "Constructors" tab en scrol je door de lijst van teams. De teams worden gerangschikt op basis van hun puntenaantal.'),
          ),
          Divider(),
          ListTile(
            title: Text('Hoe kan ik de planning van het seizoen vinden?'),
            subtitle: Text('Om informatie over het huidige seizoen te vinden, ga je naar de "Season" tab. Hier vind je informatie over de races en kun je per race de resultaten zien door er op te klikken.'),
          ),
        ],
      ),
    );
  }
}