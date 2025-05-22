import 'package:get/get.dart';

class CounterController extends GetxController{
  //RxInt counter=0.obs;
  RxInt counter=RxInt(0);
  void incrementCounter(){
    counter.value+=2;//counter.value=counter.value+2;
    update();
  }
  void decrementCounter(){
    counter.value==0?counter.value=0:counter.value=counter.value-2;
   /* if(counter.value==0){return;
    }else {
      counter.value=counter.value-2;
    }*/
    update();
  }

}