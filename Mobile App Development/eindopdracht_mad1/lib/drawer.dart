import 'package:eindopdracht_mad1/help.dart';
import 'package:flutter/material.dart';

Drawer Formule1Drawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          child: Text(
            'Menu',
            style: TextStyle(color: Colors.red),
          ),
        ),
        ListTile(
          title: const Text('Help'),
          onTap: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const HelpPage(),
              ),
            );
            if (context.mounted) {
              Navigator.pop(context);
            }
          },
        ),
        ListTile(
          title: const Text('About'),
          onTap: () {
            Navigator.pop(context);
            showAboutDialog(
              context: context,
              applicationIcon: const FlutterLogo(),
              applicationName: 'Eindopdracht MAD 1',
              applicationVersion: '2.0.1',
              children: const [
                Text('Made by Tim Saes'),
                Text('Summa College'),
                Text('Software Developer')
              ],
            );
          },
        ),
      ],
    ),
  );
}
