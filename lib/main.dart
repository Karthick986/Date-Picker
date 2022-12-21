import 'package:date_picker_test/strings/value_strings.dart';
import 'package:date_picker_test/utitities/colors_utility.dart';
import 'package:date_picker_test/utitities/text_utility.dart';
import 'package:date_picker_test/widgets/button_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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

  withoutPreset(context) {
    debugPrint("withoutPreset");
  }

  with4Preset(context) {
    debugPrint("with4Preset");
  }

  with6Preset(context) {
    debugPrint("with6Preset");
  }

  constantHeight(double buildHeight) {
    return SizedBox(height: buildHeight*0.1,);
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
                    Container(child: Text(ValueStrings.calenderWidgets, style: TextStyleUtility.bolTextStyleColor(16, ColorsUtility.titleColor),),
                    margin: EdgeInsets.all(buildWidth*0.1),),
                    ButtonWidget(
                      text: ValueStrings.withoutPreset,
                      onPressed: withoutPreset,
                      color: ColorsUtility.blueColor,
                      width: buildWidth,
                    ),
                    constantHeight(buildHeight),
                    ButtonWidget(
                      text: ValueStrings.with4Preset,
                      onPressed: with4Preset,
                      color: ColorsUtility.blueColor,
                      width: buildWidth,
                    ),
                    constantHeight(buildHeight),
                    ButtonWidget(
                      text: ValueStrings.with6Preset,
                      onPressed: with6Preset,
                      color: ColorsUtility.blueColor,
                      width: buildWidth,
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
              child: Text("Kartik Gaddam", style: TextStyleUtility.normalTextStyle(16)),
            alignment: Alignment.center,
            margin: const EdgeInsets.all(16),
          )
        ],
      )
    );
  }
}
