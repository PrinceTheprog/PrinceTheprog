import 'package:flutter/material.dart';
import './drawer.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Scrollbar(
        child: Column(
          children: const [
            ListTile(title: Text("Thème"),leading: Icon(Icons.change_circle)),
            ListTile(title: Text("Notifications"),leading: Icon(Icons.notifications)),
            ListTile(title: Text("Utilisation données et stockage"),leading: Icon(Icons.connect_without_contact)),
            ListTile(title: Text("Conditions légales"),leading: Icon(Icons.content_copy)),
            ListTile(title: Text("Langue de l'application"),leading: Icon(Icons.language)),
            ListTile(title: Text("Aide"),leading: Icon(Icons.help)),
            ListTile(title: Text("Inviter un(e) ami(e)"),leading: Icon(Icons.person)),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 100, 12, 2),
              child: Text("from",style: TextStyle(fontSize: 10, color: Colors.black38),),
            ),
            Text("PrinceTheprog",style: TextStyle(fontSize: 12),)



          ],
        ),
      ),
    );
  }
}