import 'package:flutter/material.dart';

class button extends StatelessWidget {
  final Color bgColor, textColor;
  final String text;

  const button(
      {super.key,
      required this.bgColor,
      required this.textColor,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(45),
        color: bgColor,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 50,
            ),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 20,
                color: textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
