import 'dart:convert';

import 'package:http/http.dart';
import 'package:login_bloc_arch/src/model/user_model.dart';

class AuthApi{
  Future<UserModel?> signUp(String email, String password, String gender) async{
    Map<String, dynamic> requestBody = {
      "email": email,
      "password": password,
      "gender": gender,
    };
    try {
      var uri = Uri.parse("https://api.fresco-meat.com/api/albums/signup");
      final response = await post(uri, body: jsonEncode(requestBody),
      headers: {"Content-Type": "application/json"},
      );
      final body = response.body;
      print("Signup Response $body");
      if(response.statusCode!=201) return null;
      final parsedMap = jsonDecode(body);
      final user = UserModel.fromJson(parsedMap);
      return user;


    }catch(e){

    }
  }
}