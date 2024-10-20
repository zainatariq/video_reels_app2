
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:video_reels_app/widgeta/contex.dart';
import 'bases/developer_settings/cubit/developer_cubit.dart';
import 'bases/pagination/controller/pagination_controller.dart';
import 'common/Theme/theme_bloc/theme_bloc.dart';
import 'core/api/api_consumer.dart';
import 'core/api/app_interceptors.dart';
import 'core/api/dio_consumer.dart';
import 'featurs/video_screen/data/data_source/remote_data_source.dart';
import 'featurs/video_screen/data/local_data_source/locale_data_source.dart';
import 'featurs/video_screen/data/model/video.dart';
import 'featurs/video_screen/domian/use_case/video_use_Case.dart';
import 'helper/connectivity.dart';
import 'localization/cubit/localization_cubit.dart';
import 'networking/DioClient.dart';
import 'networking/api_service.dart';
import 'networking/network_service.dart';

final sl = GetIt.instance;

final getIt = sl();

Future<void> init() async {
  sl.registerLazySingleton(() => Dio());

  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));
  sl.registerLazySingleton<AppIntercepters>(() => AppIntercepters());

  sl.registerFactory<Connectivity>(() => Connectivity());
  sl.registerLazySingleton<ConnectivityCubit>(
      () => ConnectivityCubit(sl<Connectivity>()));

  sl.registerLazySingleton<DeveloperCubit>(() => DeveloperCubit());
  sl.registerSingleton<DioClient>(DioClient());
  sl.registerSingleton<NetworkService>(NetworkService(sl<DioClient>()));
  sl.registerSingleton<ApiService>(ApiService(sl<NetworkService>()));
  sl.registerLazySingleton<ConText>(() => ConText());
  sl.registerLazySingleton<ThemeBloc>(() => ThemeBloc());
  sl.registerLazySingleton<LocalizationCubit>(() => LocalizationCubit());
  sl.registerLazySingleton<DefaultCacheManager>(() => DefaultCacheManager());



  sl.registerLazySingleton<
      PaginationController<GetVideosReelsUseCase, VideoItem>>(
        () => PaginationController(
          GetVideosReelsUseCase( )
          // GetVideosReelsUseCase(videoCacheDataSource: sl())
    ),
  );
  sl.registerLazySingleton<GetVideosRemoteDataSource>(
          () => GetVideosRemoteDataSourceImpl(consumer: sl()));
  // sl.registerLazySingleton<DefaultCacheManager>(() => DefaultCacheManager());
  // sl.registerLazySingleton<VideoCacheDataSource>(
  //       () => VideoCacheDataSourceImpl(sl<DefaultCacheManager>()),
  // );
  sl.registerLazySingleton<VideoCacheDataSource>(
        () => VideoCacheDataSourceImpl(sl<DefaultCacheManager>()),
  );

  sl.registerLazySingleton(() => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true));
}
