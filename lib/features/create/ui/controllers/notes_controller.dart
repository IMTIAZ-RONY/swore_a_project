import 'package:get/get.dart';
import '../../../models/note_model.dart';

class NotesController extends GetxController{
  var notes=<NoteModel>[].obs;
  createNote(String title,String description){
   // print("Title: $title");
  //  print("Description: $description");
   // print(DateTime.now());
  notes.add(NoteModel(title: title,
      description: description,
      createdAt: DateTime.now(),

  ));
  update();
 Get.back;

  }

}