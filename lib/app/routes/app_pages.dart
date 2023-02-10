import 'package:get/get.dart';

import '../modules/BottomNavbar/bindings/bottom_navbar_binding.dart';
import '../modules/BottomNavbar/views/bottom_navbar_view.dart';
import '../modules/add_items/bindings/add_items_binding.dart';
import '../modules/add_items/views/add_items_view.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/history/bindings/history_binding.dart';
import '../modules/history/views/history_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/item_detail/bindings/item_detail_binding.dart';
import '../modules/item_detail/views/item_detail_view.dart';
import '../modules/items/bindings/item_binding.dart';
import '../modules/items/views/items_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/testis/bindings/testis_binding.dart';
import '../modules/testis/views/testis_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(
        showRegisterView: () {},
      ),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(
        showLoginView: () {},
      ),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.ITEM,
      page: () => ItemView(),
      binding: ItemBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY,
      page: () => const HistoryView(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.ITEM_DETAIL,
      page: () => ItemDetailView(),
      binding: ItemDetailBinding(),
    ),
    GetPage(
      name: _Paths.ADD_ITEMS,
      page: () => AddItemsView(),
      binding: AddItemsBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_NAVBAR,
      page: () => const BottomNavbarView(),
      binding: BottomNavbarBinding(),
    ),
    GetPage(
      name: _Paths.TESTIS,
      page: () => TestisView(),
      binding: TestisBinding(),
    ),
  ];
}
