import 'package:flutter/material.dart';
import 'package:wb_test_flutter/screens/home.dart';
import 'package:flutter/services.dart';
import 'package:wb_test_flutter/screens/register_success.dart';
import 'package:wb_test_flutter/themes/light_theme.dart';
import 'package:wb_test_flutter/themes/dark_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp
  ]);
  runApp(
    MaterialApp(
      title: "Meu App",
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/reg-success": (context) => const RegisterSuccess()
      },
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const Home()
    )
  );
}
