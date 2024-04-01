import 'package:flutter/material.dart';
import 'package:neuralflight/components/model/scorehandler.dart';
import 'package:neuralflight/components/widget/scorekeyboard.dart';

/// A button that appears below the last end in a scoresheet for adding another end.
class AddEndButton extends StatelessWidget {
  const AddEndButton(
      {super.key, required this.update, required this.currentSheetID});

  final int currentSheetID;
  final Function() update;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        Scaffold.of(context).showBottomSheet((BuildContext context) {
          return ScoreKeyboard(
            update: update,
            currentSheetID: currentSheetID,
            endIndex: ScoreHandler.scoresheets[currentSheetID].ends.length,
            shotIndex: 0,
          );
        });
      },
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
