import 'package:flutter/material.dart';
import 'package:quiz/pages/home_page.dart';
import 'package:sizer/sizer.dart';

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.grey,
            fontFamily: 'Poppins',
          ),
          initialRoute: HomePage.routeName,
          routes: {
            HomePage.routeName: (context) => const HomePage(),
          },
        );
      },
    );
  }
}
