
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/contact_screen.dart';
import 'package:flutter_application_1/screen/settings_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 6,
      child: Column(
        children: [
        const UserAccountsDrawerHeader(
        decoration: BoxDecoration(color:  Color(0xff764abc)),
        accountName: Text(
          "Prince LAWSON",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        accountEmail: Text(
          "princelawson93@gmail.com",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: Colors.white60
          ),
        ),
        currentAccountPicture: FlutterLogo(),
      ),
        const SizedBox(height: 10),
        ListTile(
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
          leading: const Icon(Icons.home),
          title: const Text(
            'Home',
            style: TextStyle(fontSize: 20),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SettingsScreen()),
          );
          },
          leading: const Icon(Icons.settings),
          title: const Text(
            'Settings',
            style: TextStyle(fontSize: 20),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ContactScreen()),
            );
          },
          leading: const Icon(Icons.contact_mail),
          title: const Text(
            'Contact',
            style: TextStyle(fontSize: 20),
          ),
        ),
        const SizedBox(height: 50,),
        const Padding(
              padding: EdgeInsets.fromLTRB(12, 100, 12, 2),
              child: Text("from",style: TextStyle(fontSize: 10, color: Colors.black38),),
            ),
            const Text("PrinceTheprog",style: TextStyle(fontSize: 12),)

      ]),
    );
  }
}