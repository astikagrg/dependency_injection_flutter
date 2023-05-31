import 'package:dependency_injection_flutter/view/display_user_view.dart';
import 'package:dependency_injection_flutter/view/user_add_view.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const UserAddView(),
        '/viewuser': (context) => const DisplayUser(),
      },
    );
  }
}
