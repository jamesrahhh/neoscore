import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Demo", style: TextStyle(color: Colors.white, fontFamily: "assets/fonts/Inter-Regular.ttf"))), backgroundColor: Colors.black,),
      backgroundColor: Colors.grey,
    );
  }
}
