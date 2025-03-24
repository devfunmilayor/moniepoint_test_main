
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moniepoint_test/config/routes/route_constants.dart';
import 'package:moniepoint_test/gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3), (){
        Get.toNamed(RouteConstants.home);
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Color(0xFF0D4740),
      body: Center(
        child: SizedBox(
            width: size.width,
            child: Image.asset(Assets.images.logo.path)),
      ),
    );
  }
}
