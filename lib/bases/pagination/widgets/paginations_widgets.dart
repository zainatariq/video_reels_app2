import 'dart:developer';

 import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../core/util/app_strings.dart';
import '../../../core/widgets/loadingWidget.dart';
import '../../../core/widgets/no_data_widget.dart';
import '../controller/pagination_controller.dart';
import '../state/pagination_bloc_state.dart';
import '../use-case/main_paginate_list_use_case.dart';

/// class PaginationListView<UseCase extends MainPaginateApiUseCase, Entity,
/// PaginationListItem extends PaginationViewItem> extends StatelessWidget
class PaginationListView<UseCase extends MainPaginateListUseCase, Entity,
    ItemView extends PaginationViewItem> extends StatelessWidget {
  final ItemView Function(Entity entity) child;

  final Widget? customSeparatorBuilder;
  const PaginationListView({
    super.key,
    required this.child,
    this.listPadding,
    this.customSeparatorBuilder,
  });

  final EdgeInsetsGeometry? listPadding;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaginationController<UseCase, Entity>,
            PaginationBlocState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          // return controller.obx((state) {
          if (state is PaginationLoading) {
            return Container(
                height: 500,
                width: 500,
                alignment: Alignment.center,
                child: const CircularProgressIndicator.adaptive()
                // TODO::               const LoadingDialog(),
                // child: const LoadingWidget(),
                );
          }
          if (state is PaginationError) {
            return const Center(child: Icon(Icons.refresh));
          }
          if ((state is PaginationLoaded) && state.items.isNotEmpty) {
            return ListView.separated(
              padding: listPadding,
              separatorBuilder: (context, index) =>
                  customSeparatorBuilder ?? const SizedBox(height: 10),
              itemBuilder: (context, index) {
                Entity item = state.items[index];
                return child(item);
              },
              itemCount: state.items.length,
            );
          }

          if (state is PaginationLoaded && state.items.isEmpty ||
              state is PaginationNoDataFoundState) {
            // TODO::    return customNoDataWidget();

            return noDataWidget(text: 'no data found');
          }
          if (state is PaginationBlocInitial) {
            return const Center(child: Text("PaginationBlocInitial"));
          }
          if (state is PaginationNoMoreData && state.items.isNotEmpty) {
            return ListView.separated(
              padding: listPadding,
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                Entity item = state.items[index];
                return child(item);
              },
              itemCount: state.items.length,
            );
          }

          return const SizedBox();
        });
  }
}

/// abstract class PaginationViewItem<Entity> extends StatelessWidget
abstract class PaginationViewItem<Entity> extends StatelessWidget {
  final Entity data;
  const PaginationViewItem({
    super.key,
    required this.data,
  });
}

/// class PaginationListView<UseCase extends MainPaginateApiUseCase, Entity,
/// ItemView extends PaginationViewItem> extends StatelessWidget
class PaginationListViewInTabBar<UseCase extends MainPaginateListUseCase,
    Entity, ItemView extends PaginationViewItem> extends StatelessWidget {
  final ItemView Function(Entity entity) child;
  final EdgeInsetsGeometry? listPadding;
  final Widget? customSeparatorBuilder;

  final Widget Function(Widget list) paginatedLst;
  const PaginationListViewInTabBar({
    super.key,
    required this.child,
    required this.paginatedLst,
    this.listPadding,
    this.customSeparatorBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaginationController<UseCase, Entity>,
            PaginationBlocState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          if (state is PaginationLoading) {
            return Container(
              height: 500,
              width: 500,
              alignment: Alignment.center,
              child: const LoadingWidget(),
              // child: const CircularProgressIndicator.adaptive()
              // TODO::  const LoadingDialog(),
            );
          }
          if (state is PaginationError) {
            print('state $state');

            // import 'dart:developer';
            // return state.error==501.toString()?Text('no connection'):const Center(child: Icon(Icons.abc));
            return const Center(child: Icon(Icons.error));
          }
          if (state is PaginationLoaded && state.items.isNotEmpty) {
            return paginatedLst(
              ListView.separated(
                padding: listPadding,
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                separatorBuilder: (context, index) =>
                    customSeparatorBuilder ?? const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  Entity item = state.items[index];
                  return child(item);
                },
                itemCount: state.items.length,
              ),
            );
          }

          if (state is PaginationLoaded && state.items.isEmpty ||
              state is PaginationNoDataFoundState) {
            // TODO::     return customNoDataWidget();
            // return const Center(child: Text("NoDataFound"));
            return noDataWidget(text: 'No Data Found');
          }
          if (state is PaginationBlocInitial) {
            return const Center(child: Text("PaginationBlocInitial"));
          }
          if (state is PaginationNoMoreData && state.items.isNotEmpty) {
            paginatedLst(
              ListView.separated(
                padding: listPadding,
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                separatorBuilder: (context, index) =>
                    customSeparatorBuilder ?? const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  Entity item = state.items[index];
                  return child(item);
                },
                itemCount: state.items.length,
              ),
            );
          }

          return const SizedBox();
        });
  }
}

/// this widget was cereted for tapBar
/// which has problem in case using one SmartRefresher for many taps

class SmartRefresherApp<A extends PaginationController>
    extends StatelessWidget {
  final A controller;
  final Widget list;
  const SmartRefresherApp({
    super.key,
    required this.controller,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      key: key,
      controller: controller.refreshController!,
      enablePullDown: true,
      enablePullUp: true,
      onLoading: controller.loadMore,
      onRefresh: controller.onRefreshData,
      child: list,
    );
  }
}

/// class PaginationListView<UseCase extends MainPaginateApiUseCase, Entity,
/// PaginationListItem extends PaginationViewItem> extends StatelessWidget
class PaginationChatListView<UseCase extends MainPaginateListUseCase, Entity,
    ItemView extends PaginationViewItem> extends StatelessWidget {
  final ItemView Function(Entity entity) child;
  const PaginationChatListView({
    super.key,
    required this.child,
    this.listPadding,
  });

  final EdgeInsetsGeometry? listPadding;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaginationController<UseCase, Entity>,
            PaginationBlocState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          if (state is PaginationLoading) {
            return Container(
                height: 500,
                width: 500,
                alignment: Alignment.center,
                child: const CircularProgressIndicator.adaptive()
                // TODO::  const LoadingDialog()
                );
          }
          if (state is PaginationError) {
            return const Center(child: Icon(Icons.refresh));
            // todo return customNoDataWidget();
            // return text
          }
          if (state is PaginationLoaded && state.items.isNotEmpty) {
            var items = state.items.reversed.toList();
            return Builder(builder: (context) {
              PaginationController cubit =
                  PaginationController.get<UseCase, Entity>(context);
              WidgetsBinding.instance.addPostFrameCallback(
                (timeStamp) async {
                  // await Future.delayed(const Duration(milliseconds: 800));
                  cubit.moveScrollToMaxScrollExtent();
                },
              );
              return ListView.separated(
                controller: cubit.scrollController,
                shrinkWrap: true,
                // reverse: true,
                padding: kMaterialListPadding,
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  Entity item = items[index];
                  return child(item);
                },
                itemCount: items.length,
              );
            });
          }

          if (state is PaginationLoaded && state.items.isEmpty ||
              state is PaginationNoDataFoundState) {
            // return customNoDataWidget();
            // TODO::
            return noDataWidget(text: 'No Data Found');
          }
          if (state is PaginationBlocInitial) {
            return const Center(child: Text("PaginationBlocInitial"));
          }
          if (state is PaginationNoMoreData && state.items.isNotEmpty) {
            return Builder(builder: (context) {
              PaginationController cubit =
                  PaginationController.get<UseCase, Entity>(context);
              WidgetsBinding.instance.addPostFrameCallback(
                (timeStamp) async {
                  // await Future.delayed(const Duration(milliseconds: 800));
                  cubit.moveScrollToMaxScrollExtent();
                },
              );
              return ListView.separated(
                controller: cubit.scrollController,
                padding: listPadding,
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  Entity item = state.items[index];
                  return child(item);
                },
                itemCount: state.items.length,
              );
            });
          }

          return const SizedBox();
        });
  }
}

/// class PaginationListView<UseCase extends MainPaginateApiUseCase, Entity,
/// ItemView extends PaginationViewItem> extends StatelessWidget
class PaginationGridViewInTabBar<UseCase extends MainPaginateListUseCase,
    Entity, ItemView extends PaginationViewItem> extends StatelessWidget {
  final ItemView Function(Entity entity) child;
  final EdgeInsetsGeometry? listPadding;
  final Widget? customSeparatorBuilder;

  final Widget Function(Widget list) paginatedLst;
  const PaginationGridViewInTabBar({
    super.key,
    required this.child,
    required this.paginatedLst,
    this.listPadding,
    this.customSeparatorBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaginationController<UseCase, Entity>,
            PaginationBlocState>(
        // bloc: sl<PaginationController<UseCase, Entity>>(),
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          if (state is PaginationLoading) {
            return Container(
              height: 500,
              width: 500,
              alignment: Alignment.center,
              child: const LoadingWidget(),
              // child: const CircularProgressIndicator.adaptive()
              // TODO::  const LoadingDialog(),
            );
          }
          if (state is PaginationError) {
            print('state $state');
            // return state.error==501.toString()?Text('no connection'):const Center(child: Icon(Icons.abc));
            return const Center(child: Icon(Icons.error));
          }
          if (state is PaginationLoaded && state.items.isNotEmpty) {
            return paginatedLst(GridView.count(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              crossAxisSpacing: 20,
              mainAxisSpacing: 15,
              crossAxisCount: 2,
              children: <Widget>[
                ...state.items.map((e) {
                  Entity item = e;
                  return child(item);
                }).toList()
              ],
            ));
          }

          if (state is PaginationLoaded && state.items.isEmpty ||
              state is PaginationNoDataFoundState) {
            return noDataWidget(text:  'No Data Found');
          }
          if (state is PaginationBlocInitial) {
            return const Center(child: Text("PaginationBlocInitial"));
          }
          if (state is PaginationNoMoreData && state.items.isNotEmpty) {
            paginatedLst(
              ListView.separated(
                padding: listPadding,
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                separatorBuilder: (context, index) =>
                    customSeparatorBuilder ?? const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  Entity item = state.items[index];
                  return child(item);
                },
                itemCount: state.items.length,
              ),
            );
          }

          return const SizedBox();
        });
  }
}
