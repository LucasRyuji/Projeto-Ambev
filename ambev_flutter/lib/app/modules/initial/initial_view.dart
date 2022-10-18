import 'package:ambev_flutter/app/modules/initial/initial_controller.dart';
import 'package:ambev_flutter/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splashscreen/splashscreen.dart';

class InitialPage extends GetView<InitialController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SplashScreen(
            seconds: 5,
            gradientBackground: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 38, 55, 105),
                Color.fromARGB(255, 20, 58, 172),
              ],
            ),
            navigateAfterSeconds: controller.verifyAuth(),
            loaderColor: Colors.transparent,
          ),
          Container(
            margin: EdgeInsets.all(100),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/logo-ambev-branca.png"),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
