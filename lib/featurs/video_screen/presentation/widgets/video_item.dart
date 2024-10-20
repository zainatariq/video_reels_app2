import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../bases/pagination/widgets/paginations_widgets.dart';
import '../../data/model/video.dart'; 
import 'video_player.dart';


class VideoItemWidget extends PaginationViewItem<VideoItem> {
  const VideoItemWidget({super.key, required super.data});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Video player widget (background)
        Positioned.fill(
          child: VideoPlayerWidget(videoItem: data),
        ),

        Positioned(
          right: 16,
          bottom: 60,
          child: Column(
            children: [
              IconButton(
                icon: const Icon(Icons.favorite, color: Colors.white),
                onPressed: () {},
              ),
              Text(
                data.totalLikes.toString(),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              IconButton(
                icon: const Icon(Icons.comment, color: Colors.white),
                onPressed: () {},
              ),
              Text(
                data.totalComments.toString(),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              IconButton(
                icon: const Icon(Icons.share, color: Colors.white),
                onPressed: () {},
              ),
              Text(
                data.totalShare.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),

        // User profile and details (overlay on top)
        Positioned(
          bottom: 80.h,
          left: 0,
          right: 30,
          child: Container(
            padding: const EdgeInsets.all(8),
            color: Colors.black.withOpacity(0.4), // A bit of transparency
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(data.user.profilePictureCdn),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.user.fullname,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        data.title,
                        style: const TextStyle(color: Colors.white, fontSize: 14),
                        // overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

  }
}
