import 'package:flutter/material.dart';
import 'package:login_bloc_arch/src/bloc/auth_bloc.dart';

class AuthBlocProvider extends InheritedWidget{
  final bloc = AuthBloc();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }


  AuthBlocProvider({Key? key, required Widget child}) : super(key: key, child: child);

  //real implementation detail

  static AuthBloc of(BuildContext context){//context uniquely identifies widget
    final result =  context.dependOnInheritedWidgetOfExactType<AuthBlocProvider>()!;
    return result.bloc;
  }

}