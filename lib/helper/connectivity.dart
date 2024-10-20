import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

enum ConnectivityState { connected, disconnected, poorConnection }

class ConnectivityCubit extends Cubit<ConnectivityState> {
  final Connectivity _connectivity;
  late StreamSubscription _connectivitySubscription;

  ConnectivityCubit(this._connectivity) : super(ConnectivityState.connected) {
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((connectivityResult) {
      _handleConnectivityChange(connectivityResult);
    });
    _checkInitialConnectivity();
  }

  Future<void> _checkInitialConnectivity() async {
    var connectivityResult = await _connectivity.checkConnectivity();
    _handleConnectivityChange(connectivityResult);
  }

  void _handleConnectivityChange(ConnectivityResult result) async {
    if (result == ConnectivityResult.none) {
      emit(ConnectivityState.disconnected);
    } else {
      bool isConnectionPoor = await _isConnectionPoor();
      if (isConnectionPoor) {
        emit(ConnectivityState.poorConnection);
      } else {
        emit(ConnectivityState.connected);
      }
    }
  }

  Future<bool> _isConnectionPoor() async {
    try {
      final response = await http.get(Uri.parse('https://google.com')).timeout(const Duration(seconds: 3));
      return response.statusCode != 200;
    } catch (e) {
      return true;
    }
  }

  void retry() {
    emit(ConnectivityState.connected);
    _checkInitialConnectivity();
  }

  @override
  Future<void> close() {
    _connectivitySubscription.cancel();
    return super.close();
  }
}
