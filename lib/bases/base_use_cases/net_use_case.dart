// AppUseCase


import 'app_use_case.dart';

abstract class NetUseCase<T, R> implements AppUseCase<T, R> {
  const NetUseCase();

  bool get isConnectedToInternet;
  @override
  Future<T> invoke(R param);
}
