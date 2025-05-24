import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MatchingTile extends StatelessWidget {
  final String? text;
  final String? imageUrl;
  final bool isSelected;
  final VoidCallback onTap;

  const MatchingTile({
    this.text,
    this.imageUrl,
    required this.isSelected,
    required this.onTap,
  }) : assert(text != null || imageUrl != null);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: isSelected ? 8 : 2,
        color: isSelected ? Colors.blue[100] : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: text != null
                ? Text(
                    text!,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : CachedNetworkImage(
                    imageUrl: imageUrl!,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
          ),
        ),
      ),
    );
  }
}
