import 'package:flutter/material.dart';
import 'package:flutter_dev_task/provider/loan_selection_screen_provider.dart';
import 'package:flutter_dev_task/provider/personal_information_screen_provider.dart';
import 'package:flutter_dev_task/provider/splash_screen_provider.dart';
import 'package:flutter_dev_task/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SplashScreenProvider>(
          create: (context) => SplashScreenProvider(),
        ),
        ChangeNotifierProvider<LoanSelectionScreenProvider>(
          create: (context) => LoanSelectionScreenProvider(),
        ),
        ChangeNotifierProvider<PersonalInformationScreenProvider>(
          create: (context) => PersonalInformationScreenProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Task',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
