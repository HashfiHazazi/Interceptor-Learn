import 'package:flutter/material.dart';
import 'package:flutter_auth/src/routers/route_names.dart';
import 'package:flutter_auth/src/routers/route_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
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
        fontFamily: 'Quicksand',
      ),
      onGenerateRoute: route.onRoute,
      initialRoute: RouteNames.login,
      debugShowCheckedModeBanner: false,
    );
  }
}
