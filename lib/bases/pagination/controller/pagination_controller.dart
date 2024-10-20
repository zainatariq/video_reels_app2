// ignore_for_file: prefer_final_fields

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../model/main_req_entity.dart';
import '../model/pagination_api_model.dart';
import '../pagination-handler/pull_to_refresh_handler.dart';
import '../state/pagination_bloc_state.dart';
import '../use-case/main_paginate_list_use_case.dart';

class PaginationController<PaginateApiUseCase extends MainPaginateListUseCase, Entity> extends Cubit<PaginationBlocState> {
  PaginateApiUseCase? useCase;

  PaginationApiModel pagination = PaginationApiModel();
  List<Entity> items = [];

  late RefreshController? _refreshController;

  PaginationController(this.useCase, {this.refreshControllerr})
      : super(PaginationBlocInitial()) {
    if (useCase != null) {
      _init();
    }
  }

  RefreshController? get refreshController => _refreshController;

  RefreshController? refreshControllerr;

  PullToRefreshHandler? _handler;

  final ScrollController scrollController = ScrollController();

  make(PaginateApiUseCase apiUseCase) {
    useCase = apiUseCase;
    _init();
  }

  startInitData() {
    _restData();
    onRefreshData();
    // _handelRes();
  }

  void _init() {
    _handler = PullToRefreshHandler();
    _refreshController = refreshControllerr ?? _handler?.refreshController;
  }

  static PaginationController<PaginateApiUseCase, Entity>
  get<PaginateApiUseCase extends MainPaginateListUseCase, Entity>(
      context) =>
      BlocProvider.of<PaginationController<PaginateApiUseCase, Entity>>(
          context);
  @override
  Future<void> close() {
    _handler?.dispose();
    scrollController.dispose();
    return super.close();
  }

  bool get canRefresh => pagination.hasPrevious == true;

  bool get canFetchMore => pagination.hasNext == true;

  _restData() {
    _handler!.refreshController!.headerMode!.value = RefreshStatus.idle;
    _handler!.refreshController!.footerMode!.value = LoadStatus.idle;
    pagination.page = 1;
    pagination.hasPrevious = false;
    items.clear();
  }

  moveScrollToMaxScrollExtent() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent + 300,
      duration: const Duration(milliseconds: 80),
      curve: Curves.bounceIn,
    );
    // SchedulerBinding.instance.addPostFrameCallback((_) {
    //   scrollController.jumpTo(scrollController.position.maxScrollExtent);
    // });
  }

  void get restData => _restData();

  emitNewItemAdded(List<Entity> entities) {
    items = entities;
    emit(PaginationLoaded<Entity>(items));
  }

  // onRefreshData({Function()? onLoadSucses}) async {
  //   emit(
  //     PaginationLoading(),
  //   );
  //
  //   _restData();
  //   await _handelRes(
  //     onSusses: () {
  //       _handler?.refreshCompleted();
  //       emit(
  //         PaginationLoaded<Entity>(items),
  //       );
  //       // emit(PaginationLoaded<Entity>(items));
  //
  //       //  moveScrollToMaxScrollExtent();
  //     },
  //     onError: (error) {
  //       _handler?.refreshFailed();
  //
  //       // emit(PaginationError(
  //       //     error ?? AppGlobalConstants.notFoundDataDefaultMsg));
  //       emit(
  //         PaginationError(
  //           // todo
  //           // error ?? AppGlobalConstants.notFoundDataDefaultMsg,
  //           "$error",
  //           // "notFoundData",
  //         ),
  //       );
  //     },
  //     onNoMoreData: () {
  //       _handler?.loadNoData();
  //       emit(
  //         PaginationLoaded(items),
  //         // status: RxStatus.success(),
  //       );
  //     },
  //     onEmptyResList: () {
  //       emit(
  //         PaginationNoDataFoundState(),
  //         // status: RxStatus.success(),
  //       );
  //     },
  //   );
  // }
  // }
  // loadMore() async {
  //   if (!canFetchMore) {
  //     _handler?.loadNoData();
  //     // change(
  //     //   PaginationNoMoreData(items),
  //     //   status: RxStatus.success(),
  //     // );
  //   } else {
  //     pagination.page = pagination.page! + 1;
  //     await _handelRes(
  //       onSusses: () {
  //         _handler?.loadComplete();
  //         emit(
  //           PaginationLoaded<Entity>(items),
  //           // status: RxStatus.success(),
  //         );
  //       },
  //       onError: (error) {
  //         _handler?.loadFailed();
  //
  //         emit(
  //           const PaginationError(
  //             // error ?? AppGlobalConstants.notFoundDataDefaultMsg,
  //             // TODO:
  //               "no data found"),
  //         );
  //       },
  //       onNoMoreData: () {
  //         _handler?.loadNoData();
  //         emit(
  //           PaginationLoaded(items),
  //         );
  //       },
  //       onEmptyResList: () {
  //         // TODO:  show toast here no data found
  //       },
  //     );
  //   }
  // }

  bool isLoading = false;  // Flag to track loading state

  onRefreshData({Function()? onLoadSucses}) async {
    if (isLoading) return;  // Prevent multiple calls
    isLoading = true;       // Set loading state to true

    emit(PaginationLoading());

    _restData();
    await _handelRes(
      onSusses: () {
        _handler?.refreshCompleted();
        emit(PaginationLoaded<Entity>(items));
        isLoading = false;  // Reset loading state
      },
      onError: (error) {
        _handler?.refreshFailed();
        emit(PaginationError("$error"));
        isLoading = false;  // Reset loading state
      },
      onNoMoreData: () {
        _handler?.loadNoData();
        emit(PaginationLoaded(items));
        isLoading = false;  // Reset loading state
      },
      onEmptyResList: () {
        emit(PaginationNoDataFoundState());
        isLoading = false;  // Reset loading state
      },
    );
  }

  loadMore() async {
    if (isLoading || !canFetchMore) return;  // Prevent multiple calls or loading more when not needed
    isLoading = true;                        // Set loading state to true

    pagination.page = pagination.page! + 1;
    await _handelRes(
      onSusses: () {
        _handler?.loadComplete();
        emit(PaginationLoaded<Entity>(items));
        isLoading = false;  // Reset loading state
      },
      onError: (error) {
        _handler?.loadFailed();
        emit(PaginationError("no data found"));
        isLoading = false;  // Reset loading state
      },
      onNoMoreData: () {
        _handler?.loadNoData();
        emit(PaginationLoaded(items));
        isLoading = false;  // Reset loading state
      },
      onEmptyResList: () {
        isLoading = false;  // Reset loading state
      },
    );
  }




  // _handelRes({
  //   Function()? onSusses,
  //   Function(String? error)? onError,
  //   Function()? onNoMoreData,
  //   Function()? onEmptyResList,
  // }) async {
  //   try {
  //     print('PaginationError #::::::::::: 1 ${useCase?.req!.reqPage}');
  //     final res = await useCase!.invoke(parm: useCase!.setPage(pagination.page!));
  //     print('DDD #${res.toString()}');
  //
  //     res.fold(
  //           (failure) {
  //         // Handle failure
  //         onError?.call(failure.errorMsg);
  //       },
  //           (success) {
  //         // Handle success
  //         final pagination = success.data?.item1;
  //         final resList = success.data?.item2;
  //
  //         if (resList.isEmpty) {
  //           onEmptyResList?.call();
  //         } else {
  //           _handelSucsesCase(
  //             pagination,
  //             resList ?? [],
  //             onNoMoreData: () => onNoMoreData?.call(),
  //             onSusses: () => onSusses?.call(),
  //             onEmptyResList: () => onEmptyResList?.call(),
  //           );
  //           onSusses?.call();
  //         }
  //       },
  //     );
  //   } on DioError catch (e) {
  //     onError?.call(e.toString());
  //     throw e;
  //   } catch (e) {
  //     print('PaginationError ::::::::::: $e');
  //     log(
  //       e.toString(),
  //       name: "PaginationError",
  //       stackTrace: StackTrace.current,
  //     );
  //     onError?.call(e.toString());
  //   }
  // }
  //


  //




  // _handelRes({
  //   Function()? onSusses,
  //   Function(String? error)? onError,
  //   Function()? onNoMoreData,
  //   Function()? onEmptyResList,
  // }) async {
  //   try {
  //     print('PaginationError #::::::::::: 1 ${useCase?.req!.reqPage}');
  //     final res = await useCase!.invoke(parm: useCase!.setPage(pagination.page!));
  //     print('DDD #${res.error} ${res.errorMsg} - ${res.data }');
  //
  //     if (res.error != null) {
  //       // Handle error case
  //       onError?.call(res.error!.toString());
  //     } else {
  //       final pagination = res.data!.$1;
  //       final resList = res.data!.$2;
  //
  //       if (resList.isEmpty) {
  //         onEmptyResList?.call();
  //       } else {
  //         _handelSucsesCase(
  //           pagination,
  //           resList as List<Entity>,
  //           onNoMoreData: () => onNoMoreData?.call(),
  //           onSusses: () => onSusses?.call(),
  //           onEmptyResList: () => onEmptyResList?.call(),
  //         );
  //         onSusses?.call();
  //       }
  //     }
  //   } on DioError catch (e) {
  //     onError?.call(e.toString());
  //     throw e;
  //   } catch (e) {
  //     print('PaginationError ::::::::::: $e');
  //     log(
  //       e.toString(),
  //       name: "PaginationError",
  //       stackTrace: StackTrace.current,
  //     );
  //     onError?.call(e.toString());
  //   }
  // }

  //
  _handelSucsesCase(
      PaginationApiModel ?pagination,
      List<Entity> resList, {
        Function()? onNoMoreData,
        Function()? onSusses,
        Function()? onEmptyResList,
      }) {
    if (resList.isEmpty) {
      onEmptyResList?.call();
      return;
    }

    if (items.isNotEmpty) {
      items = items + resList;
    } else {
      items = resList;
    }

    if (!pagination!.hasNext!) {
      onNoMoreData?.call();
      return;
    }
    onSusses?.call();
  }

  _handelRes({
    Function()? onSusses,
    Function(String? error)? onError,
    Function()? onNoMoreData,
    Function()? onEmptyResList,
  }) async {
    try {
      // Log the request page for debugging
      print('PaginationError #::::::::::: Request Page: ${useCase?.req?.reqPage}');

      // Ensure useCase is not null and call invoke
      final res = await useCase?.invoke(parm: useCase?.setPage(pagination.page ?? 1));

      // Handle the case where the response is null
      if (res == null) {
        onError?.call('Response is null');
        print('Error: The response from useCase.invoke is null');
        return;
      }

      // Log the response data for debugging
      print('Response received: ${res.data}');

      // Handle errors in the response
      if (res.error != null) {
        onError?.call(res.error!.toString());
        print('Error occurred: ${res.error}');
        return;
      }

      // Extract pagination data and the result list
      final paginationData = res.data?.$1;
      final resList = res.data?.$2;

      // Handle invalid data structure
      if (paginationData == null || resList == null) {
        onError?.call('Invalid data structure');
        print('Error: Pagination data or result list is null');
        return;
      }

      // Handle empty result list
      if (resList.isEmpty) {
        onEmptyResList?.call();
        print('No more data available.');
        return;
      }

      // Handle success case and pass the result
      _handelSucsesCase(
        paginationData,
        resList.cast<Entity>(),  // Casting to appropriate type
        onNoMoreData: () => onNoMoreData?.call(),
        onSusses: () => onSusses?.call(),
      );

      // Call success callback
      onSusses?.call();

    } on DioError catch (e) {
      // Handle Dio-related errors and log the exception
      onError?.call(e.toString());
      print('DioError occurred: $e');
      log(
        "DioError: $e",
        name: "PaginationError",
        stackTrace: StackTrace.current,
      );
      throw e;

    } catch (e) {
      // Handle any other types of errors and log the exception
      print('PaginationError occurred: $e');
      log(
        "Error: $e",
        name: "PaginationError",
        stackTrace: StackTrace.current,
      );
      onError?.call(e.toString());
    }
  }






  void get showEmptyScreen => _showEmptyScreen();
  _showEmptyScreen() {
    emit(
      PaginationBlocInitial(),
      // status: RxStatus.success(),
    );
  }

  void get showLoadingScreen => _showLoadingScreen();
  _showLoadingScreen() {
    emit(
      PaginationLoading(),
    );
  }

  void changeRequest<P extends MainPaginateRequestEntity>(P request) {
    useCase!.req = request;
    onRefreshData();
  }
}
