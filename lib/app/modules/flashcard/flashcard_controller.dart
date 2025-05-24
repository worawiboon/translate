import 'package:get/get.dart';

import 'package:translate/models/vocabulary.dart';
import 'package:translate/services/vocabulary_service.dart';

class FlashcardController extends GetxController {
  final VocabularyService _vocabularyService = Get.find();

  RxInt currentIndex = 0.obs;
  RxBool showTranslation = false.obs;

  List<Vocabulary> get vocabularies => _vocabularyService.vocabularies;

  Vocabulary get currentVocab => vocabularies[currentIndex.value];

  void nextCard() {
    currentIndex.value = (currentIndex.value + 1) % vocabularies.length;
    showTranslation.value = false;
  }

  void prevCard() {
    currentIndex.value =
        (currentIndex.value - 1 + vocabularies.length) % vocabularies.length;
    showTranslation.value = false;
  }

  void toggleTranslation() {
    showTranslation.value = !showTranslation.value;
  }
}
