import 'package:get/get.dart';

class CounterController extends GetxController{
  //RxInt counter=RxInt(0);
  RxInt counter=0.obs;

  void incrementCounter(){
    counter.value+=2;//counter.value=counter.value+2;
    update();
  }
  void decrementCounter(){
    /* if(counter.value==0){return;
    }else {
      counter.value=counter.value-2;
    }*/
    counter.value==0?counter.value=0:counter.value=counter.value-2;

    update();
  }
  void resetCounter() {
    counter.value = 0;
    update();

  }

}