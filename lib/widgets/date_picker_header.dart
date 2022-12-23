import 'package:date_picker_test/widgets/date_picker_style.dart';
import 'package:date_picker_test/widgets/era_mode.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FlutterRoundedDatePickerHeader extends StatefulWidget {
  DateTime selectedDate;
  final DatePickerMode mode;
  final Function onDateChanged;
  final ValueChanged<DatePickerMode> onModeChanged;
  final Orientation orientation;
  final MaterialRoundedDatePickerStyle? style;

  /// Era custom
  final EraMode era;

  /// Border
  final double borderRadius;

  ///  Header
  final ImageProvider? imageHeader;

  /// Header description
  final String description;

  /// Font
  final String? fontFamily;

  final bool? with4Presets;
  final bool? with6Presets;

  FlutterRoundedDatePickerHeader(
      {Key? key,
      required this.selectedDate,
      required this.mode,
      required this.onModeChanged,
      required this.orientation,
      required this.era,
      required this.borderRadius,
      required this.with4Presets,
      required this.with6Presets,
      this.imageHeader,
      this.description = "",
      this.fontFamily,
      required this.onDateChanged,
      this.style})
      : super(key: key);

  @override
  State<FlutterRoundedDatePickerHeader> createState() =>
      _FlutterRoundedDatePickerHeaderState();
}

class _FlutterRoundedDatePickerHeaderState
    extends State<FlutterRoundedDatePickerHeader> {
  void _handleChangeMode(DatePickerMode value) {
    if (value != widget.mode) widget.onModeChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    final MaterialLocalizations localizations =
        MaterialLocalizations.of(context);
    final ThemeData themeData = Theme.of(context);
    final TextTheme headerTextTheme = themeData.primaryTextTheme;
    Color? dayColor;
    Color? yearColor;
    switch (themeData.primaryColorBrightness) {
      case Brightness.light:
        dayColor =
            widget.mode == DatePickerMode.day ? Colors.black87 : Colors.black54;
        yearColor = widget.mode == DatePickerMode.year
            ? Colors.black87
            : Colors.black54;
        break;
      case Brightness.dark:
        dayColor =
            widget.mode == DatePickerMode.day ? Colors.white : Colors.white70;
        yearColor =
            widget.mode == DatePickerMode.year ? Colors.white : Colors.white70;
        break;
    }

    if (widget.style?.textStyleDayButton?.color != null) {
      widget.style?.textStyleDayButton =
          widget.style?.textStyleDayButton?.copyWith(color: dayColor);
    }

    if (widget.style?.textStyleDayButton?.fontFamily != null) {
      widget.style?.textStyleDayButton = widget.style?.textStyleDayButton
          ?.copyWith(fontFamily: widget.fontFamily);
    }

    final TextStyle dayStyle = widget.style?.textStyleDayButton ??
        headerTextTheme.headline4!
            .copyWith(color: dayColor, fontFamily: widget.fontFamily);
    final TextStyle yearStyle = widget.style?.textStyleYearButton ??
        headerTextTheme.subtitle1!
            .copyWith(color: yearColor, fontFamily: widget.fontFamily);

    Color? backgroundColor;
    if (widget.style?.backgroundHeader != null) {
      backgroundColor = widget.style?.backgroundHeader;
    } else {
      switch (themeData.brightness) {
        case Brightness.dark:
          backgroundColor = themeData.backgroundColor;
          break;
        case Brightness.light:
          backgroundColor = themeData.primaryColor;
          break;
      }
    }

    EdgeInsets padding;
    MainAxisAlignment mainAxisAlignment;
    switch (widget.orientation) {
      case Orientation.landscape:
        padding = widget.style?.paddingDateYearHeader ?? const EdgeInsets.all(8.0);
        mainAxisAlignment = MainAxisAlignment.start;
        break;
      case Orientation.portrait:
      default:
        padding = widget.style?.paddingDateYearHeader ?? const EdgeInsets.all(16.0);
        mainAxisAlignment = MainAxisAlignment.center;
        break;
    }

    final Widget yearButton = IgnorePointer(
      ignoring: widget.mode != DatePickerMode.day,
      ignoringSemantics: false,
      child: _DateHeaderButton(
        color: Colors.transparent,
        onTap: Feedback.wrapForTap(
          () => _handleChangeMode(DatePickerMode.year),
          context,
        ),
        child: Semantics(
          selected: widget.mode == DatePickerMode.year,
          child: Text(
            "${calculateYearEra(widget.era, widget.selectedDate.year)}",
            style: yearStyle,
          ),
        ),
      ),
    );

    final Widget dayButton = IgnorePointer(
      ignoring: widget.mode == DatePickerMode.day,
      ignoringSemantics: false,
      child: _DateHeaderButton(
        color: Colors.transparent,
        onTap: Feedback.wrapForTap(
          () => _handleChangeMode(DatePickerMode.day),
          context,
        ),
        child: Semantics(
          selected: widget.mode == DatePickerMode.day,
          child: Text(
            localizations.formatMediumDate(widget.selectedDate),
            textScaleFactor: 1,
            style: dayStyle,
          ),
        ),
      ),
    );

    BorderRadius borderRadiusData = BorderRadius.only(
      topLeft: Radius.circular(widget.borderRadius),
      topRight: Radius.circular(widget.borderRadius),
    );

    if (widget.orientation == Orientation.landscape) {
      borderRadiusData = BorderRadius.only(
        topLeft: Radius.circular(widget.borderRadius),
        bottomLeft: Radius.circular(widget.borderRadius),
      );
    }

    return Container(
      margin: const EdgeInsets.only(top: 8),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(16), topLeft: Radius.circular(16))),
      child: widget.with4Presets == null && widget.with6Presets == null
          ? Container()
          : widget.with4Presets != null
              ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              child: FlatButton(
                            child: const  Text(
                              'Never ends',
                              style: TextStyle(color: Colors.blueAccent),
                            ),
                            onPressed: () {},
                            color: Colors.lightBlue[50],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                          )),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: FlatButton(
                              child: const Text(
                                '15 days later',
                                style: TextStyle(color: Colors.blueAccent),
                              ),
                              onPressed: () => widget.onDateChanged(
                                  DateTime.now().add(const Duration(days: 15))),
                              color: Colors.lightBlue[50],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: FlatButton(
                              child: const Text(
                                '30 days later',
                                style: TextStyle(color: Colors.blueAccent),
                              ),
                              onPressed: () => widget.onDateChanged(
                                  DateTime.now().add(const Duration(days: 30))),
                              color: Colors.lightBlue[50],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: FlatButton(
                              child: const Text(
                                '60 days later',
                                style: TextStyle(color: Colors.blueAccent),
                              ),
                              onPressed: () => widget.onDateChanged(
                                  DateTime.now().add(const Duration(days: 60))),
                              color: Colors.lightBlue[50],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              child: FlatButton(
                            child: const Text(
                              'Yesterday',
                              style: TextStyle(color: Colors.blueAccent),
                            ),
                            onPressed: () => widget.onDateChanged(
                                DateTime.now().subtract(const Duration(days: 1))),
                            color: Colors.lightBlue[50],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                          )),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: FlatButton(
                              child: const Text(
                                'Today',
                                style: TextStyle(color: Colors.blueAccent),
                              ),
                              onPressed: () =>
                                  widget.onDateChanged(DateTime.now()),
                              color: Colors.lightBlue[50],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: FlatButton(
                              child: const Text(
                                'Tomorrow',
                                style: TextStyle(color: Colors.blueAccent),
                              ),
                              onPressed: () => widget.onDateChanged(
                                  DateTime.now().add(const Duration(days: 1))),
                              color: Colors.lightBlue[50],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: FlatButton(
                              child: const Text(
                                'This Saturday',
                                style: TextStyle(color: Colors.blueAccent),
                              ),
                              onPressed: () {
                                for (int i=0; i<5; i++) {
                                  if (DateFormat.EEEE().format(DateTime.now().add(Duration(days: i))) == "Saturday") {
                                    widget.onDateChanged(DateTime.now().add(Duration(days: i)));
                                    break;
                                  }
                                }
                              },
                              color: Colors.lightBlue[50],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: FlatButton(
                              child: const Text(
                                'This Sunday',
                                style: TextStyle(color: Colors.blueAccent),
                              ),
                              onPressed: () {
                                for (int i=0; i<5; i++) {
                                  if (DateFormat.EEEE().format(DateTime.now().add(Duration(days: i))) == "Sunday") {
                                    widget.onDateChanged(DateTime.now().add(Duration(days: i)));
                                    break;
                                  }
                                }
                              },
                              color: Colors.lightBlue[50],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: FlatButton(
                              child: const Text(
                                'Next Tuesday',
                                style: TextStyle(color: Colors.blueAccent),
                              ),
                              onPressed: () {
                                for (int i=1; i<6; i++) {
                                  if (DateFormat.EEEE().format(DateTime.now().add(Duration(days: i))) == "Tuesday") {
                                    widget.onDateChanged(DateTime.now().add(Duration(days: i)));
                                    break;
                                  }
                                }
                              },
                              color: Colors.lightBlue[50],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
    );
  }
}

class _DateHeaderButton extends StatelessWidget {
  const _DateHeaderButton({
    Key? key,
    this.onTap,
    this.color,
    this.child,
  }) : super(key: key);

  final VoidCallback? onTap;
  final Color? color;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Material(
      type: MaterialType.button,
      color: color,
      child: InkWell(
        borderRadius: kMaterialEdges[MaterialType.button],
        highlightColor: theme.highlightColor,
        splashColor: theme.splashColor,
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: child,
        ),
      ),
    );
  }
}
