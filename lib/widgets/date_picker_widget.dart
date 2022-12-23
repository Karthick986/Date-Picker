import 'dart:async';
import 'package:date_picker_test/widgets/date_picker_dialog.dart';
import 'package:date_picker_test/widgets/date_picker_style.dart';
import 'package:date_picker_test/widgets/day_picker.dart';
import 'package:date_picker_test/widgets/era_mode.dart';
import 'package:date_picker_test/widgets/year_picker_style.dart';
import 'package:flutter/material.dart';

Future<DateTime?> showRoundedDatePicker(
    {required BuildContext context,
    double? height,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
    SelectableDayPredicate? selectableDayPredicate,
    DatePickerMode initialDatePickerMode = DatePickerMode.day,
    Locale? locale,
    TextDirection? textDirection,
    ThemeData? theme,
    double borderRadius = 16,
    EraMode era = EraMode.CHRIST_YEAR,
    ImageProvider? imageHeader,
    String description = "",
    String? fontFamily,
    bool barrierDismissible = false,
    Color background = Colors.transparent,
    String? textNegativeButton,
    String? textPositiveButton,
    String? textActionButton,
    VoidCallback? onTapActionButton,
    MaterialRoundedDatePickerStyle? styleDatePicker,
    MaterialRoundedYearPickerStyle? styleYearPicker,
    List<String>? customWeekDays,
    BuilderDayOfDatePicker? builderDay,
    List<DateTime>? listDateDisabled, bool? with4Presets, bool? with6Presets,
    OnTapDay? onTapDay}) async {
  initialDate ??= DateTime.now();
  firstDate ??= DateTime(1900);
  lastDate ??= DateTime(2100);
  theme ??= ThemeData();

  assert(
    !initialDate.isBefore(firstDate),
    'initialDate must be on or after firstDate',
  );
  assert(
    !initialDate.isAfter(lastDate),
    'initialDate must be on or before lastDate',
  );
  assert(
    !firstDate.isAfter(lastDate),
    'lastDate must be on or after firstDate',
  );
  assert(
    selectableDayPredicate == null || selectableDayPredicate(initialDate),
    'Provided initialDate must satisfy provided selectableDayPredicate',
  );
  assert(
    (onTapActionButton != null && textActionButton != null) ||
        onTapActionButton == null,
    "If you provide onLeftBtn, you must provide leftBtn",
  );
  assert(debugCheckHasMaterialLocalizations(context));

  Widget child = GestureDetector(
    onTap: () {
      if (!barrierDismissible) {
        Navigator.pop(context);
      }
    },
    child: Container(
      color: background,
      child: GestureDetector(
        onTap: () {
          //
        },
        child: FlutterRoundedDatePickerDialog(
          height: height,
          initialDate: initialDate,
          firstDate: firstDate,
          lastDate: lastDate,
          selectableDayPredicate: selectableDayPredicate,
          initialDatePickerMode: initialDatePickerMode,
          era: era,
          locale: locale,
          borderRadius: borderRadius,
          imageHeader: imageHeader,
          description: description,
          fontFamily: fontFamily,
          textNegativeButton: textNegativeButton,
          textPositiveButton: textPositiveButton,
          textActionButton: textActionButton,
          onTapActionButton: onTapActionButton,
          styleDatePicker: styleDatePicker,
          styleYearPicker: styleYearPicker,
          customWeekDays: customWeekDays,
          builderDay: builderDay,
          listDateDisabled: listDateDisabled,
          onTapDay: onTapDay,
          with4Presets: with4Presets,
          with6Presets: with6Presets,
        ),
      ),
    ),
  );

  if (textDirection != null) {
    child = Directionality(
      textDirection: textDirection,
      child: child,
    );
  }

  if (locale != null) {
    child = Localizations.override(
      context: context,
      locale: locale,
      child: child,
    );
  }

  return await showDialog<DateTime>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (_) => Theme(data: theme!, child: child),
  );
}
