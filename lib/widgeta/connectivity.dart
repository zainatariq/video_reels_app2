




import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../helper/connectivity.dart';
import 'connection_dialog.dart';

class ConnectivityListener extends StatelessWidget {
  final Widget body;
  final void Function()? onRetry;

  ConnectivityListener({super.key, required this.body,   this.onRetry});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConnectivityCubit, ConnectivityState>(
      listener: (context, state) {
        log(state.toString());
        if (state == ConnectivityState.disconnected) {
          showDialogBox(context ,
            onRetry: onRetry?? () => context.read<ConnectivityCubit>().retry(),
          );
        }
      },
      child:   BlocBuilder<ConnectivityCubit, ConnectivityState>(
        builder: (context, state) {
          if (state == ConnectivityState.disconnected) {
            return Center(
              child: ElevatedButton(
                onPressed:() => context.read<ConnectivityCubit>().retry(),
                child: const Text('Retry'),
              ),
            );
          }
          return body;
        },
      ),

    );   }
}
