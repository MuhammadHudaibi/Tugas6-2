import 'package:get/get.dart';

import '../controllers/update_recipe_controller.dart';

class UpdateRecipeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateRecipeController>(
      () => UpdateRecipeController(),
    );
  }
}
