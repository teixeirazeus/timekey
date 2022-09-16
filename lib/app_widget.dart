import 'package:flutter/material.dart';
import 'package:timekey/colors.dart';
import 'package:timekey/home.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: MyColors.darkGrey,
        appBarTheme: const AppBarTheme(
          backgroundColor: MyColors.darkGrey,
          elevation: 0,
          centerTitle: true,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
      },
    );
  }
}
