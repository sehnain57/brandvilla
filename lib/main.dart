import 'package:brandvilla/user_view/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'admin_view/admin_add.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, screen, or) {
      return GetMaterialApp(
        title: 'Brandvilla',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          appBarTheme: AppBarTheme(
            shadowColor: Colors.black12,
          ),
          useMaterial3: false,
        ),
        initialRoute: "/main",
        getPages: [
          GetPage(name: "/main", page: () => MainPage()),
          GetPage(name: "/admin", page: () => AdminAdd()),
        ],
      );
    });
  }
}
