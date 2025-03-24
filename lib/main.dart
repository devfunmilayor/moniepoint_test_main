import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moniepoint_test/config/routes/route_pages.dart';
import 'package:moniepoint_test/config/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();


  runApp(const MyApp());
}

GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  @override
  void initState() {

    WidgetsBinding.instance.addPostFrameCallback((_) async {
    });
    super.initState();
  }


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onPanDown: (_) {
        FocusScope.of(context).unfocus();
      },
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MP Real Estate',
        theme: AppTheme.lightTheme,
        scaffoldMessengerKey: scaffoldMessengerKey,
        getPages: RoutePages.routes,
        builder: (context, child) {
          return Navigator(
            onGenerateRoute: (settings) => CupertinoPageRoute(
              builder: (context) =>  child!,
            ),
          );
        },
      ),
    );
  }
}