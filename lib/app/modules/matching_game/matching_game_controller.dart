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
  RxInt? selectedWordIndex = null.obs as RxInt?;
  RxInt? selectedImageIndex = null.obs as RxInt?;
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

    selectedWordIndex = null.obs as RxInt?;
    selectedImageIndex = null.obs as RxInt?;
    matchedPairs.value = 0;
  }

  void handleWordTap(int index) {
    if (wordSelected[index] || matchedPairs.value == words.length) return;

    if (selectedWordIndex?.value == null) {
      selectedWordIndex = index.obs;
      wordSelected[index] = true;
    } else if (selectedWordIndex?.value == index) {
      selectedWordIndex = null.obs as RxInt?;
      wordSelected[index] = false;
    }
  }

  void handleImageTap(int index) {
    if (imageSelected[index] || matchedPairs.value == words.length) return;

    if (selectedImageIndex?.value == null) {
      selectedImageIndex = index.obs;
      imageSelected[index] = true;
    } else if (selectedImageIndex?.value == index) {
      selectedImageIndex = null.obs as RxInt?;
      imageSelected[index] = false;
    }

    if (selectedWordIndex?.value != null && selectedImageIndex?.value != null) {
      if (words[selectedWordIndex!.value].imageUrl ==
          images[selectedImageIndex!.value]) {
        matchedPairs.value++;
        wordSelected[selectedWordIndex!.value] = true;
        imageSelected[selectedImageIndex!.value] = true;
        selectedWordIndex = null.obs as RxInt?;
        selectedImageIndex = null.obs as RxInt?;

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
          wordSelected[selectedWordIndex!.value] = false;
          imageSelected[selectedImageIndex!.value] = false;
          selectedWordIndex = null.obs as RxInt?;
          selectedImageIndex = null.obs as RxInt?;
        });
      }
    }
  }
}
