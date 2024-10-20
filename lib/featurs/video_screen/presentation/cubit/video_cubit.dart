import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_reels_app/featurs/video_screen/presentation/cubit/video_state.dart';
import 'package:bloc/bloc.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

import '../../../../injection_contanier.dart';
import '../../data/local_data_source/locale_data_source.dart';

class VideoPlayerCubit extends Cubit<VideoPlayerState> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;
  String? cachedVideoPath;

  VideoPlayerCubit() : super(VideoPlayerInitial());

  Future<void> initializePlayer(String videoUrl) async {
    try {
      emit(VideoPlayerLoading());

       final cachedFileInfo = await sl<VideoCacheDataSource>().getCachedVideo(videoUrl);
      if (cachedFileInfo != null) {
        cachedVideoPath = cachedFileInfo.file.path;
        log('Using cached video: $cachedVideoPath');
        videoUrl = cachedVideoPath!;
      }

       if (cachedVideoPath != null && cachedVideoPath!.isNotEmpty) {
        videoPlayerController = VideoPlayerController.file(File(cachedVideoPath!));
      } else {
        videoPlayerController = VideoPlayerController.network(videoUrl);
      }

      await videoPlayerController.initialize();

      chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: true,
        looping: true,
        showControls: true,
      );

      emit(VideoPlayerLoaded(chewieController));
    } catch (e) {
      emit(VideoPlayerError('Failed to load video: $e'));
    }
  }

  void stopVideo() {
    chewieController.pause();
    videoPlayerController.seekTo(Duration.zero);
  }

  @override
  Future<void> close() {
    videoPlayerController.dispose();
    chewieController.dispose();
    return super.close();
  }
}
