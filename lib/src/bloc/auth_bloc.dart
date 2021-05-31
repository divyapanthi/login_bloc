import 'dart:async';

class AuthBloc {
  final _emailController = StreamController<String>();
  final _passwordController = StreamController<String>();
  final _genderController = StreamController<String>();

  //getters for Functions
  Function(String) get changeEmail =>  _emailController.sink.add;
  Function(String) get changePassword =>  _passwordController.sink.add;
  Function(String) get changeGender =>  _genderController.sink.add;

  //Stream Getters
  Stream get emailStream => _emailController.stream;
  Stream get passwordStream => _passwordController.stream;
  Stream get genderStream => _genderController.stream;


  void dispose() {
    _emailController.close();
    _passwordController.close();
    _genderController.close();
  }
}