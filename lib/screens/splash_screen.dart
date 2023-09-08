import 'package:flutter/cupertino.dart';
import 'package:quoteslife/services/splash_services.dart';
import 'package:quoteslife/widgets/custom_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SplashServices().splashServices(context);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Center(
            child: Image.asset(
              'assets/images/quotes.png',
              height: 100,
              width: 100,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          CustomText(
            texxt: 'QuotesLife',
            fontSize: 20,
          )
        ],
      ),
    );
  }
}
