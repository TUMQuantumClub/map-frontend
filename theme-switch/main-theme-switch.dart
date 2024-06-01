import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? prefs;

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    prefs = await SharedPreferences.getInstance();
    runApp(MyApp());
}

class MyApp extends StatefulWidget {
    @override
    _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    bool _isDarkMode = false;

    @override

    void initState() {
        super.initState();
        _loadTheme();
  }

    // Load theme preference from SharedPreferences
    void _loadTheme() {
        setState(() {
            _isDarkMode = (prefs?.getBool('isDarkMode') ?? false);
    });
  }

    // Save theme preference to SharedPreferences
    void _saveTheme(bool value) {
        prefs?.setBool('isDarkMode', value);
  }

    @override

    Widget build(BuildContext context) {
        return MaterialApp(
            theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
            home: Scaffold(
                appBar: AppBar(
                    title: Text('Flutter Theme Switch'),
                ),
                drawer: Drawer(
                    child: ListView(
                        padding: EdgeInsets.zero,
                        children: <Widget>[
                            DrawerHeader(
                                child: Text('Settings'),
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                ),
                            ),
                            SwitchListTile(
                                title: Text('Dark Mode'),
                                value: _isDarkMode,
                                onChanged: (value) {
                                    setState(() {
                                        _isDarkMode = value;
                                         _saveTheme(value);
                                    });
                                 },
                            ),
                         ],
                    ),
                 ),
                body: Center(
                    child: Text(
                        'Toggle theme using the sidebar menu.',
                        style: TextStyle(fontSize: 18),
                     ),
                 ),
             ),
         );
    }
}
