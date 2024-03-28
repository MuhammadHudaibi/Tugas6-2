import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getRecipesStream() {
    return _firestore.collection('resep').snapshots();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getRecipeById(String recipeId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> recipeSnapshot = await _firestore.collection('resep').doc(recipeId).get();
      if (recipeSnapshot.exists) {
        return recipeSnapshot;
      } else {
        return Future.error("Recipe not found");
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  void deleteData(String recipeId) {
    try {
      Get.defaultDialog(
        title: "Hapus Resep",
        middleText: "Apakah anda yakin untuk menghapus resep ini?",
        backgroundColor: Colors.white,
        titleStyle: GoogleFonts.poppins(
          color: Colors.blueAccent,
        ),
        middleTextStyle: GoogleFonts.poppins(
          color: Colors.black,
        ),
        onConfirm: () async {
          await _firestore.collection('resep').doc(recipeId).delete();
          Get.back();
          Get.snackbar(
            'Success',
            'Data berhasil dihapus',
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 2),
            margin: EdgeInsets.all(12),
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        },
        textConfirm: "Iya, Saya yakin",
        confirmTextColor: Colors.white,
        textCancel: "Tidak",
        cancelTextColor: Colors.blueAccent,
      );
    } catch (e) {
      print(e);
      Get.snackbar('Error', 'Tidak bisa menghapus data ini');
    }
  }
}
