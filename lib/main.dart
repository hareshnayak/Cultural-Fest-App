import 'package:engifest_22/helper/colors.dart';
import 'package:engifest_22/screens/confirmTicket.dart';
import 'package:engifest_22/screens/downloadTicket.dart';
import 'package:engifest_22/screens/event.dart';
import 'package:engifest_22/screens/home.dart';
import 'package:engifest_22/screens/login.dart';
import 'package:engifest_22/screens/root.dart';
import 'package:engifest_22/screens/signUp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'database/auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppColors colors = AppColors();

  bool isBusy = false;
  bool isLoggedIn = false;
  String errorMessage;
  String name;
  String picture;

  final Auth auth = Auth();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.blue,
        backgroundColor: colors.backColor,
        scaffoldBackgroundColor: colors.backColor,
        textTheme: TextTheme(
          headline6: TextStyle(),
          headline4: TextStyle(),
          subtitle1: TextStyle(),
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
        ).apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
      ),
      // initialRoute: (auth.loggedIn) != null ? '/home' : '/',
      initialRoute: '/confirmTicket',
      routes: {
        '/': (context) => RootPage(),
        '/login': (context) => LoginPage(),
        '/signUp': (context) => SignUpPage(),
        '/home': (context) => HomePage(),
        '/event': (context) => EventPage(),
        '/confirmTicket': (context) => ConfirmTicket(),
        '/downloadTicket' : (context) => DownloadTicket(),
      },

      // home: RootPage(),
      // MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}