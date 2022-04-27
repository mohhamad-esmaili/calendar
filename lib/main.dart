import 'package:calendar/provider/auth.dart';
import 'package:calendar/screens/home_screen.dart';
import 'package:calendar/screens/login_screen.dart';
import 'package:calendar/screens/verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Auth(),
      child: MaterialApp(
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale("fa", "IR"),
        ],
        locale: const Locale("fa", "IR"),
        title: 'calendar',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Dana',
          textTheme: const TextTheme(
            bodyText1: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        initialRoute: LoginScreen.routeName,
        routes: {
          LoginScreen.routeName: (context) => LoginScreen(),
          VerifyScreen.routeName: (context) => VerifyScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
        },
      ),
    );
  }
}
