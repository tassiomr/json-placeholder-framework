import 'package:flutter/material.dart';
import 'widgets/navigation_bar.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        home: Scaffold(body: NavigationBar()));
  }
}
