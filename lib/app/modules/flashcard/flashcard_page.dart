import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translate/app/modules/flashcard/flashcard_controller.dart';
import 'package:translate/widgets/flash_card.dart';

class FlashcardPage extends GetView<FlashcardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flashcards'),
      ),
      body: Obx(() => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: controller.toggleTranslation,
                  child: FlashCard(
                    word: controller.currentVocab.word,
                    translation: controller.currentVocab.translation,
                    imageUrl: controller.currentVocab.imageUrl,
                    showTranslation: controller.showTranslation.value,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: controller.prevCard,
                      iconSize: 40,
                    ),
                    SizedBox(width: 20),
                    IconButton(
                      icon: Icon(Icons.arrow_forward),
                      onPressed: controller.nextCard,
                      iconSize: 40,
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
