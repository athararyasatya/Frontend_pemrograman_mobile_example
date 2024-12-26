import 'package:get/get.dart';
import '../pages/login.dart';
import '../pages/home.dart';
import '../pages/welcome.dart'; // Import WelcomePage

class Routes {
  static const welcome = '/welcome'; // Rute untuk WelcomePage
  static const login = '/login';
  static const home = '/home';
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
  ];
}
