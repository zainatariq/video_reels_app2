import '../../../../bases/base_res_model.dart';
import '../../../../bases/pagination/model/pagination_api_model.dart';

// class VideoReelModel extends BaseResModel<List<VideoItem>> {
//   final List<VideoItem>? _data;
//
//   VideoReelModel(
//       this._data, {
//         super.status,
//         super.message,
//         super.meta,
//       });
//
//   @override
//   List<VideoItem>? get data => _data;
//
//   @override
//   int get statusNumber => status!;
//
//   factory VideoReelModel.fromMap(Map<String, dynamic> map) {
//
//     // final List<dynamic>? items = map['data']?['data'];
//     //
//     // if (items == null) {
//     //   throw Exception('Data is null or not in expected format');
//     // }
//     // //
//     // final List<VideoItem>? videoItems = items.map((item) => VideoItem.fromJson(item)).toList();
//     // final paginationData = map['data']?['meta_data'];
//     return VideoReelModel(
//         map["data"] == null
//             ? []
//             : List<VideoItem>.from(map["data"]!.map((x) => VideoItem.fromJson(x))),
//
//       message: map['message'] as String?,
//       status: map['statusCode'] as int?,
//       meta:  map['data']['meta_data'] != null ?
//       PaginationApiModel.fromJson(map['data']['meta_data']) : null,
//     );
//   }
//
// }
//
// class VideoItem {
//   int id;
//   String title;
//   String url;
//   String cdnUrl;
//   String thumbCdnUrl;
//   int userId;
//   String status;
//   String slug;
//   String encodeStatus;
//   int priority;
//   int categoryId;
//   int totalViews;
//   int totalLikes;
//   int totalComments;
//   int totalShare;
//   int totalWishlist;
//   int duration;
//   String byteAddedOn;
//   String byteUpdatedOn;
//   String bunnyStreamVideoId;
//   String? language;
//   int bunnyEncodingStatus;
//   dynamic deletedAt;
//   VideoUser user;
//   bool isLiked;
//   bool isWished;
//   bool isFollow;
//
//   VideoItem({
//     required this.id,
//     required this.title,
//     required this.url,
//     required this.cdnUrl,
//     required this.thumbCdnUrl,
//     required this.userId,
//     required this.status,
//     required this.slug,
//     required this.encodeStatus,
//     required this.priority,
//     required this.categoryId,
//     required this.totalViews,
//     required this.totalLikes,
//     required this.totalComments,
//     required this.totalShare,
//     required this.totalWishlist,
//     required this.duration,
//     required this.byteAddedOn,
//     required this.byteUpdatedOn,
//     required this.bunnyStreamVideoId,
//     this.language,
//     required this.bunnyEncodingStatus,
//     this.deletedAt,
//     required this.user,
//     required this.isLiked,
//     required this.isWished,
//     required this.isFollow,
//   });
//
//   factory VideoItem.fromJson(Map<String, dynamic> json) {
//     return VideoItem(
//       id: json['id'],
//       title: json['title'],
//       url: json['url'],
//       cdnUrl: json['cdn_url'],
//       thumbCdnUrl: json['thumb_cdn_url'],
//       userId: json['user_id'],
//       status: json['status'],
//       slug: json['slug'],
//       encodeStatus: json['encode_status'],
//       priority: json['priority'],
//       categoryId: json['category_id'],
//       totalViews: json['total_views'],
//       totalLikes: json['total_likes'],
//       totalComments: json['total_comments'],
//       totalShare: json['total_share'],
//       totalWishlist: json['total_wishlist'],
//       duration: json['duration'],
//       byteAddedOn: json['byte_added_on'],
//       byteUpdatedOn: json['byte_updated_on'],
//       bunnyStreamVideoId: json['bunny_stream_video_id'],
//       language: json['language'],
//       bunnyEncodingStatus: json['bunny_encoding_status'],
//       deletedAt: json['deleted_at'],
//       user: VideoUser.fromJson(json['user']),
//       isLiked: json['is_liked'],
//       isWished: json['is_wished'],
//       isFollow: json['is_follow'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'title': title,
//       'url': url,
//       'cdn_url': cdnUrl,
//       'thumb_cdn_url': thumbCdnUrl,
//       'user_id': userId,
//       'status': status,
//       'slug': slug,
//       'encode_status': encodeStatus,
//       'priority': priority,
//       'category_id': categoryId,
//       'total_views': totalViews,
//       'total_likes': totalLikes,
//       'total_comments': totalComments,
//       'total_share': totalShare,
//       'total_wishlist': totalWishlist,
//       'duration': duration,
//       'byte_added_on': byteAddedOn,
//       'byte_updated_on': byteUpdatedOn,
//       'bunny_stream_video_id': bunnyStreamVideoId,
//       'language': language,
//       'bunny_encoding_status': bunnyEncodingStatus,
//       'deleted_at': deletedAt,
//       'user': user.toJson(),
//       'is_liked': isLiked,
//       'is_wished': isWished,
//       'is_follow': isFollow,
//     };
//   }
// }
//
// class VideoUser {
//   int userId;
//   String fullname;
//   String username;
//   String profilePicture;
//   String profilePictureCdn;
//   String? designation;
//
//   VideoUser({
//     required this.userId,
//     required this.fullname,
//     required this.username,
//     required this.profilePicture,
//     required this.profilePictureCdn,
//     this.designation,
//   });
//
//   factory VideoUser.fromJson(Map<String, dynamic> json) {
//     return VideoUser(
//       userId: json['user_id'],
//       fullname: json['fullname'],
//       username: json['username'],
//       profilePicture: json['profile_picture'],
//       profilePictureCdn: json['profile_picture_cdn'],
//       designation: json['designation'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'user_id': userId,
//       'fullname': fullname,
//       'username': username,
//       'profile_picture': profilePicture,
//       'profile_picture_cdn': profilePictureCdn,
//       'designation': designation,
//     };
//   }
// }
import '../../../../bases/base_res_model.dart';
import '../../../../bases/pagination/model/pagination_api_model.dart';

class VideoReelModel extends BaseResModel<List<VideoItem>> {
  final List<VideoItem>? _data;

  VideoReelModel(
      this._data, {
        super.status,
        super.message,
        super.meta,
      });

  @override
  List<VideoItem>? get data => _data;

  @override
  int get statusNumber => status ?? 0;  // Adding null check here
  factory VideoReelModel.fromMap(Map<String, dynamic> map) {
     final List<VideoItem> dataList = map["data"]?['data'] != null
        ? List<VideoItem>.from((map["data"]!['data'] as List).map((x) => VideoItem.fromJson(x as Map<String, dynamic>)))
        : [];

    final paginationMeta = map['data']?['meta_data'] != null
        ? PaginationApiModel.fromJson(map['data']['meta_data'])
        : null;

    return VideoReelModel(
      dataList,
      message: map['message'] as String?,
      status: map['statusCode'] as int?,
      meta: paginationMeta,
    );
  }

}

class VideoItem {
  int id;
  String title;
  String url;
  String cdnUrl;
  String thumbCdnUrl;
  int userId;
  String status;
  String slug;
  String encodeStatus;
  int priority;
  int categoryId;
  int totalViews;
  int totalLikes;
  int totalComments;
  int totalShare;
  int totalWishlist;
  int duration;
  String byteAddedOn;
  String byteUpdatedOn;
  String bunnyStreamVideoId;
  String? language;
  int bunnyEncodingStatus;
  dynamic deletedAt;
  VideoUser user;
  bool isLiked;
  bool isWished;
  bool isFollow;

  VideoItem({
    required this.id,
    required this.title,
    required this.url,
    required this.cdnUrl,
    required this.thumbCdnUrl,
    required this.userId,
    required this.status,
    required this.slug,
    required this.encodeStatus,
    required this.priority,
    required this.categoryId,
    required this.totalViews,
    required this.totalLikes,
    required this.totalComments,
    required this.totalShare,
    required this.totalWishlist,
    required this.duration,
    required this.byteAddedOn,
    required this.byteUpdatedOn,
    required this.bunnyStreamVideoId,
    this.language,
    required this.bunnyEncodingStatus,
    this.deletedAt,
    required this.user,
    required this.isLiked,
    required this.isWished,
    required this.isFollow,
  });

  factory VideoItem.fromJson(Map<String, dynamic> json) {
    return VideoItem(
      id: json['id'],
      title: json['title'],
      url: json['url'],
      cdnUrl: json['cdn_url'],
      thumbCdnUrl: json['thumb_cdn_url'],
      userId: json['user_id'],
      status: json['status'],
      slug: json['slug'],
      encodeStatus: json['encode_status'],
      priority: json['priority'],
      categoryId: json['category_id'],
      totalViews: json['total_views'],
      totalLikes: json['total_likes'],
      totalComments: json['total_comments'],
      totalShare: json['total_share'],
      totalWishlist: json['total_wishlist'],
      duration: json['duration'],
      byteAddedOn: json['byte_added_on'],
      byteUpdatedOn: json['byte_updated_on'],
      bunnyStreamVideoId: json['bunny_stream_video_id'],
      language: json['language'],
      bunnyEncodingStatus: json['bunny_encoding_status'],
      deletedAt: json['deleted_at'],
      user: VideoUser.fromJson(json['user']),
      isLiked: json['is_liked'],
      isWished: json['is_wished'],
      isFollow: json['is_follow'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'url': url,
      'cdn_url': cdnUrl,
      'thumb_cdn_url': thumbCdnUrl,
      'user_id': userId,
      'status': status,
      'slug': slug,
      'encode_status': encodeStatus,
      'priority': priority,
      'category_id': categoryId,
      'total_views': totalViews,
      'total_likes': totalLikes,
      'total_comments': totalComments,
      'total_share': totalShare,
      'total_wishlist': totalWishlist,
      'duration': duration,
      'byte_added_on': byteAddedOn,
      'byte_updated_on': byteUpdatedOn,
      'bunny_stream_video_id': bunnyStreamVideoId,
      'language': language,
      'bunny_encoding_status': bunnyEncodingStatus,
      'deleted_at': deletedAt,
      'user': user.toJson(),
      'is_liked': isLiked,
      'is_wished': isWished,
      'is_follow': isFollow,
    };
  }
}

class VideoUser {
  int userId;
  String fullname;
  String username;
  String profilePicture;
  String profilePictureCdn;
  String? designation;

  VideoUser({
    required this.userId,
    required this.fullname,
    required this.username,
    required this.profilePicture,
    required this.profilePictureCdn,
    this.designation,
  });

  factory VideoUser.fromJson(Map<String, dynamic> json) {
    return VideoUser(
      userId: json['user_id'],
      fullname: json['fullname'],
      username: json['username'],
      profilePicture: json['profile_picture'],
      profilePictureCdn: json['profile_picture_cdn']??'',
      designation: json['designation'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'fullname': fullname,
      'username': username,
      'profile_picture': profilePicture,
      'profile_picture_cdn': profilePictureCdn,
      'designation': designation,
    };
  }
}
