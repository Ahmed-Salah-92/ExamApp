import 'package:flutter/material.dart';

class CustomSnackBar extends StatelessWidget {
  final String? contentText;
  final Color? bkgColor;

  const CustomSnackBar(this.contentText, this.bkgColor, {super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: SnackBar(
        content: Text(contentText ?? "No content provided"),
        backgroundColor:  bkgColor ?? Colors.black,
      ),
    );
  }
}
