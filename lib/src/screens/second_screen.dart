import 'package:flutter/material.dart';
import 'package:login_bloc_arch/src/bloc/auth_bloc.dart';
import 'package:login_bloc_arch/src/bloc/auth_bloc_provider.dart';

class SecondScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final bloc = AuthBlocProvider.of(context);
    return Scaffold(
      body: Center(
        child: Container(
          child: Text("Welcome ${bloc.currentEmail}."),
        ),
      ),
    );

  }
}
