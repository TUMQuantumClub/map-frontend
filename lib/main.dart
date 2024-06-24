import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? preferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  preferences = await SharedPreferences.getInstance();
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  // Load theme preference from SharedPreferences
  void _loadTheme() {
    setState(() {
      _isDarkMode = (preferences?.getBool('isDarkMode') ?? false);
    });
  }

  // Save theme preference to SharedPreferences
  void _saveTheme(bool value) {
    preferences?.setBool('isDarkMode', value);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Theme Switch'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Settings'),
              ),
              SwitchListTile(
                title: const Text('Dark Mode'),
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
        body: const Center(
          child: Text(
            'Toggle theme using the sidebar menu.',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
