import 'package:flutter/material.dart';
import 'package:flutter_dev_task/provider/splash_screen_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    var mProvider = Provider.of<SplashScreenProvider>(context, listen: false);
    mProvider.doNavigate(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SplashScreenProvider>(
      builder: (context, _provider, child) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.euro_symbol,
                  color: Colors.blue,
                  size: 100,
                ),
                SizedBox(height: 10),
                Text(
                  "My Credit Loans",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
