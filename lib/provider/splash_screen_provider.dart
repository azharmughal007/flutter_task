import 'package:flutter/material.dart';
import '../screens/loan_selection_screen.dart';

class SplashScreenProvider extends ChangeNotifier {
  doNavigate({required BuildContext context}) {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => const LoanSelectionScreen()),
            (route) => false);
      },
    );
  }
}
