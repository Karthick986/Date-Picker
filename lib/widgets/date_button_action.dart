import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
    final Widget negativeButton = FlatButton(
      child: Text(
        textButtonNegative ?? localizations.cancelButtonLabel,
        style: textStyleButtonNegative,
      ),
      onPressed: onTapButtonNegative,
      color: Colors.lightBlue[50],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );

    final Widget positiveButton = FlatButton(
      child: Text(
        textButtonPositive ?? localizations.okButtonLabel,
        style: textStyleButtonPositive,
      ),
      color: Colors.blueAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      onPressed: onTapButtonPositive,
    );

    if (textActionButton != null) {
      final Widget leftButton = FlatButton(
        child: Text(textActionButton!, style: textStyleButtonAction),
        onPressed: onTapButtonAction,
      );
      return [
        leftButton,
        Row(children: <Widget>[negativeButton, positiveButton])
      ];
    }

    return [negativeButton, positiveButton];
  }

  List<Widget> _calenderWidget() {
    return [const Icon(Icons.calendar_today_rounded, color: Colors.blueAccent,), Text(DateFormat("dd MMM yyyy").format(currentDate))];
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
          ButtonBar(
            children: _calenderWidget(),
          ),
          ButtonBar(
            alignment: textActionButton != null ? MainAxisAlignment.spaceBetween : MainAxisAlignment.end,
            children: _buildActionsButton(),
          ),
        ],
      ),
    );
  }
}
