import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swore_a_project/features/create/ui/controllers/notes_controller.dart';
import 'package:swore_a_project/features/create/ui/screen/note_create_view.dart';
import 'package:swore_a_project/features/home/ui/controllers/home_controller.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Offset position = Offset(250, 500); //Initial FAB position
  final HomeController homeController = Get.put(HomeController());
  final NotesController noteController = Get.put(NotesController());

  // Add this method in _HomeScreenState
  void _showDeleteDialog(int index) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: Colors.grey[900],
            title: Text('Delete!', style: TextStyle(color: Colors.white)),
            content: Text(
              'Are you sure you want to delete this note?',
              style: TextStyle(color: Colors.white70),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel', style: TextStyle(color: Colors.teal)),
              ),
              TextButton(
                onPressed: () {
                  noteController.deleteNote(index);
                  Navigator.pop(context);
                },
                child: Text('Delete', style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: true,
        toolbarHeight: 70,
        forceMaterialTransparency: false,
        title: Text(
          "Notepad",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => homeController.changeType(),
            icon: Icon(Icons.grid_on_outlined, color: Colors.white, size: 28),
          ),
        ],
      ),
      body: Stack(
        children: [
          Obx(() {
            if (noteController.notes.isEmpty) {
              return Center(
                child: Text(
                  "No Data!",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              );
            }
            if (homeController.isGrid.value == true) {
              return GridView.builder(
                itemCount: noteController.notes.length,
                shrinkWrap: true,
                padding: EdgeInsets.all(12),
                //physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: .7,
                ),
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap:
                        () => Get.to(
                          () => NoteCreateView(
                            note: noteController.notes[index],

                            ///__ means index
                            index: index,
                          ),
                        ),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.30),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Expanded(child:Text(
                                noteController.notes[index].title ?? "Untitled",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ), ),

                              IconButton(
                                onPressed:
                                    () => _showDeleteDialog(index),
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                padding:EdgeInsets.all(0),
                                constraints: BoxConstraints(),
                              ),
                            ],
                          ),

                          Text(
                            noteController.notes[index].description!,
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.7),
                              fontSize: 12,
                            ),
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),


                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.watch_later_outlined,
                                  size: 20,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  noteController.notes[index].createdAt
                                      .toString(),
                                  style: TextStyle(
                                    color: Colors.white.withValues(alpha: 0.7),
                                    fontSize: 12,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                itemBuilder:
                    (context, index) => GestureDetector(
                      onTap:
                          () => Get.to(
                            () => NoteCreateView(
                              note: noteController.notes[index],

                              ///__ means index
                              index: index,
                            ),
                          ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.30),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal:16,vertical: 8),
                          title: Text(
                            noteController.notes[index].title ?? "Untitled",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          subtitle: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.access_time_outlined,
                                  color: Colors.white,
                                  size: 16,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  noteController.notes[index].createdAt
                                      .toString(),
                                  style: TextStyle(
                                    color: Colors.white.withValues(alpha: 0.7),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          /*trailing: IconButton(
                            onPressed: () => noteController.deleteNote(index),
                            icon: Icon(
                              Icons.delete,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),*/
                          trailing: IconButton(
                            icon: Icon(Icons.delete_outline, color: Colors.white54),
                            onPressed: () => _showDeleteDialog(index),
                          ),
                        ),
                      ),
                    ),
                separatorBuilder: (_, __) {
                  return SizedBox(height: 8);
                },
                itemCount: noteController.notes.length,
              );
            }
          }),

          ///Moveable Floating Action Button
          Positioned(
            left: position.dx,
            top: position.dy,

            child: GestureDetector(
              onPanUpdate: (details) {
                // print(details.delta.dx);
                // print(details.delta.dy);
                setState(() {
                  position = Offset(
                    position.dx + details.delta.dx,
                    position.dy + details.delta.dy,
                  );
                });
              },
              child: FloatingActionButton(
                onPressed: () => Get.to(() => NoteCreateView()),
                backgroundColor: Colors.teal.shade600,
                //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                shape: const CircleBorder(),
                child: Icon(Icons.add, color: Colors.white, size: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
