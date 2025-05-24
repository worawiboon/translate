import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translate/models/vocabulary.dart';
import 'package:translate/services/vocabulary_service.dart';

class MatchingGameController extends GetxController {
  final VocabularyService _vocabularyService = Get.find();

  RxList<Vocabulary> words = <Vocabulary>[].obs;
  RxList<String> images = <String>[].obs;
  RxList<bool> wordSelected = <bool>[].obs;
  RxList<bool> imageSelected = <bool>[].obs;

  // แก้ไขส่วนนี้
  RxInt selectedWordIndex = (-1).obs; // ใช้ -1 แทน null
  RxInt selectedImageIndex = (-1).obs; // ใช้ -1 แทน null

  RxInt matchedPairs = 0.obs;

  @override
  void onInit() {
    super.onInit();
    initializeGame();
  }

  void initializeGame() {
    words.value = List.from(_vocabularyService.vocabularies.take(4));
    images.value = List.from(words.map((vocab) => vocab.imageUrl));

    words.shuffle();
    images.shuffle();

    wordSelected.value = List.filled(words.length, false);
    imageSelected.value = List.filled(images.length, false);

    selectedWordIndex.value = -1; // ใช้ -1 แทน null
    selectedImageIndex.value = -1; // ใช้ -1 แทน null
    matchedPairs.value = 0;
  }

  void handleWordTap(int index) {
    if (wordSelected[index] || matchedPairs.value == words.length) return;

    if (selectedWordIndex.value == -1) {
      // ตรวจสอบด้วย -1
      selectedWordIndex.value = index;
      wordSelected[index] = true;
    } else if (selectedWordIndex.value == index) {
      selectedWordIndex.value = -1;
      wordSelected[index] = false;
    }
  }

  void handleImageTap(int index) {
    if (imageSelected[index] || matchedPairs.value == words.length) return;

    if (selectedImageIndex.value == -1) {
      // ตรวจสอบด้วย -1
      selectedImageIndex.value = index;
      imageSelected[index] = true;
    } else if (selectedImageIndex.value == index) {
      selectedImageIndex.value = -1;
      imageSelected[index] = false;
    }

    if (selectedWordIndex.value != -1 && selectedImageIndex.value != -1) {
      if (words[selectedWordIndex.value].imageUrl ==
          images[selectedImageIndex.value]) {
        matchedPairs.value++;
        wordSelected[selectedWordIndex.value] = true;
        imageSelected[selectedImageIndex.value] = true;
        selectedWordIndex.value = -1;
        selectedImageIndex.value = -1;

        if (matchedPairs.value == words.length) {
          Get.dialog(
            AlertDialog(
              title: Text('Congratulations!'),
              content: Text('You matched all pairs!'),
              actions: [
                TextButton(
                  onPressed: () {
                    Get.back();
                    initializeGame();
                  },
                  child: Text('Play Again'),
                ),
              ],
            ),
          );
        }
      } else {
        Future.delayed(Duration(milliseconds: 500), () {
          wordSelected[selectedWordIndex.value] = false;
          imageSelected[selectedImageIndex.value] = false;
          selectedWordIndex.value = -1;
          selectedImageIndex.value = -1;
        });
      }
    }
  }
}
