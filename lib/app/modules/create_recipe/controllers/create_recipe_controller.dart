import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateRecipeController extends GetxController {
  late TextEditingController titleController;
  late TextEditingController timeEstimationController;
  late TextEditingController instructionsController;
  late TextEditingController ingredientsController;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addData(String title, String timeEstimation, String instructions, String ingredients) async {
    if (title.isEmpty || timeEstimation.isEmpty || instructions.isEmpty || ingredients.isEmpty) {
      Get.snackbar(
        'Error',
        'Semua bidang harus diisi',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
        margin: EdgeInsets.all(12),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    try {
      await firestore.collection('resep').add({
        'title': title,
        'time_estimation': timeEstimation,
        'instructions': instructions,
        'ingredients': ingredients,
      });

      Get.back();
      Get.snackbar(
        'Berhasil',
        'Berhasil menambhakan data',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
        margin: EdgeInsets.all(12),
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      print(e);
      Get.snackbar(
        'Error',
        'Failed to add data: $e',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
        margin: EdgeInsets.all(12),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  void onInit() {
    titleController = TextEditingController();
    timeEstimationController = TextEditingController();
    instructionsController = TextEditingController();
    ingredientsController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    titleController.dispose();
    timeEstimationController.dispose();
    instructionsController.dispose();
    ingredientsController.dispose();
    super.onClose();
  }
}
