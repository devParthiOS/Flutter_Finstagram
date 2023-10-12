import 'package:finstagram/pages/Login_page.dart';
import 'package:finstagram/pages/home_page.dart';
import 'package:finstagram/pages/register_page.dart';
import 'package:flutter/material.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finstagram',
      color: Colors.red,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      initialRoute: "home",
      routes: {
        "register": (context) => RegisterPage(),
        "login": (context) => LoginPage(),
        "home": (context) => HomePage(),
      },
    );
  }
}
