import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:swore_a_project/features/home/ui/screens/home_screen.dart';

class NotePadApp extends StatefulWidget {
  const NotePadApp({super.key});

  @override
  State<NotePadApp> createState() => _NotePadAppState();
}

class _NotePadAppState extends State<NotePadApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.teal.shade600,
        scaffoldBackgroundColor: Color(0xFF040404),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF040404),
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: false,
        )
      ),
      home:HomeScreen() ,
    );
  }
}
