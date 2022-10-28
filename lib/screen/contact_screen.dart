import 'package:flutter/material.dart';
import './drawer.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: const Text('Contact'),
      ),
      body: const Center(
        child: Text('Contact Us', style: TextStyle(fontSize: 30)),
      ),
    );
  }
}