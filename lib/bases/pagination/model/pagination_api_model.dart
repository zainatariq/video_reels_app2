class PaginationApiModel {
  int? page, totalPages, totalResults;
  bool? hasNext, hasPrevious;
  PaginationApiModel({
    this.totalResults,
    this.hasPrevious = true,
    this.page = 1,
    this.hasNext = true,
    this.totalPages,
  });

  factory PaginationApiModel.fromJson(Map<String, dynamic> map) {
    return PaginationApiModel(
      totalResults: map['total'],
      hasPrevious: map['page'] > 1,
      page: map['page'],
      hasNext: map['page'] < (map['total'] / map['limit']).ceil(),
      totalPages: (map['total'] / map['limit']).ceil(),
    );
  }

  // factory PaginationApiModel.fromJson(Map<String, dynamic> map) {
  //   return PaginationApiModel(
  //     totalResults: map['total'],
  //     hasPrevious: map['previousPage'] != null,
  //     page: map['currentPage'],
  //     hasNext: map['nextPage'] != null,
  //     totalPages: (map['total']! / map['perPage']!).ceil(),
  //   );
  // }

  factory PaginationApiModel.noPaginate() {
    return PaginationApiModel(
      hasPrevious: true,
      page: 1,
      hasNext: false,
      totalPages: 1,
    );
  }
}
