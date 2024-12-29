import 'package:get/get.dart';
import '../pages/login.dart';
import '../pages/home.dart';
import '../pages/welcome.dart'; // Import WelcomePage
import '../pages/order.dart';
import '../pages/profile_page.dart';
import '../pages/client_page.dart';
import '../pages/so_page.dart';
import '../pages/po_page.dart';
import '../pages/co_page.dart';
import '../pages/detail_co_page.dart';
import '../pages/detail_so_page.dart';
import '../pages/detail_po_page.dart';

class Routes {
  static const welcome = '/welcome'; // Rute untuk WelcomePage
  static const login = '/login';
  static const home = '/home';
  static const order = '/order';
  static const profile = '/profile';
  static const client = '/client';
  static const salesOrder = '/sales-order';
  static const purchaseOrder = '/purchase-order';
  static const cancelOrder = '/cancel-order';
  static const detailCancelOrder = '/detail-cancel-order';
  static const detailSalesOrder = '/detail-sales-order';
  static const detailPurchaseOrder = '/detail-purchase-order';
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
    GetPage(
      name: Routes.profile,
      page: () => const ProfilePage(),
    ),
    GetPage(
      name: Routes.client,
      page: () => const ClientPage(),
    ),
    GetPage(
      name: Routes.salesOrder,
      page: () => const SalesOrderPage(),
    ),
    GetPage(
      name: Routes.purchaseOrder,
      page: () => const PurchaseOrderPage(),
    ),
    GetPage(
      name: Routes.cancelOrder,
      page: () => const CancelOrderPage(),
    ),
    GetPage(
      name: Routes.detailCancelOrder,
      page: () => const CancelOrderDetailPage(),
    ),
    GetPage(
      name: Routes.detailSalesOrder,
      page: () => const SalesOrderDetailPage(),
    ),
    GetPage(
      name: Routes.detailPurchaseOrder,
      page: () => const PurchaseOrderDetailPage(),
    ),
  ];
}
