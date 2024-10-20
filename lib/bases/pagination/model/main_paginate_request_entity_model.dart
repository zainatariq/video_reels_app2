import 'main_req_entity.dart';

class MainPaginateRequestEntityModel
    extends MainPaginateRequestEntity<MainPaginateRequestEntityModel> {
  int? page;

  MainPaginateRequestEntityModel(this.page, {Map<String, dynamic>? newMap})
      : super(page, map: newMap);

  @override
  Map<String, dynamic> toMap() {
    return {
      "page": page ?? 1,
    };
  }
}

class GetVideosReqModel extends MainPaginateRequestEntity<GetVideosReqModel> {
  int? page;
  int? limit;
  String? country;

  GetVideosReqModel(
      {Map<String, dynamic>? newMap, this.page, this.limit, this.country})
      : super(page, map: {
          ...?newMap,
          'limit': limit,
          'country': country,
        });

  @override
  Map<String, dynamic> toMap() {
    return {
      "limit": limit,
      "page": page ?? 1,
      "country": country,
    };
  }
}
