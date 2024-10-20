import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';





abstract class BaseState {
  const BaseState();
}

class BaseInitialState extends BaseState {
  const BaseInitialState();
}

class BaseLoadingSate extends BaseState {
  final bool x;
  const BaseLoadingSate( this. x) : super();


  bool get isLoading => x;
  @override
  List<Object> get props => [x];
}

class BaseCompletedState extends BaseState {
  dynamic data;
  BaseCompletedState({this.data});
}

class BaseErrorState extends BaseState {
  final String? errorMessage;
  BaseErrorState({this.errorMessage});
}
