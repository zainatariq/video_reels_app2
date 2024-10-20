import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import '../model/video.dart';

abstract class VideoCacheDataSource {
  Future<void> startCachingVideos(List<VideoItem> videos);

  Future<void> cacheVideo(String url, int index, int totalVideos, VideoItem videoItem);

  Future<FileInfo?> getCachedVideo(String url);

  Future<List<VideoItem>?> getCachedVideos();
}

 class VideoCacheDataSourceImpl implements VideoCacheDataSource {
  final CacheManager cacheManager;

  VideoCacheDataSourceImpl(this.cacheManager);

  @override
  Future<void> startCachingVideos(List<VideoItem> videos) async {
    for (int i = 0; i < videos.length; i++) {
      // Pass the whole VideoItem when caching
      await cacheVideo(videos[i].cdnUrl, i, videos.length, videos[i]);
    }
  }


  @override
  Future<void> cacheVideo(String url, int index, int totalVideos, VideoItem videoItem) async {
    FileInfo? fileInfo = await getCachedVideo(url);
    if (fileInfo == null) {
      log('Downloading file: $url');
      await cacheManager.downloadFile(url);
      log('Downloaded file: $url');

       String serializedVideo = jsonEncode(videoItem.toJson());
      await cacheManager.putFile(url, Uint8List.fromList(utf8.encode(serializedVideo))); // Store video metadata

      if (index + 1 == totalVideos) {
        log('Caching finished');
      }
    } else {
      log('File already cached: $url');
    }
  }

  @override
  Future<FileInfo?> getCachedVideo(String url) async {
    return await cacheManager.getFileFromCache(url);
  }

  @override
  Future<List<VideoItem>?> getCachedVideos() async {
    List<VideoItem> cachedVideos = [];

     List<String> urlsToCheck = [/* Add your known video URLs */];

    for (var url in urlsToCheck) {
      FileInfo? fileInfo = await getCachedVideo(url);
      if (fileInfo != null) {
        try {
          String jsonString = utf8.decode(await fileInfo.file.readAsBytes());
          Map<String, dynamic> jsonData = jsonDecode(jsonString);
          cachedVideos.add(VideoItem.fromJson(jsonData));
        } catch (e) {
          log('Error deserializing cached video: $e');
        }
      }
    }

    return cachedVideos;
  }
}
