import 'package:exam_app/core/values/app_text_styles.dart';
import 'package:exam_app/core/widgets/custom_spacer_widget.dart';
import 'package:flutter/material.dart';

class CustomAppBarWidget extends StatelessWidget {
 final void Function() onBackPressed;
 final bool? showBackButton;
 final String title;
 final Widget body;

  const CustomAppBarWidget(
    this.showBackButton, {
    super.key,
    required this.onBackPressed,
    required this.title,
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
