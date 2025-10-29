import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHeightSpaceWidget extends StatelessWidget {
  final double height;
  const CustomHeightSpaceWidget(this.height, {super.key});

  @override
  Widget build(BuildContext context) => SizedBox(height: height.h);
}

class CustomWidthSpaceWidget extends StatelessWidget {
  final double width;
  const CustomWidthSpaceWidget(this.width,{super.key});

  @override
  Widget build(BuildContext context) => SizedBox(width: width.w);
}
