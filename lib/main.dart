import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/fav_controller.dart';
import 'routes/route_names.dart';

void main() {
  Get.put(FavController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      // home: MyHomePage(),
      getPages: RouteNames.routes,
    );
  }
}
