import 'package:news_feed/utils/routes.dart';
import '../../utils/colors.dart';
import 'package:flutter/material.dart';
import '../../utils/images.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), (){
      Navigator.popAndPushNamed(context, home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: Image(image: AssetImage(logo), fit: BoxFit.fill, height: 350, width: 350,),
        ),
      ),
    );
  }
}