import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas62/app/modules/update_recipe/controllers/update_recipe_controller.dart';

class UpdateRecipeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdateRecipeController>(
      init: UpdateRecipeController(),
      builder: (controller) {
        controller.titleController.text = Get.arguments['judul'];
        controller.timeEstimationController.text = Get.arguments['waktu'];
        controller.instructionsController.text = Get.arguments['intruksi'];
        controller.ingredientsController.text = Get.arguments['bahan'];
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Update Recipe',
              style: GoogleFonts.poppins(color: Colors.white),
            ), // Ubah warna teks app bar
            backgroundColor: Colors.blueAccent, // Ubah warna latar belakang app bar
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.white),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20), // Berikan padding pada keseluruhan body
            child: ListView(
              children: [
                SizedBox(height: 20), // Berikan ruang kosong antara judul dan input fields
                TextFormField(
                  controller: controller.titleController,
                  decoration: InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  style: GoogleFonts.poppins(), // Ganti font teks
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 20), // Berikan ruang kosong antara input fields
                TextFormField(
                  controller: controller.timeEstimationController,
                  decoration: InputDecoration(
                    labelText: 'Time Estimation',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  style: GoogleFonts.poppins(), // Ganti font teks
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 20), // Berikan ruang kosong antara input fields
                TextFormField(
                  controller: controller.instructionsController,
                  decoration: InputDecoration(
                    labelText: 'Instructions',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  style: GoogleFonts.poppins(), // Ganti font teks
                  textInputAction: TextInputAction.newline,
                  keyboardType: TextInputType.multiline, // Mengizinkan input multiline
                  maxLines: null,
                ),
                SizedBox(height: 20), // Berikan ruang kosong antara input fields
                TextFormField(
                  controller: controller.ingredientsController,
                  decoration: InputDecoration(
                    labelText: 'Ingredients',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  style: GoogleFonts.poppins(), // Ganti font teks
                  textInputAction: TextInputAction.newline,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ),
                SizedBox(height: 20), // Berikan ruang kosong antara input fields dan tombol
                ElevatedButton(
                  onPressed: () {
                    String recipeId = Get.arguments['id'];
                    controller.updateData(
                      recipeId,
                      controller.titleController.text,
                      controller.timeEstimationController.text,
                      controller.instructionsController.text,
                      controller.ingredientsController.text,
                    );
                  },
                  child: Text(
                    'Save Changes',
                    style: GoogleFonts.poppins(color: Colors.white), // Ganti font teks
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent[100], // Ubah warna tombol
                    padding: EdgeInsets.symmetric(vertical: 15), // Ubah padding tombol
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // Ubah sudut tombol
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
