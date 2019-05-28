import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

class Settings extends StatelessWidget {
  Settings();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Wrap(spacing: 5.0, runSpacing: 3.0, children: <Widget>[
            colorChoice(chipName: "Green"),
            colorChoice(chipName: "Blue"),
            colorChoice(chipName: "Red"),
          ]),
        ),
      ),
    );
  }
}

class colorChoice extends StatefulWidget {
  final String chipName;

  colorChoice({Key key, this.chipName}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return colorChoiceState();
  }
}

class colorChoiceState extends State<colorChoice> {
  bool _isSelected = false;

  void changeBrightness() {
    DynamicTheme.of(context).setBrightness(
        Theme.of(context).brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark);
  }

  void changeColor(String name) {
    MaterialColor color = Colors.green;
    switch(name) {
      case "Red": 
        color = Colors.red;
        break;
      case "Blue":
        color = Colors.blue;
        break;
      case "Green":
        color = Colors.green;
        break;
    }

    DynamicTheme.of(context).setThemeData(new ThemeData(
        primaryColor: color));
  }

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(widget.chipName),
      labelStyle: TextStyle(color: Colors.black, fontSize: 15),
      selectedColor: Colors.blue[200],
      backgroundColor: Colors.grey[100],
      selected: _isSelected,
      onSelected: (isSelected) {
        setState(() {
          _isSelected = isSelected;
          changeColor(widget.chipName);
        });
      },
    );
  }
}
