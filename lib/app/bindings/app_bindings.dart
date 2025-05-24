import 'package:get/get.dart';
import 'package:translate/app/modules/flashcard/flashcard_controller.dart';
import 'package:translate/app/modules/home/home_controller.dart';
import 'package:translate/app/modules/matching_game/matching_game_controller.dart';
import 'package:translate/services/vocabulary_service.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(FlashcardController());
    Get.put(MatchingGameController());
    Get.lazyPut<VocabularyService>(() => VocabularyService(), fenix: true);
    Get.lazyPut(() => VocabularyService(), fenix: true);
  }
}
