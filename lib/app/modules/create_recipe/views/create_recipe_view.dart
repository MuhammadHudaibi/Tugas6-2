import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas62/app/modules/create_recipe/controllers/create_recipe_controller.dart';

class CreateRecipeView extends GetView<CreateRecipeController> {
  final CreateRecipeController controller = Get.put(CreateRecipeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Resep', style: GoogleFonts.poppins(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            SizedBox(height: 20),
            TextFormField(
              controller: controller.titleController,
              decoration: InputDecoration(
                labelText: 'Judul',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              style: GoogleFonts.poppins(),
              textInputAction: TextInputAction.next,
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: controller.timeEstimationController,
              decoration: InputDecoration(
                labelText: 'Estimasi Waktu (menit)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              style: GoogleFonts.poppins(),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: controller.instructionsController,
              decoration: InputDecoration(
                labelText: 'Instruksi',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              style: GoogleFonts.poppins(),
              maxLines: null,
              textInputAction: TextInputAction.next,
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: controller.ingredientsController,
              decoration: InputDecoration(
                labelText: 'Bahan',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              style: GoogleFonts.poppins(),
              maxLines: null,
              textInputAction: TextInputAction.next,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.addData(
                  controller.titleController.text,
                  controller.timeEstimationController.text,
                  controller.instructionsController.text,
                  controller.ingredientsController.text,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
              child: Text(
                'Tambah',
                style: GoogleFonts.poppins(color: Colors.white,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
