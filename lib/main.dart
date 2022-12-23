import 'package:date_picker_test/strings/value_strings.dart';
import 'package:date_picker_test/utilities/colors_utility.dart';
import 'package:date_picker_test/utilities/global_utility.dart';
import 'package:date_picker_test/utilities/text_utility.dart';
import 'package:date_picker_test/widgets/button_widget.dart';
import 'package:date_picker_test/widgets/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      title: 'Custom Date Picker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Date Picker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

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
      withoutPresetDate = newDateTime;
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
      with4PresetDate = newDateTime;
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
      with6PresetDate = newDateTime;
    });
  }

  constantHeight(double buildHeight) {
    return SizedBox(
      height: buildHeight * 0.1,
    );
  }

  @override
  Widget build(BuildContext context) {
    double buildWidth = MediaQuery.of(context).size.width;
    double buildHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          ValueStrings.calenderWidgets,
                          style: TextStyleUtility.bolTextStyleColor(
                              16, ColorsUtility.textColor),
                        ),
                        margin: EdgeInsets.all(buildWidth * 0.1),
                      ),
                      ButtonWidget(
                        text: ValueStrings.withoutPreset,
                        onPressed: withoutPreset,
                        color: ColorsUtility.blueColor,
                        width: buildWidth,
                      ),
                      withoutPresetDate != null
                          ? Container(
                              padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.calendar_today_rounded,
                                    color: Colors.blueAccent,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
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
                                    child: const Icon(
                                      Icons.close,
                                      color: Colors.blueAccent,
                                    ),
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.blue[50],
                                  borderRadius: BorderRadius.circular(16)),
                              margin: const EdgeInsets.all(8),
                            )
                          : Container(),
                      constantHeight(buildHeight),
                      ButtonWidget(
                        text: ValueStrings.with4Preset,
                        onPressed: with4Preset,
                        color: ColorsUtility.blueColor,
                        width: buildWidth,
                      ),
                      with4PresetDate != null
                          ? Container(
                        padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.calendar_today_rounded,
                              color: Colors.blueAccent,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
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
                              child: const Icon(
                                Icons.close,
                                color: Colors.blueAccent,
                              ),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Colors.blue[50],
                            borderRadius: BorderRadius.circular(16)),
                        margin: const EdgeInsets.all(8),
                      )
                          : Container(),
                      constantHeight(buildHeight),
                      ButtonWidget(
                        text: ValueStrings.with6Preset,
                        onPressed: with6Preset,
                        color: ColorsUtility.blueColor,
                        width: buildWidth,
                      ),
                      with6PresetDate != null
                          ? Container(
                        padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.calendar_today_rounded,
                              color: Colors.blueAccent,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
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
                              child: const Icon(
                                Icons.close,
                                color: Colors.blueAccent,
                              ),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Colors.blue[50],
                            borderRadius: BorderRadius.circular(16)),
                        margin: const EdgeInsets.all(8),
                      )
                          : Container(),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: Text("Kartik Gaddam",
                  style: TextStyleUtility.normalTextStyle(16)),
              alignment: Alignment.center,
              margin: const EdgeInsets.all(16),
            )
          ],
        ));
  }
}
