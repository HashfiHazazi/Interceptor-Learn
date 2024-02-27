import 'package:flutter/material.dart';
import 'package:flutter_auth/src/routers/route_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final route = RoutePages();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Auth',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
          useMaterial3: true,
          fontFamily: 'Quicksand'),
      onGenerateRoute: route.onRoute,
      initialRoute: '/login',
      debugShowCheckedModeBanner: false,
    );
  }
}
