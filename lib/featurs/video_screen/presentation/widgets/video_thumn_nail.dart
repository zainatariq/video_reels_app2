



import 'package:flutter/material.dart';

class VideoThumbnail extends StatelessWidget {
  final String thumbnailUrl;

  const VideoThumbnail({Key? key, required this.thumbnailUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        thumbnailUrl,
        width: 80,
        height: 80,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) =>
            Icon(Icons.image_not_supported),
      ),
    );
  }
}
