import 'package:flutter/material.dart';
import 'package:login_bloc_arch/src/bloc/auth_bloc.dart';

class LoginScreen extends StatelessWidget {
  final authBloc = AuthBloc();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildEmailField(),
          SizedBox(height: 16),
          buildPasswordField(),
          SizedBox(height: 16),
          buildGenderField(),
          SizedBox(height: 16),
          buildSubmitButton(),
        ],
      ),
    );
  }

  Widget buildEmailField() {
    return StreamBuilder<Object>(
      stream: authBloc.emailStream, // stream listen
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextField(
          keyboardType: TextInputType.emailAddress,
          onChanged: (String? val){
            authBloc.changeEmail(val!);
          },
          decoration: InputDecoration(
            labelText: "Your email",
            hintText: "you@gmail.com",
            errorText: snapshot.hasError ?  snapshot.error.toString() : null,
            border: OutlineInputBorder(),
          ),
        );
      }
    );
  }

  Widget buildPasswordField() {
    return StreamBuilder<Object>(
      stream: authBloc.passwordStream,
      builder: (context, snapshot) {
        return TextField(
          obscureText: true,
          onChanged: (String? val){
            authBloc.changePassword(val!);
          },
          decoration: InputDecoration(
            labelText: "Your password",
            hintText: "********",
            errorText: snapshot.hasError ?  snapshot.error.toString() : null,
            border: OutlineInputBorder(),
          ),
        );
      }
    );
  }

  Widget buildSubmitButton() {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(18),
          primary: Colors.green,
        ),
          onPressed: (){},
          child: Text("Submit"),
      ),
    );
  }

  Widget buildGenderField() {
    return StreamBuilder<Object>(
      stream: authBloc.genderStream,
      builder: (context, AsyncSnapshot snapshot) {
        return DropdownButtonFormField<String>(
            items: [
              DropdownMenuItem(child: Text("Male"), value: "Male"),
              DropdownMenuItem(child: Text("Female"), value: "Female"),
              DropdownMenuItem(child: Text("Others"), value: "Others"),
              DropdownMenuItem(child: Text("Rather Not Say"), value: "Rather Not Say"),
            ],
            onChanged: (String? val){
              authBloc.changeGender(val!);
            },

          value: snapshot.data,
          decoration: InputDecoration(
            hintText: "Select your gender",
            border: OutlineInputBorder(),
            errorText: snapshot.hasError ?  snapshot.error.toString() : null,
          ),
        );
      }
    );
  }
}
