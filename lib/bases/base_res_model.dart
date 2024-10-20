//
//
//
//
//
//
// import 'package:video_reels_app/bases/pagination/model/pagination_api_model.dart';
//
//
// abstract class BaseResModel<T> {
//   String? message;
//   int? status;
//
//   PaginationApiModel?  meta;
//
//   BaseResModel({
//     this.message,
//     this.status,
//     this.meta,
//   });
//   T? get data;
//   int get statusNumber;
//
//
// }
//
// class MsgModel extends BaseResModel<MsgModel> {
//
//
//   Map<String,dynamic>? stateData;
//   MsgModel({
//
//     this.stateData,
//   });
//
//
//
//   MsgModel.fromKMap(Map<String, dynamic> map) {
//     message = map['message'];
//     status = map['status']?.toInt();
//     stateData = map['data'];
//   }
//
//   // String toJson() => json.encode(toMap());
//
//   factory MsgModel.fromJson(Map<String, dynamic> map) => MsgModel.fromKMap(map);
//
//   bool get isSuccess => status == 200;
//   @override
//   MsgModel? get data => this;
//
//   @override
//   int get statusNumber => status!;
//
//   @override
//   String toString() {
//
//     return "MSG( msg $message  status $status)";
//   }
//
// }
import 'package:video_reels_app/bases/pagination/model/pagination_api_model.dart';

abstract class BaseResModel<T> {
  String? message;
  int? status;

  PaginationApiModel? meta;

  BaseResModel({
    this.message,
    this.status,
    this.meta,
  });

  T? get data;
  int get statusNumber;
}

class MsgModel extends BaseResModel<List<dynamic>> {
  List<dynamic>? stateData;

  MsgModel({
    this.stateData,
    String? message,
    int? status,
    PaginationApiModel? meta,
  }) : super(
    message: message,
    status: status,
    meta: meta,
  );

  @override
  List<dynamic>? get data => stateData;

  factory MsgModel.fromJson(Map<String, dynamic> json) {
    final metaData = json['data']?['meta_data'];
    final PaginationApiModel? paginationMeta = metaData != null
        ? PaginationApiModel.fromJson(metaData as Map<String, dynamic>)
        : null;

    return MsgModel(
      stateData: json['data']?['data'],
      message: json['message'],
      status: json['statusCode'],
      meta: paginationMeta,
    );
  }

  bool get isSuccess => status == 200;

  @override
  int get statusNumber => status ?? 0;

  @override
  String toString() {
    return "MSG( msg: $message, status: $status )";
  }
}
