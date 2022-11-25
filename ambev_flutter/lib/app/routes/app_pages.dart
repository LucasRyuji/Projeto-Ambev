import 'package:ambev_flutter/app/modules/order-details-fornecedor/order_details_fornecedor_binding.dart';
import 'package:ambev_flutter/app/modules/order-details-fornecedor/order_details_fornecedor_view.dart';
import 'package:ambev_flutter/app/modules/orders-colaborador/create/create_orders_binding.dart';
import 'package:ambev_flutter/app/modules/orders-colaborador/create/create_orders_view.dart';
import 'package:ambev_flutter/app/modules/orders-colaborador/index/orders_colaborador_binding.dart';
import 'package:ambev_flutter/app/modules/orders-colaborador/index/orders_colaborador_view.dart';
import 'package:ambev_flutter/app/modules/tabs_analista/tabs_analista_binding.dart';
import 'package:ambev_flutter/app/modules/tabs_analista/tabs_analista_page.dart';
import 'package:ambev_flutter/app/modules/tabs_colaborador/tabs_colaborador_binding.dart';
import 'package:ambev_flutter/app/modules/tabs_colaborador/tabs_colaborador_page.dart';
import 'package:ambev_flutter/app/modules/tabs_fornecedor/tabs_colaborador_binding.dart';
import 'package:ambev_flutter/app/modules/tabs_fornecedor/tabs_colaborador_page.dart';
import 'package:ambev_flutter/app/modules/users/create/create_users_binding.dart';
import 'package:ambev_flutter/app/modules/users/create/create_users_view.dart';
import 'package:ambev_flutter/app/modules/initial/initial_binding.dart';
import 'package:ambev_flutter/app/modules/initial/initial_view.dart';
import 'package:ambev_flutter/app/modules/login/login_binding.dart';
import 'package:ambev_flutter/app/modules/login/login_view.dart';
import 'package:ambev_flutter/app/modules/users/edit/edit_users_binding.dart';
import 'package:ambev_flutter/app/modules/users/edit/edit_users_view.dart';
import 'package:ambev_flutter/app/modules/users/index/users_binding.dart';
import 'package:ambev_flutter/app/modules/users/index/users_view.dart';
import 'package:ambev_flutter/app/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.INITIAL,
      page: () => InitialPage(), //InitialView(),
      binding: InitialBinding(), // InitialBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginView(), //LoginView(),
      binding: LoginBinding(), // LoginBinding(),
    ),
    GetPage(
      name: Routes.USERS,
      page: () => UsersPage(),
      binding: UsersBinding(),
    ),
    GetPage(
      name: Routes.CREATE_USERS,
      page: () => CreateUsersPage(),
      binding: CreateUsersBinding(),
    ),
    GetPage(
      name: Routes.EDIT_USERS,
      page: () => EditUsersPage(),
      binding: EditUsersBinding(),
    ),
    GetPage(
      name: Routes.TABS_ANALISTA,
      page: () => TabsAnalistaPage(),
      binding: TabsAnalistaBinding(),
    ),
    GetPage(
      name: Routes.TABS_COLABORADOR,
      page: () => TabsColaboradorPage(),
      binding: TabsColaboradorBinding(),
    ),
    GetPage(
      name: Routes.TABS_FORNECEDOR,
      page: () => TabsFornecedorPage(),
      binding: TabsFornecedorBinding(),
    ),
    GetPage(
      name: Routes.ORDERS_COLABORADOR,
      page: () => OrdersColaboradorPage(),
      binding: OrdersColaboradorBinding(),
    ),
    GetPage(
      name: Routes.CREATE_ORDER,
      page: () => CreateOrdersPage(),
      binding: CreateOrdersBinding(),
    ),
    GetPage(
      name: Routes.ORDER_FORNECEDOR,
      page: () => OrderDetailsFornecedorPage(),
      binding: OrderDetailsFornecedorBinding(),
    ),
  ];
}
