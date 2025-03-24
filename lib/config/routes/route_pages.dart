
import 'package:get/get.dart';
import 'package:moniepoint_test/config/routes/route_constants.dart';
import 'package:moniepoint_test/features/dashboard/presentation/pages/main_dashboard_screen.dart';
import 'package:moniepoint_test/features/splash/presentation/pages/splash_screen.dart';

class RoutePages {
  static List<GetPage> routes = [
    GetPage(name: RouteConstants.initialPage , page: (){
      return const SplashScreen();
    },
        transition: Transition.fadeIn
    ),
    GetPage(name: RouteConstants.home, page: ()=>  MainDashboardScreen(initialIndex: Get.arguments ?? 2,)),
  ];
}