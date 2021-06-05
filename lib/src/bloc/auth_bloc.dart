import 'dart:async';

import 'package:login_bloc_arch/src/validators/auth_validator.dart';
import 'package:rxdart/rxdart.dart';


class AuthBloc with AuthValidator {
  final _emailController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();
  final _genderController = StreamController<String>.broadcast();

  //getters for Functions
  Function(String) get changeEmail =>  _emailController.sink.add;
  Function(String) get changePassword =>  _passwordController.sink.add;
  Function(String) get changeGender =>  _genderController.sink.add;

  //Stream Getters
  Stream<String> get emailStream => _emailController.stream.transform(emailValidator);
  Stream<String> get passwordStream => _passwordController.stream.transform(passwordValidator);
  Stream<String> get genderStream => _genderController.stream.transform(genderValidator);


  //todo combine 3 streams
  Stream<bool> get buttonStream => Rx.combineLatest3(emailStream, passwordStream, genderStream,
  (a, b, c) => true); // this function is called only if valid values in all streams.



  void dispose() {
    _emailController.close();
    _passwordController.close();
    _genderController.close();
  }
}

