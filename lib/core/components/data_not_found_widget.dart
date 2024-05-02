import 'package:flutter/cupertino.dart';
import 'package:impero_it_assesment/core/theme/app_text_style.dart';

class DataNotFound extends StatelessWidget {
  const DataNotFound({super.key, this.message = "No data found"});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: AppTextStyle.title.medium.black,
      ),
    );
  }
}
