import 'dart:async';

class AuthValidator{
  final emailValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink){
      if(email.contains("@") && email.contains(".")){
        sink.add(email);
      }else{
        sink.addError("Invalid email address");
      }
    }
  );

  final passwordValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink){
      if(password.length>= 8){
        sink.add(password);
      }
      else{
        sink.addError("Password must contain eight characters");
      }
    }
  );


  final genderValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (gender, sink){
      if(gender== "Rather Not Say"){
        sink.addError("Please be descriptive of your gender");
      }else{
        sink.add(gender);
      }
    }
  );


}