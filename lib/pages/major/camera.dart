import 'package:flutter/material.dart';

class Camera extends StatefulWidget {
  const Camera({super.key});

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text("Camera", style: TextStyle(color: Colors.white))),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
    );
  }
}
