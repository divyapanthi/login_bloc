import 'dart:async';

import 'package:login_bloc_arch/src/validators/auth_validator.dart';

class AuthBloc with AuthValidator {
  final _emailController = StreamController<String>();
  final _passwordController = StreamController<String>();
  final _genderController = StreamController<String>();

  //getters for Functions
  Function(String) get changeEmail =>  _emailController.sink.add;
  Function(String) get changePassword =>  _passwordController.sink.add;
  Function(String) get changeGender =>  _genderController.sink.add;

  //Stream Getters
  Stream<String> get emailStream => _emailController.stream.transform(emailValidator);
  Stream<String> get passwordStream => _passwordController.stream.transform(passwordValidator);
  Stream<String> get genderStream => _genderController.stream.transform(genderValidator);


  void dispose() {
    _emailController.close();
    _passwordController.close();
    _genderController.close();
  }
}