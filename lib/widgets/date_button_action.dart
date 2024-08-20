import 'package:date_picker_test/utilities/colors_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import '../strings/assets_constant.dart';

class FlutterRoundedButtonAction extends StatelessWidget {
  final String? textButtonNegative;
  final String? textButtonPositive;
  final String? textActionButton;
  final VoidCallback? onTapButtonNegative; // Default is "Cancel" button.
  final VoidCallback? onTapButtonPositive; // Default is "OK" button.
  final VoidCallback? onTapButtonAction; // Default is "Action" button which will be on the left.
  final TextStyle? textStyleButtonAction;
  final TextStyle? textStyleButtonPositive;
  final TextStyle? textStyleButtonNegative;
  final MaterialLocalizations localizations;
  final double borderRadius;
  final EdgeInsets? paddingActionBar;
  final Color? background;
  final DateTime currentDate;

  const FlutterRoundedButtonAction(
      {Key? key,
        required this.currentDate,
        required this.localizations,
        this.textButtonNegative,
        this.textButtonPositive,
        this.textActionButton,
        this.onTapButtonAction,
        this.onTapButtonPositive,
        this.onTapButtonNegative,
        this.textStyleButtonPositive,
        this.textStyleButtonNegative,
        this.textStyleButtonAction,
        required this.borderRadius,
        this.paddingActionBar,
        this.background})
      : super(key: key);

  List<Widget> _buildActionsButton() {
    final Widget negativeButton = MaterialButton(
      child: Text(
        textButtonNegative ?? localizations.cancelButtonLabel,
        style: textStyleButtonNegative,
      ),
      onPressed: onTapButtonNegative,
      color: ColorsUtility.lightBlueColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
    );

    final Widget positiveButton = MaterialButton(
      child: Text(
        textButtonPositive ?? localizations.okButtonLabel,
        style: textStyleButtonPositive,
      ),
      color: ColorsUtility.blueColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      onPressed: onTapButtonPositive,
    );

    if (textActionButton != null) {
      final Widget leftButton = MaterialButton(
        child: Text(textActionButton!, style: textStyleButtonAction),
        onPressed: onTapButtonAction,
      );
      return [
        leftButton,
        Row(children: <Widget>[negativeButton,positiveButton])
      ];
    }

    return [Container(child: negativeButton,margin: EdgeInsets.all(4),), Container(child: positiveButton,
      margin: EdgeInsets.all(4),)];
  }

  List<Widget> _calenderWidget() {
    return [Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: SvgPicture.asset(AssetsConstant.calendarPick),
    ), SizedBox(width: 8,),Text(DateFormat("dd MMM yyyy").format(currentDate))];
  }

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return Container(
      padding: paddingActionBar,
      decoration: BoxDecoration(
          color: background,
          borderRadius:
          orientation == Orientation.landscape ? BorderRadius.only(bottomRight: Radius.circular(borderRadius)) : BorderRadius.vertical(bottom: Radius.circular(borderRadius))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: _calenderWidget(),
          ),
          SizedBox(width: 8,),
          Row(
            mainAxisAlignment: textActionButton != null ? MainAxisAlignment.spaceBetween : MainAxisAlignment.end,
            children: _buildActionsButton(),
          ),
        ],
      ),
    );
  }
}
