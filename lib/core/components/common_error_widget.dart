import 'package:flutter/material.dart';
import 'package:impero_it_assesment/core/theme/app_text_style.dart';

class CommonErrorWidget extends StatelessWidget {
  const CommonErrorWidget({super.key, this.message = 'Error occurred'});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: AppTextStyle.display.medium.red,
      ),
    );
  }
}
