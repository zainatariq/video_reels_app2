import 'dart:developer';

import 'package:video_reels_app/bases/pagination/model/pagination_api_model.dart';
import '../../../../bases/pagination/model/main_paginate_request_entity_model.dart';
import '../../../../bases/pagination/use-case/main_paginate_list_use_case.dart';
import '../../../../helper/data_state.dart';
import '../../../../injection_contanier.dart';
import '../../data/data_source/remote_data_source.dart';
import '../../data/local_data_source/locale_data_source.dart';
import '../../data/model/video.dart';
//
// class GetVideosReelsUseCase
//     implements NetWorkPaginateListUseCase<VideoItem, GetVideosReqModel> {
//   GetVideosReelsUseCase({this.req});
//
//   @override
//   GetVideosReqModel? req = GetVideosReqModel(page: 1);
//
//   @override
//   Future<DataState<(PaginationApiModel, List<VideoItem>)>> invoke(
//       {GetVideosReqModel? parm}) async {
//     assert(parm != null, "Request should not be null");
//     try {
//       // final cachedVideos = await videoCacheDataSource.getCachedVideos();
//       // if (cachedVideos != null && cachedVideos.isNotEmpty) {
//       //   // Return cached videos if available
//       //   log('Using cached videos.');
//       //   // return DataSuccess((null, cachedVideos));
//       // }
//
//       final response = await sl<GetVideosRemoteDataSource>()
//           .getVideosListOfReels(req: parm!);
//
//       if (response is DataSuccess) {
//         final (meta, list) = response.data;
//
//         if (meta == null || list == null) {
//           return const DataFailedErrorMsg(
//               'Pagination data or result list is null', null);
//         }
//         log('List of videos: ${list.toString()}');
//         //
//         // await sl<VideoCacheDataSource>().startCachingVideos(list.map((VideoItem video) =>
//         // video).toList());
//
//         return DataSuccess((meta, list));
//       } else if (response is DataFailedErrorMsg) {
//         return DataFailedErrorMsg(response.errorMsg.toString(), null);
//       } else {
//         return const DataFailedErrorMsg('Unexpected response', null);
//       }
//     } catch (e, s) {
//       return DataFailedErrorMsg(e.toString(), null);
//     }
//   }
//
//   @override
//   GetVideosReqModel setPage(int page) {
//     req?.page = page;
//     req?.reqPage = page;
//     return req!;
//   }
// }

class GetVideosReelsUseCase implements NetWorkPaginateListUseCase<VideoItem, GetVideosReqModel> {
  GetVideosReelsUseCase({this.req});

  @override
  GetVideosReqModel? req = GetVideosReqModel(page: 1);

  @override
  Future<DataState<(PaginationApiModel, List<VideoItem>)>> invoke({GetVideosReqModel? parm}) async {
    assert(parm != null, "Request should not be null");
    try {
      // First, attempt to fetch cached videos
      final cachedVideos = await sl<VideoCacheDataSource>().getCachedVideos();
      if (cachedVideos != null && cachedVideos.isNotEmpty) {
        log('Using cached videos.');
        // Return cached videos
        return DataSuccess((PaginationApiModel(page: 1), cachedVideos));
      }

      // If no cached videos, proceed to fetch from remote API
      final response = await sl<GetVideosRemoteDataSource>().getVideosListOfReels(req: parm!);

      if (response is DataSuccess) {
        final (meta, list) = response.data;

        if (meta == null || list == null) {
          return const DataFailedErrorMsg('Pagination data or result list is null', null);
        }

        log('List of videos: ${list.toString()}');

        // Cache the newly fetched videos
        await sl<VideoCacheDataSource>().startCachingVideos(list);

         return DataSuccess((meta, list));
      } else if (response is DataFailedErrorMsg) {
         log('API request failed. Falling back to cached videos.');
        if (cachedVideos != null && cachedVideos.isNotEmpty) {
          return DataSuccess((PaginationApiModel(page: 1), cachedVideos));
        }
        return DataFailedErrorMsg(response.errorMsg.toString(), null);
      } else {
        return const DataFailedErrorMsg('Unexpected response', null);
      }
    } catch (e, s) {
       log('Exception occurred while fetching videos: $e');
      final cachedVideos = await sl<VideoCacheDataSource>().getCachedVideos();
      if (cachedVideos != null && cachedVideos.isNotEmpty) {
        return DataSuccess((PaginationApiModel(page: 1), cachedVideos));
      }
      return DataFailedErrorMsg(e.toString(), null);
    }
  }

  @override
  GetVideosReqModel setPage(int page) {
    req?.page = page;
    req?.reqPage = page;
    return req!;
  }
}

// class GetVideosReelsUseCase
//     implements NetWorkPaginateListUseCase<VideoItem, GetVideosReqModel> {
//   final VideoCacheDataSource videoCacheDataSource;
//
//   GetVideosReelsUseCase({required this.videoCacheDataSource, this.req});
//
//   @override
//   GetVideosReqModel? req = GetVideosReqModel(page: 1);
//
//   @override
//   Future<DataState<(PaginationApiModel, List<VideoItem>)>> invoke(
//       {GetVideosReqModel? parm}) async {
//     assert(parm != null, "Request should not be null");
//     try {
//       // Fetch cached videos first
//       final cachedVideos = await videoCacheDataSource.getCachedVideos();
//       if (cachedVideos != null && cachedVideos.isNotEmpty) {
//         log('Using cached videos.');
//         // return DataSuccess((null, cachedVideos));
//       }
//
//       // If no cached videos, fetch from API
//       final response = await sl<GetVideosRemoteDataSource>()
//           .getVideosListOfReels(req: parm!);
//
//       if (response is DataSuccess) {
//         final (meta, list) = response.data;
//
//         if (meta == null || list == null) {
//           return const DataFailedErrorMsg(
//               'Pagination data or result list is null', null);
//         }
//         log('List of videos: ${list.toString()}');
//
//         // Cache the fetched videos
//         await videoCacheDataSource.startCachingVideos(list);
//
//         return DataSuccess((meta, list));
//       } else if (response is DataFailedErrorMsg) {
//         return DataFailedErrorMsg(response.errorMsg.toString(), null);
//       } else {
//         return const DataFailedErrorMsg('Unexpected response', null);
//       }
//     } catch (e, s) {
//       return DataFailedErrorMsg(e.toString(), null);
//     }
//   }
//
//   @override
//   GetVideosReqModel setPage(int page) {
//     req?.page = page;
//     req?.reqPage = page;
//     return req!;
//   }
// }
