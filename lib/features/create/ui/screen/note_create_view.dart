import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/notes_controller.dart';

class NoteCreateView extends StatelessWidget {
  NoteCreateView({super.key});
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final noteTextController=Get.put(NotesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create Note",
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, size: 24, color: Colors.white),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              print("Title: ${titleController.text}");
              print("Description: ${descriptionController.text}");

             noteTextController.createNote(
                titleController.text,
                descriptionController.text,
             );
            },
            icon: Icon(Icons.check, size: 24, color: Colors.white),
          ),
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              style: TextStyle(fontSize: 25, color: Colors.white),
              decoration:InputDecoration(
                border: InputBorder.none,
                hintText: "Title",
                hintStyle: TextStyle(color: Colors.grey,fontSize: 25),
              ) ,

            ),
            SizedBox(height: 12),
            Expanded(
              child: TextFormField(
                controller: descriptionController,
                style: TextStyle(fontSize: 25, color: Colors.white),
                keyboardAppearance: Brightness.light,
                keyboardType: TextInputType.multiline,
                maxLines: 10,
                decoration:InputDecoration(
                  border: InputBorder.none,
                  hintText: "Write some notes...",
                  hintStyle: TextStyle(color: Colors.grey,fontSize: 25),
                ) ,

              ),
            ),
          ],
        ),
      ) ,
    );
  }
}
