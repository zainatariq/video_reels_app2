
import '../../../featurs/video_screen/data/data_source/remote_data_source.dart';
import '../../../featurs/video_screen/data/model/video.dart';
 import '../../../featurs/video_screen/domian/use_case/video_use_Case.dart';
import '../../../featurs/video_screen/presentation/widgets/video_item.dart';
import '../controller/pagination_controller.dart';
import '../use-case/main_paginate_list_use_case.dart';
import '../widgets/paginations_widgets.dart';

typedef PC<T extends MainPaginateListUseCase, E> = PaginationController<T, E>;



typedef PaginateGetVideosReelsController<T extends MainPaginateListUseCase, E>
= PC<GetVideosReelsUseCase, VideoItem>;


typedef PaginateGetVideosReelsView = PaginationListViewInTabBar<
    GetVideosReelsUseCase, VideoItem,  VideoItemWidget>;






