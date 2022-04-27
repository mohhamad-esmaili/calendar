// packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calendar/provider/auth.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// pages
import 'package:calendar/screens/page_exporter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontFamily: 'Dana',
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          textTheme: const TextTheme(
            bodyText1: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            labelMedium: TextStyle(
              color: Color.fromARGB(255, 198, 203, 211),
              fontSize: 15,
            ),
          ),
        ),
        initialRoute: HomeScreen.routeName,
        routes: {
          LoginScreen.routeName: (context) => const LoginScreen(),
          VerifyScreen.routeName: (context) => const VerifyScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
          EventScreen.routeName: (context) => const EventScreen(),
        },
      ),
    );
  }
}
