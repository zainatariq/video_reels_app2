



import 'package:flutter/material.dart';

class VideoMetadata extends StatelessWidget {
  final String title;
  final int totalViews;
  final int duration;

  const VideoMetadata({
    Key? key,
    required this.title,
    required this.totalViews,
    required this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Video Title
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 8),

          // Video Metadata (Views, Duration)
          Row(
            children: [
              Icon(Icons.visibility, size: 16, color: Colors.grey),
              SizedBox(width: 4),
              Text(
                '$totalViews views',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              SizedBox(width: 16),
              Icon(Icons.timer, size: 16, color: Colors.grey),
              SizedBox(width: 4),
              Text(
                formatDuration(duration),
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String formatDuration(int duration) {
    final minutes = duration ~/ 60;
    final seconds = duration % 60;
    return '${minutes}m ${seconds}s';
  }
}
