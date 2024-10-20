import 'package:chewie/chewie.dart';
import 'package:equatable/equatable.dart';

import '../../data/model/video.dart';

abstract class VideoPlayerState {}

class VideoPlayerInitial extends VideoPlayerState {}

class VideoPlayerLoading extends VideoPlayerState {}

class VideoPlayerLoaded extends VideoPlayerState {
  final ChewieController chewieController;

  VideoPlayerLoaded(this.chewieController);
}

class VideoPlayerError extends VideoPlayerState {
  final String error;

  VideoPlayerError(this.error);
}

// class