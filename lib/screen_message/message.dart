import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'dart:math' as math;

import 'package:flutter_application_1/screen/drawer.dart';

class Message extends StatelessWidget {
  const Message({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KindaCode.com',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final ScrollController _firstController = ScrollController();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('MyChat'),
          leading:  IconButton(
            icon: const Icon(Icons.arrow_back), 
            onPressed: () { Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyApp()),
          );},),
        ),
        
        body: 
          SingleChildScrollView(
              child :Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: const [
                    SizedBox(height: 10,),
                    InBubble(message: 'Hello'),
                    OutBubble(message: 'Hi there'),
                    OutBubble(message: 'How it going?'),
                    InBubble(message: 'Everything is OK'),
                    OutBubble(message: 'Goodbye'),
                    InBubble(message: 'See you soon'),
                    InBubble(message: 'Hello'),
                    OutBubble(message: 'Hi there'),
                    OutBubble(message: 'How it going?'),
                    InBubble(message: 'Everything is OK'),
                    OutBubble(message: 'Goodbye'),
                    InBubble(message: 'See you soon'),
                    
                    SizedBox(height: 240,),
                    TextField(
                      decoration: InputDecoration(
                        icon: Icon(Icons.send),
                        hintText: 'Entrer votre texte',
                        helperText: ' Text',
                        counterText: '0 characters',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    
                  ],
                ),
              ),
        ));
  }
}

//  Received message bubble
class InBubble extends StatelessWidget {
  final String message;
  const InBubble({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(math.pi),
          child: CustomPaint(
            painter: Triangle(Colors.grey.shade300),
          ),
        ),
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(19),
                bottomLeft: Radius.circular(19),
                bottomRight: Radius.circular(19),
              ),
            ),
            child: Text(
              message,
              style: const TextStyle(color: Colors.black, fontSize: 15),
            ),
          ),
        ),
      ],
    );
  }
}

// Sent message bubble
class OutBubble extends StatelessWidget {
  final String message;
  const OutBubble({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
              color: Colors.indigo.shade600,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(19),
                bottomLeft: Radius.circular(19),
                bottomRight: Radius.circular(19),
              ),
            ),
            child: Text(
              message,
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ),
        CustomPaint(painter: Triangle(Colors.indigo.shade600)),
      ],
    );
  }
}

// Create a custom triangle
class Triangle extends CustomPainter {
  final Color backgroundColor;
  Triangle(this.backgroundColor);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = backgroundColor;

    var path = Path();
    path.lineTo(-5, 0);
    path.lineTo(0, 10);
    path.lineTo(5, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}