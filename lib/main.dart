import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';

void main() {
  enableFlutterDriverExtension(); // 👈 Required for Appium
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Automation Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/list': (context) => ListScreen(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _rememberMe = false;
  String _selectedOption = 'Option 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Page')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              key: ValueKey('email_input'),
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              key: ValueKey('password_input'),
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            Row(
              children: [
                Text('Remember Me'),
                Switch(
                  key: ValueKey('remember_switch'),
                  value: _rememberMe,
                  onChanged: (val) => setState(() => _rememberMe = val),
                ),
              ],
            ),
            DropdownButton<String>(
              key: ValueKey('dropdown_menu'),
              value: _selectedOption,
              items: ['Option 1', 'Option 2', 'Option 3']
                  .map((val) => DropdownMenuItem(
                        value: val,
                        child: Text(val),
                      ))
                  .toList(),
              onChanged: (val) => setState(() => _selectedOption = val!),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              key: ValueKey('login_button'),
              onPressed: () {
                Navigator.pushNamed(context, '/list');
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List Screen')),
      body: ListView.builder(
        key: ValueKey('item_list'),
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            key: ValueKey('list_item_$index'),
            title: Text('Item $index'),
          );
        },
      ),
    );
  }
}