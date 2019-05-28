import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

import './Screens/manager_screen.dart';
import './Screens/settings_screen.dart';

enum AppOption { settings }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
        defaultBrightness: Brightness.light,
        data: (brightness) => new ThemeData(
              primarySwatch: Colors.indigo,
              brightness: brightness,
            ),
        themedWidgetBuilder: (context, theme) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              accentColor: Colors.green,
              primaryColor: Colors.green,
              textTheme: TextTheme(
                headline:
                    TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
                title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
                body1: TextStyle(fontSize: 16.0, fontFamily: 'Hind'),
                body2: TextStyle(fontSize: 16.0, fontFamily: 'Hind'),
              ),
            ),
            home: MainPage(),
          );
        });
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Characters'),
        actions: [
          PopupMenuButton<AppOption>(
              onSelected: (AppOption result) {
                if (result == AppOption.settings) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Settings()),
                  );
                }
              },
              itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<AppOption>>[
                    const PopupMenuItem<AppOption>(
                      value: AppOption.settings,
                      child: Text("Settings"),
                    ),
                  ]),
        ],
      ),
      body: Center(
        child: Manager(),
      ),
    );
  }
}
