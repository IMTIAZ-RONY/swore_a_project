import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/counter_controller.dart';
import '../widgets/action_button.dart';
import '../widgets/glass_container.dart';

class HomeScreen extends StatelessWidget {
  final CounterController cController = Get.put(CounterController());

 HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade100,
      appBar: AppBar(
        title: const Text("Counter App", style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600,
            color: Colors.white,letterSpacing: 1.2)),
        centerTitle: true,
        backgroundColor: Colors.teal.shade700,
        elevation: 8,
        shadowColor: Colors.black45,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: CircleAvatar(
              backgroundColor: Colors.white.withValues(alpha:0.15 ),
              child: IconButton(
                icon: const Icon(Icons.refresh, color: Colors.white,),
                onPressed: cController.resetCounter,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GlassContainer(
              child: Obx(() => AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: Text(
                  cController.counter.value.toString(),
                  //'${cController.counter.value}',
                 // key: ValueKey(cController.counter.value),
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal.shade900,
                  ),
                ),
              )),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ActionButton(icon: Icons.remove, onTap: cController.decrementCounter),
                const SizedBox(width: 40),
                ActionButton(icon: Icons.add, onTap: cController.incrementCounter),
              ],
            )
          ],
        ),
      ),
    );
  }
}
