
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:video_reels_app/featurs/video_screen/presentation/widgets/video_item.dart';

import '../../../../bases/pagination/model/main_paginate_request_entity_model.dart';
import '../../../../bases/pagination/state/pagination_bloc_state.dart';
import '../../../../bases/pagination/typedef/page_typedef.dart';
import '../../../../bases/pagination/widgets/paginations_widgets.dart';
import '../../../../injection_contanier.dart';
import '../../data/local_data_source/locale_data_source.dart';
import '../../data/model/video.dart';
import '../../domian/use_case/video_use_Case.dart';


 class ReelsPageView extends StatelessWidget {
  const ReelsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocProvider(
        create: (context) => PaginateGetVideosReelsController(
          GetVideosReelsUseCase(
            req: GetVideosReqModel(page: 1, limit: 10, country: 'United States'),
          ),
        )..startInitData(),
        child: BlocBuilder<PaginateGetVideosReelsController, PaginationBlocState>(
          builder: (context, state) {
            if (state is PaginationLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PaginationError) {
              // Show error message and fallback to cached videos
              return FutureBuilder(
                future: sl<VideoCacheDataSource>().getCachedVideos(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text(
                        'Failed to load cached videos. Please check your network.',
                        style: TextStyle(color: Colors.red),
                      ),
                    );
                  } else if (snapshot.hasData && snapshot.data != null) {
                    // Display cached videos
                    final cachedVideos = snapshot.data as List<VideoItem>;
                    if (cachedVideos.isNotEmpty) {
                      return PageView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: cachedVideos.length,
                        itemBuilder: (context, index) {
                          final video = cachedVideos[index];
                          return VideoItemWidget(data: video);
                        },
                      );
                    } else {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Error occurred while fetching videos.',
                              style: TextStyle(color: Colors.red),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'No cached videos available.',
                              style: TextStyle(color: Colors.grey),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Retry fetching or reload cached videos
                                context.read<PaginateGetVideosReelsController>().onRefreshData();
                              },
                              child: const Text(
                                'Retry',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  } else {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Error occurred while fetching videos.',
                            style: TextStyle(color: Colors.red),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'No cached videos available.',
                            style: TextStyle(color: Colors.grey),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              context.read<PaginateGetVideosReelsController>().onRefreshData();
                            },
                            child: const Text('Retry', style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    );
                  }
                },
              );
            } else if (state is PaginationLoaded<VideoItem>) {
              final controller = BlocProvider.of<PaginateGetVideosReelsController>(context);
              return SmartRefresherApp<PaginateGetVideosReelsController>(
                controller: controller,
                list: PageView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: state.items.length,
                  onPageChanged: (index) {
                    if (index == state.items.length - 1) {
                      controller.loadMore();  // Load more videos when reaching the end of the list
                    }
                  },
                  itemBuilder: (context, index) {
                    final video = state.items[index];
                    return VideoItemWidget(data: video);
                  },
                ),
              );
            } else if (state is PaginationNoMoreData && state.items.isNotEmpty) {
              final controller = BlocProvider.of<PaginateGetVideosReelsController>(context);
              return SmartRefresherApp<PaginateGetVideosReelsController>(
                controller: controller,
                list: PageView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: state.items.length,
                  onPageChanged: (index) {
                    if (index == state.items.length - 1) {
                      controller.loadMore();  // Load more videos when reaching the end of the list
                    }
                  },
                  itemBuilder: (context, index) {
                    final video = state.items[index];
                    return VideoItemWidget(data: video);
                  },
                ),
              );
            } else {
              return const Center(child: Text('Unknown state'));
            }
          },
        ),
      ),
    );
  }
}

// class ReelsPageView extends StatelessWidget {
//   const ReelsPageView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: BlocProvider(
//         create: (context) => PaginateGetVideosReelsController(
//           GetVideosReelsUseCase(
//             req: GetVideosReqModel(page: 1, limit: 10, country: 'United States'),
//             videoCacheDataSource: VideoCacheDataSourceImpl(DefaultCacheManager()), // Pass the cache manager here
//           ),
//         )..startInitData(),
//         child: BlocBuilder<PaginateGetVideosReelsController, PaginationBlocState>(
//           builder: (context, state) {
//             if (state is PaginationLoading) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             } else if (state is PaginationError) {
//               return Center(
//                 child: Text(
//                   'Error: ${state.error}',
//                   style: const TextStyle(color: Colors.red),
//                 ),
//               );
//             } else if (state is PaginationLoaded<VideoItem>) {
//               final controller = BlocProvider.of<PaginateGetVideosReelsController>(context);
//               return SmartRefresherApp<PaginateGetVideosReelsController>(
//                 controller: controller,
//                 list: PageView.builder(
//                   scrollDirection: Axis.vertical,
//                   itemCount: state.items.length,
//                   onPageChanged: (index) {
//                     if (index == state.items.length - 1) {
//                       controller.loadMore();  // Load more videos when reaching the end of the list
//                     }
//                   },
//                   itemBuilder: (context, index) {
//                     final video = state.items[index];
//                     return VideoItemWidget(data: video);
//                   },
//                 ),
//               );
//             } else if (state is PaginationNoMoreData && state.items.isNotEmpty) {
//               final controller = BlocProvider.of<PaginateGetVideosReelsController>(context);
//               return SmartRefresherApp<PaginateGetVideosReelsController>(
//                 controller: controller,
//                 list: PageView.builder(
//                   scrollDirection: Axis.vertical,
//                   itemCount: state.items.length,
//                   onPageChanged: (index) {
//                     if (index == state.items.length - 1) {
//                       controller.loadMore();  // Load more videos when reaching the end of the list
//                     }
//                   },
//                   itemBuilder: (context, index) {
//                     final video = state.items[index];
//                     return VideoItemWidget(data: video);
//                   },
//                 ),
//               );
//             } else {
//               return const Center(child: Text('Unknown state'));
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

//
// class ListOfVideosWidget extends StatelessWidget {
//   const ListOfVideosWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       Expanded(
//           child:
//           BlocProvider(
//               create: (context) => PaginateGetVideosReelsController(
//                 GetVideosReelsUseCase(
//                   req:GetVideosReqModel(page: 1,limit:  10, country: 'United States'),
//                 ),
//               )..startInitData(),
//               child: BlocBuilder<PaginateGetVideosReelsController,
//                   PaginationBlocState>(builder: (context, state) {
//                 return PaginateGetVideosReelsView(
//                   listPadding:
//                   const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
//                   paginatedLst: (list) =>
//                       SmartRefresherApp<PaginateGetVideosReelsController>(
//                         controller:
//                         BlocProvider.of<PaginateGetVideosReelsController>(
//                             context),
//                         list: list,
//                       ),
//                   child: (entity) =>
//                       VideoItemWidget(data: entity),
//
//                 );
//
//               })
//           )
//       );
//   }
// }
//
