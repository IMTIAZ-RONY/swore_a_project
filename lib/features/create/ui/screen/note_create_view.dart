import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/note_model.dart';
import '../controllers/notes_controller.dart';

class NoteCreateView extends StatefulWidget {
  final NoteModel? note;
  final int? index;
  NoteCreateView({super.key, this.note, this.index});

  @override
  State<NoteCreateView> createState() => _NoteCreateViewState();
}

class _NoteCreateViewState extends State<NoteCreateView> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  final noteTextController = Get.put(NotesController());
  @override
  void initState(){
    super.initState();
    if(widget.note!=null){
      titleController.text=widget.note?.title??"";
      descriptionController.text=widget.note?.description??"";
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.note == null ? "Create Note" : "Edit Note",
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
              //  print("Title: ${titleController.text}");
              // print("Description: ${descriptionController.text}");
             if(widget.note==null){
               noteTextController.createNote(
                 titleController.text,
                 descriptionController.text,
               );
             }
             else{
               noteTextController.updateNote(
                 widget.index!,
                 titleController.text,
                 descriptionController.text,
               );
             }


            },
            icon: Icon(Icons.check, size: 24, color: Colors.white),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              style: TextStyle(fontSize: 25, color: Colors.white),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Title",
                hintStyle: TextStyle(color: Colors.grey, fontSize: 25),
                contentPadding: EdgeInsets.all(0),
              ),
            ),
            SizedBox(height: 12),
            Expanded(
              child: TextFormField(
                controller: descriptionController,
                style: TextStyle(fontSize: 25, color: Colors.white),
                keyboardAppearance: Brightness.light,
                keyboardType: TextInputType.multiline,
                maxLines:null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Write some notes...",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 25),
                  contentPadding: EdgeInsets.all(0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
