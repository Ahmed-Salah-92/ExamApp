import 'package:exam_app/core/values/app_text_styles.dart';
import 'package:exam_app/core/widgets/custom_spacer_widget.dart';
import 'package:flutter/material.dart';

class CustomAppBarWidget extends StatelessWidget {
  void Function() onBackPressed;
  bool? showBackButton;
  String title;
  // double topAppBarHeight;
  // double bottomAppBarHeight;
  //List<Widget?> children;
  Widget body;

  CustomAppBarWidget(
    this.showBackButton, {
    super.key,
    required this.onBackPressed,
    required this.title,
    // required this.topAppBarHeight,
    // required this.bottomAppBarHeight,
    //required this.children,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    final bool displayBackButton = showBackButton ?? false;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(title, style: AppTextStyles.black20MediumInter),
        leading: displayBackButton
            ? IconButton(
                onPressed: onBackPressed,
                icon: const Icon(Icons.arrow_back_ios),
              )
            : const CustomWidthSpaceWidget(16),
      ),
      body: body,
    );
  }
}

// return Scaffold(
// body: Column(
// children: [
// CustomHeightSpaceWidget(topAppBarHeight.h),
// Row(
// children: [
// displayBackButton
// ? IconButton(
// onPressed: onBackPressed,
// icon: const Icon(Icons.arrow_back_ios),
// )
//     : const CustomWidthSpaceWidget(16),
// // const CustomWidthSpaceWidget(8),
// Text(title, style: AppTextStyles.black20MediumInter),
// ],
// ),
// CustomHeightSpaceWidget(bottomAppBarHeight.h),
// ...children.whereType<Widget>(),
// ],
// ),
// );
