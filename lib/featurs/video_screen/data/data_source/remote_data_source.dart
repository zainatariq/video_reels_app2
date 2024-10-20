 import 'dart:developer';
import '../../../../bases/pagination/model/main_paginate_request_entity_model.dart';
import '../../../../bases/pagination/model/pagination_api_model.dart';
import '../../../../core/api/api_consumer.dart';
 import '../../../../core/api/end_points.dart';
import '../../../../helper/data_state.dart';
import '../model/video.dart';

abstract class GetVideosRemoteDataSource {
  getVideosListOfReels({required GetVideosReqModel req});
 }

class GetVideosRemoteDataSourceImpl
    implements GetVideosRemoteDataSource {
  ApiConsumer consumer;
  GetVideosRemoteDataSourceImpl({required this.consumer});
  @override
  getVideosListOfReels({required GetVideosReqModel req}) async {
    try {
      final response = await consumer.get(
        EndPoints.getData,
        queryParameters: req.toMap(),
      );
      if (response == null || response['data'] == null) {
         return const DataFailedErrorMsg('No data received', null);
      }
      final videosModel = VideoReelModel.fromMap(response);
      final List<VideoItem>? list = videosModel.data;
      final paginationData = response['data']['meta_data'];
      final PaginationApiModel? meta = paginationData != null
          ? PaginationApiModel.fromJson(paginationData)
          : null;
      if (list == null || meta == null) {
        return const DataFailedErrorMsg('Pagination data or video list is null', null);
      }
      return DataSuccess((meta, list));
    } catch (e, s) {
      log("### getBankError", name: "get bank error .from", stackTrace: s);
      throw e;
    }
  }
}