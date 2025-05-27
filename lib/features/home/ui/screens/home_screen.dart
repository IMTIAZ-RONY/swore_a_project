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
final NotesController noteController=Get.put(NotesController());
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
            if (homeController.isGrid.value == true) {
              return GridView.builder(
                itemCount: 10,
                shrinkWrap: true,
                padding: EdgeInsets.all( 12),
                //physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing:15,
                  crossAxisSpacing: 15,
                  childAspectRatio: .7,
                ),
                itemBuilder: (_, __) {
                  return Container(
                    padding:EdgeInsets.all(8) ,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.30),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:Column(
                      crossAxisAlignment:CrossAxisAlignment.start ,
                      mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                      children: [
                        Text("Lorem Ipsum",style:TextStyle(color:Colors.white,fontSize: 16,fontWeight:FontWeight.w600  ) ,),
                        Text("Lorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem Ipsum",style:TextStyle(color:Colors.white.withValues(alpha: 0.7),fontSize: 12 ) ,
                        maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.watch_later_outlined,size:20 ,color:Colors.white ,),
                            SizedBox(width:4),
                            Text("8:30 PM",style:TextStyle(color:Colors.white.withValues(alpha: 0.7),fontSize: 12 ) ,),
                          ],
                    ),
                      ]
                    )
                  );
                },
              );
            } else {
              return ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                itemBuilder:
                    (context, index) => Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.30),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        title: Text(
                          "Lorem Ipsum",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(
                          "8:30 PM",
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.7),
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
                print(details.delta.dx);
                print(details.delta.dy);
                setState(() {
                  position = Offset(
                    position.dx + details.delta.dx,
                    position.dy + details.delta.dy,
                  );
                });
              },
              child: FloatingActionButton(
                onPressed: ()=>Get.to(()=>NoteCreateView()),
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
