import 'package:get/get.dart';

class HomeController extends GetxController{

  //RxBool isGrid= RxBool(false);
  RxBool isGrid=false.obs;
  void changeType(){
   isGrid.value=!isGrid.value;
   update();
 }



}