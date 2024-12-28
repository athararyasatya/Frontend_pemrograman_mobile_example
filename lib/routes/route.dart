import 'package:get/get.dart';
import '../pages/login.dart';
import '../pages/home.dart';
import '../pages/welcome.dart'; // Import WelcomePage
import '../pages/order.dart';

class Routes {
  static const welcome = '/welcome'; // Rute untuk WelcomePage
  static const login = '/login';
  static const home = '/home';
  static const order = '/order';
}

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.welcome,
      page: () => const WelcomePage(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
    ),
    GetPage(
      name: Routes.order,
      page: () => const OrderPage(),
    ),
  ];
}
