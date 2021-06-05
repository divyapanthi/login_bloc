import 'package:flutter/material.dart';
import 'package:login_bloc_arch/src/bloc/auth_bloc_provider.dart';
import 'package:login_bloc_arch/src/screens/login_screen.dart';

void main(){
  runApp(App());
}

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login Bloc",
      theme: ThemeData.dark(),
      home: Scaffold(
        body: AuthBlocProvider(
            child: LoginScreen()
        ),
      ),
    );
  }
}
