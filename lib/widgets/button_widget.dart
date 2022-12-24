import 'package:date_picker_test/utilities/colors_utility.dart';
import 'package:date_picker_test/utilities/text_utility.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Color? color;
  final Color? textColor;
  final Function onPressed;
  final double? width;
  const ButtonWidget({Key? key, required this.text, this.color,
  required this.onPressed, this.textColor, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: MaterialButton(
        height: 50,
        onPressed: () => onPressed(context),
        child: Text(text, style: TextStyleUtility.textStyleColor(19, ColorsUtility.whiteColor)),
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        ),
      ),
    );
  }
}
