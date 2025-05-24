import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class FlashCard extends StatelessWidget {
  final String word;
  final String translation;
  final String imageUrl;
  final bool showTranslation;

  const FlashCard({
    required this.word,
    required this.translation,
    required this.imageUrl,
    required this.showTranslation,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: 300,
        height: 400,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CachedNetworkImage(
              imageUrl: imageUrl,
              height: 200,
              fit: BoxFit.cover,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Text(
              showTranslation ? translation : word,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              showTranslation ? "Tap to see word" : "Tap to see translation",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
