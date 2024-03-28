import 'package:get/get.dart';

import '../modules/create_recipe/bindings/create_recipe_binding.dart';
import '../modules/create_recipe/views/create_recipe_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/update_recipe/bindings/update_recipe_binding.dart';
import '../modules/update_recipe/views/update_recipe_view.dart';

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
      name: _Paths.CREATE_RECIPE,
      page: () => CreateRecipeView(),
      binding: CreateRecipeBinding(),
    ),
    GetPage(
      name: _Paths.UPDATE_RECIPE,
      page: () => UpdateRecipeView(),
      binding: UpdateRecipeBinding(),
    ),
  ];
}
