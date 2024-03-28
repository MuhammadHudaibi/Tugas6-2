import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tugas62/app/modules/home/controllers/home_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatelessWidget {
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resep', style: GoogleFonts.poppins(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent, // Mengubah warna latar belakang app bar
        elevation: 0, // Menghilangkan bayangan di bawah app bar
      ),
      body: Container(
        margin: EdgeInsets.all(10), // Memberikan margin di atas konten utama
        child: StreamBuilder(
          stream: controller.getRecipesStream(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(child: Text('Tidak ada data', style: GoogleFonts.poppins(),));
            }
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                var recipe = snapshot.data!.docs[index];
                return Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // Mengatur sudut card
                  ),
                  color: Colors.blueAccent[100],
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    title: Text(
                      recipe['title'],
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.white)
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        Text(
                          'Estimasi Waktu: ${recipe['time_estimation']}',
                          style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '\nCara Membuat:\n${recipe['instructions']}',
                          style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '\nBahan-bahan:\n${recipe['ingredients']}',
                          style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
                        ),
                      ],
                    ),
                    onTap: () {
                      Get.toNamed("/update-recipe", arguments: {
                        'id': recipe.id,
                        'judul': recipe['title'],
                        'waktu': recipe['time_estimation'],
                        'intruksi': recipe['instructions'],
                        'bahan': recipe['ingredients']
                      });
                    },
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.white,),
                      onPressed: () {
                        controller.deleteData(recipe.id);
                      },
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/create-recipe'); // Menavigasi ke halaman CreateRecipeView
        },
        child: Icon(Icons.add, color: Colors.white,),
        backgroundColor: Colors.blueAccent,
        shape: CircleBorder(), // Mengubah warna floating action button
      ),
    );
  }
}
