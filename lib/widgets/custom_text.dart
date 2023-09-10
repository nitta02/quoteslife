// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  String texxt;
  double fontSize;
  CustomText({
    Key? key,
    required this.texxt,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      texxt,
      style: TextStyle(
        fontSize: fontSize,
      ),
    );
  }
}
