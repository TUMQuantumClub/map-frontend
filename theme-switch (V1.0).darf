// theme-switch (1.0) as .dart file

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preference.dart'

void main() {
    runApp(MyApp());
}

// MyApp = stateful widget, that maintains current theme state
class MyApp extends StatefulWidget {
    @override
    _MyAppState createState() => _MyAppState
}

class _MyAppState extends State<MyApp> {
    bool _isDarkMode = false;

    @override
    void initState() { // initState Method: loads the theme preference from shared preference, when App starts
        super.initState();
        _loadTheme();
    }
    // _loadTheme Method: asynchronously loads preference from SharedPreferences, when App starts
    _loadTheme() async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        setState(() {
            _isDarkMode = (prefs.getBool('isDarkMode') ?? false);
        })
    }
    // _saveTheme Method: asynchronously saves theme preference to when changed
    _saveTheme(bool value) async {
        _SharedPreferences pref = await SharedPreferences.getInstance();
        prefs.setBool('isDarkMode', value);
    }
    
    @override
    Widget build(BuildContext context) {
        return MaterialApp( // uses conditional to set theme to either dark or light, based on _isDarkMode booloan
            theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
            home: Scaffold(
                appBar: AppBar()
                    title: Text('Theme Switch')
            ),
            body: Center(
                child: SwitchListTile( // Allows user to toggle theme, which updates the state and saves the preference
                    title: Text('Dark Mode'),
                    value: _isDarkMode,
                    onChanged: (value) {
                        setState(() {
                            _isDarkMode = value;
                            _saveTheme(value);
                        }
                        )
                    }
                )
            )
        )
    }
}
