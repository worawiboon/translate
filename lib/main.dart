import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translate/services/vocabulary_service.dart';
import 'app/routes/app_pages.dart';
import 'app/bindings/app_bindings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
  await Get.putAsync<VocabularyService>(() async => VocabularyService(),
      permanent: true);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Language Learning Mini',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: Routes.HOME,
      initialBinding: AppBindings(),
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
