import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

class Settings extends StatelessWidget {
  var context;

  Settings(this.context);

  void _changeThemeDialog() {
    showDialog(
      context:context, 
      builder:(BuildContext context) {
        return BrightnessSwitcherDialog();
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Center(
        child: Column(children: [
          RaisedButton(
            onPressed: _changeThemeDialog,
            child: Text("Change Theme"),
          ),
        ]),
      ),
    );
  }
}


class BrightnessSwitcherDialog extends StatelessWidget {
  const BrightnessSwitcherDialog({Key key, this.onSelectedTheme})
      : super(key: key);

  final ValueChanged<Brightness> onSelectedTheme;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('Select Theme'),
      children: <Widget>[
        RadioListTile<Brightness>(
          value: Brightness.light,
          groupValue: Theme.of(context).brightness,
          onChanged: (Brightness value) {
            onSelectedTheme(Brightness.light);
          },
          title: const Text('Light'),
        ),
        RadioListTile<Brightness>(
          value: Brightness.dark,
          groupValue: Theme.of(context).brightness,
          onChanged: (Brightness value) {
            onSelectedTheme(Brightness.dark);
          },
          title: const Text('Spooky  👻'),
        ),
      ],
    );
  }
}