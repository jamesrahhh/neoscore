import 'package:flutter/material.dart';

/// A button that appears below the last end in a scoresheet for adding another end.
class AddEndButton extends StatelessWidget {
  final int currentSheetID;
  final double screenWidth;

  const AddEndButton(
      {super.key, required this.currentSheetID, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        height: 40,
        width: screenWidth - 80,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey, width: 1.0)),
            child: const Icon(
              Icons.add_rounded,
              color: Colors.grey,
              size: 15,
            ),
          ),
        ),
      ),
    );
  }
}
