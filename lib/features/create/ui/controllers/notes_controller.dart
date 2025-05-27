import 'package:get/get.dart';
import '../../../models/note_model.dart';

class NotesController extends GetxController {
  var notes = <NoteModel>[].obs;

  createNote(String title, String description) {
    // print("Title: $title");
    //  print("Description: $description");
    // print(DateTime.now());
    notes.add(
      NoteModel(
        title: title.isEmpty?null:title,
        description: description.isEmpty?"No Description":description,
        createdAt: DateTime.now(),
      ),
    );
    update();
    Get.back();
  }

  void editNote(int index) {

  }
  void deleteNote(int index) {
    notes.removeAt(index);
    update();
  }

  void updateNote(int index, String title, String description) {
    notes[index] = NoteModel(
      title: title.isEmpty ? null : title,
      description: description.isEmpty ? "No Description" : description,
      createdAt: notes[index].createdAt,
      updatedAt: DateTime.now(),
    );
    update();
    Get.back();
  }
}
