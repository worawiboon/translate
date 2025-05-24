import 'package:get/get.dart';
import 'package:translate/app/routes/app_pages.dart';

class HomeController extends GetxController {
  void navigateToFlashcard() {
    Get.toNamed(Routes.FLASHCARD);
  }

  void navigateToMatchingGame() {
    Get.toNamed(Routes.MATCHING_GAME);
  }
}
