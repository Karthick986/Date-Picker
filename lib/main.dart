import 'package:date_picker_test/strings/assets_constant.dart';
import 'package:date_picker_test/strings/value_strings.dart';
import 'package:date_picker_test/utilities/colors_utility.dart';
import 'package:date_picker_test/utilities/global_utility.dart';
import 'package:date_picker_test/utilities/text_utility.dart';
import 'package:date_picker_test/widgets/button_widget.dart';
import 'package:date_picker_test/widgets/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ValueStrings.customDatePicker,
      theme: ThemeData(
        fontFamily: 'Roboto'
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime? withoutPresetDate;
  DateTime? with4PresetDate;
  DateTime? with6PresetDate;

  withoutPreset(context) async {
    DateTime? newDateTime = await showRoundedDatePicker(
      initialDate: withoutPresetDate,
      context: context,
      textNegativeButton: "Cancel",
      textPositiveButton: "Save",
      height: buildHeight(context) * 0.4,
      theme: ThemeData(primarySwatch: Colors.blue),
      customWeekDays: ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"],
    );
    setState(() {
      if (newDateTime!=null) {
        withoutPresetDate = newDateTime;
      }
    });
  }

  with4Preset(context) async {
    DateTime? newDateTime = await showRoundedDatePicker(
      initialDate: with4PresetDate,
      context: context,
      textNegativeButton: "Cancel",
      textPositiveButton: "Save",
      with4Presets: true,
      height: buildHeight(context) * 0.4,
      theme: ThemeData(primarySwatch: Colors.blue),
      customWeekDays: ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"],
    );
    setState(() {
      if (newDateTime!=null) {
        with4PresetDate = newDateTime;
      }
    });
  }

  with6Preset(context) async {
    DateTime? newDateTime = await showRoundedDatePicker(
      initialDate: with6PresetDate,
      context: context,
      textNegativeButton: "Cancel",
      textPositiveButton: "Save",
      with6Presets: true,
      height: buildHeight(context) * 0.4,
      theme: ThemeData(primarySwatch: Colors.blue),
      customWeekDays: ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"],
    );
    setState(() {
      if (newDateTime != null) {
        with6PresetDate = newDateTime;
      }
    });
  }

  constantHeight() {
    return SizedBox(
      height: buildHeight(context) * 0.05,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            ValueStrings.calenderWidgets,
                            style: TextStyleUtility.bolTextStyleColor(
                                21, ColorsUtility.textColor),
                          ),
                          margin: EdgeInsets.all(buildWidth(context) * 0.1),
                        ),
                        ButtonWidget(
                          text: ValueStrings.withoutPreset,
                          onPressed: withoutPreset,
                          color: ColorsUtility.blueColor,
                          width: buildWidth(context)*0.9,
                        ),
                        withoutPresetDate != null
                            ? Container(
                          height: buildHeight(context)*0.05,
                                padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SvgPicture.asset(AssetsConstant.calendarDisplay),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                                      child: Text(
                                        DateFormat("dd MMM yyy")
                                            .format(withoutPresetDate!),
                                        style: TextStyleUtility.textStyleColor(
                                            14, ColorsUtility.blueColor),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          withoutPresetDate = null;
                                        });
                                      },
                                      child: SvgPicture.asset(AssetsConstant.close),
                                    )
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.blue[50],
                                    borderRadius: BorderRadius.circular(16)),
                                margin: const EdgeInsets.all(8),
                              )
                            : Container(height: buildHeight(context)*0.05),
                        constantHeight(),
                        ButtonWidget(
                          text: ValueStrings.with4Preset,
                          onPressed: with4Preset,
                          color: ColorsUtility.blueColor,
                          width: buildWidth(context)*0.9,
                        ),
                        with4PresetDate != null
                            ? Container(
                          height: buildHeight(context)*0.05,
                          padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(AssetsConstant.calendarDisplay),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                                child: Text(
                                  DateFormat("dd MMM yyy")
                                      .format(with4PresetDate!),
                                  style: TextStyleUtility.textStyleColor(
                                      14, ColorsUtility.blueColor),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    with4PresetDate = null;
                                  });
                                },
                                child: SvgPicture.asset(AssetsConstant.close),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Colors.blue[50],
                              borderRadius: BorderRadius.circular(16)),
                          margin: const EdgeInsets.all(8),
                        )
                            : Container(height: buildHeight(context)*0.05),
                        constantHeight(),
                        ButtonWidget(
                          text: ValueStrings.with6Preset,
                          onPressed: with6Preset,
                          color: ColorsUtility.blueColor,
                          width: buildWidth(context)*0.9,
                        ),
                        with6PresetDate != null
                            ? Container(
                          height: buildHeight(context)*0.05,
                          padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(AssetsConstant.calendarDisplay),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                                child: Text(
                                  DateFormat("dd MMM yyy")
                                      .format(with6PresetDate!),
                                  style: TextStyleUtility.textStyleColor(
                                      14, ColorsUtility.blueColor),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    with6PresetDate = null;
                                  });
                                },
                                child: SvgPicture.asset(AssetsConstant.close),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Colors.blue[50],
                              borderRadius: BorderRadius.circular(16)),
                          margin: const EdgeInsets.all(8),
                        )
                            : Container(height: buildHeight(context)*0.05),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Text(ValueStrings.myName,
                  style: TextStyleUtility.normalTextStyle(16)),
              alignment: Alignment.center,
              margin: const EdgeInsets.all(16),
            )
          ],
        ));
  }
}
