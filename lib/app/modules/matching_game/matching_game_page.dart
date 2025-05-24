import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:translate/widgets/matching_tile.dart';
import 'package:translate/app/modules/matching_game/matching_game_controller.dart';

class MatchingGamePage extends GetView<MatchingGameController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Matching Game'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: controller.initializeGame,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Match words with images',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Obx(() => GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: controller.words.length,
                    itemBuilder: (context, index) {
                      return MatchingTile(
                        text: controller.words[index].word,
                        isSelected: controller.wordSelected[index],
                        onTap: () => controller.handleWordTap(index),
                      );
                    },
                  )),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Obx(() => GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: controller.images.length,
                    itemBuilder: (context, index) {
                      return MatchingTile(
                        imageUrl: controller.images[index],
                        isSelected: controller.imageSelected[index],
                        onTap: () => controller.handleImageTap(index),
                      );
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
