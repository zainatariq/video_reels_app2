import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/video.dart';
import '../cubit/video_cubit.dart';
import '../cubit/video_state.dart';


class VideoPlayerWidget extends StatelessWidget {
  final VideoItem videoItem;

  const VideoPlayerWidget({Key? key, required this.videoItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VideoPlayerCubit()..initializePlayer(videoItem.cdnUrl),
      child: BlocBuilder<VideoPlayerCubit, VideoPlayerState>(
        builder: (context, state) {
          if (state is VideoPlayerLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is VideoPlayerLoaded) {
            return Chewie(controller: state.chewieController);
          }
          else if (state is VideoPlayerError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Error: check connection 🙁',
                    style: const TextStyle(color: Colors.red),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Retry loading the video
                      context.read<VideoPlayerCubit>().initializePlayer(videoItem.cdnUrl);
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: Text('Initializing...'));
          }
        },
      ),
    );
  }
}
