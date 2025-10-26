import 'package:flutter/material.dart';

class CustomHeightSpace extends StatelessWidget {
  final double? height;

  const CustomHeightSpace({super.key, this.height});

  @override
  Widget build(BuildContext context) => SizedBox(height: height ?? 0);
}

class CustomWidthSpace extends StatelessWidget {
  final double? width;

  const CustomWidthSpace({super.key, this.width});

  @override
  Widget build(BuildContext context) => SizedBox(width: width ?? 0);
}
