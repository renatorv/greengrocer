import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/src/pages_route/app_pages.dart';

import 'src/pages/auth/controller/auth_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  //*****************************************************/
  // Injetando o AuthController na memória da aplicação
  Get.put(AuthController());
  //*****************************************************/

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Greengrocer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white.withAlpha(190),
      ),
      initialRoute: PagesRoutes.splashRoute,
      getPages: AppPages.pages,
    );
  }
}
