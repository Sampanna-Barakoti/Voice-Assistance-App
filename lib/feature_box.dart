import 'package:flutter/material.dart';
import 'package:voice_assistant/pallete.dart';

class FeatureBox extends StatelessWidget {
  final String headerText;
  final String descriptionText;
  final Color color;
  const FeatureBox({
    super.key,
    required this.color,
    required this.headerText,
    required this.descriptionText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20).copyWith(left: 15),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                headerText,
                style: TextStyle(
                  fontFamily: 'cera pro',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Pallete.blackColor,
                ),
              ),
            ),
            SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                descriptionText,
                style: TextStyle(
                  fontFamily: 'cera pro',
                  color: Pallete.blackColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
