import 'package:flutter/material.dart';

class EmptyScoreIcon extends StatelessWidget {
  const EmptyScoreIcon({super.key});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(4.0),
    child: SizedBox(
      width: 36.0,
      height: 36.0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          border: Border.all(color: Colors.grey),
        ),
      ),
    ),
  );
}
