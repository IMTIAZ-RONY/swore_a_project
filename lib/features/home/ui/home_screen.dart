import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/counter_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /*int counter=0;
  void incrementCounter(){
    setState(() {
      counter+=2;//counter=counter+2;
    });

  }
  void decrementCounter(){
   setState(() {
    // counter==0?counter=0:counter=counter-2;
     if(counter==0){return;
    }else {
       counter=counter-2;
     }
   }
     );
  }*/

  @override
  Widget build(BuildContext context) {
    final cController=Get.put(CounterController());
    print("build one time");
    return Scaffold(
        appBar:AppBar(
          title:const Text("Counter App",style:TextStyle(fontSize:30,fontWeight:FontWeight.bold,color:Colors.white ) ,) ,
          centerTitle:true ,
          backgroundColor:Colors.greenAccent,
        ) ,
      body:SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx((){
                print("State Updated");
                print(cController.counter.value.toString());
                return  Text(cController.counter.value.toString(),style:TextStyle(fontSize:50,fontWeight:FontWeight.bold  ) ,);

              }),

              SizedBox(height:12 ,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment:CrossAxisAlignment.center ,
                children: [
                IconButton(onPressed: cController.decrementCounter, icon:Icon(Icons.remove_circle_outline_outlined,size: 25,)),
                SizedBox(width: 12,),
                IconButton(onPressed: cController.incrementCounter, icon:Icon(Icons.add_circle_outline_outlined,size: 25,)),
              ],)
            ],
          ),
        ),
      ) ,
    );
  }
}
