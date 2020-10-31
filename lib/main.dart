import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:poteto/screen/add_page.dart';
import 'package:poteto/screen/home_page.dart';
import 'package:poteto/screen/rand_page.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Poteto',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/add_page': (context) => AddPage(),
        '/rand_page': (context) => RandPage(),
      },
    );
  }
}
