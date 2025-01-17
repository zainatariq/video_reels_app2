
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'base_state/base_cubit_state.dart';



///new
abstract class BaseCubit extends Cubit<BaseState> {
  BaseCubit() : super(const BaseInitialState()) {
    load();
  }

  bool _isLoading = false;
  bool _isDisposed = false;

  FutureOr<void> _initState;

  FutureOr<void> init( );

  void load( ) async {
    isLoading = true;
    _initState = init( );
     await _initState;
    isLoading = false;
  }

  bool get isLoading => _isLoading;
  bool get isDisposed => _isDisposed;

  dynamic get data;

  set isLoading(bool value) {
    _isLoading = value;
    if (!_isDisposed && _isLoading) emit(const BaseLoadingSate(true));
  }

  @override
  Future<void> close() async {
    _isDisposed = true;
    super.close();
  }
}
