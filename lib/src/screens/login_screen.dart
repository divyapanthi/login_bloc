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
    return TextField(
      keyboardType: TextInputType.emailAddress,
      onChanged: (String? val){
        authBloc.changeEmail(val!);
      },
      decoration: InputDecoration(
        labelText: "Your email",
        hintText: "you@gmail.com",
        errorText: authBloc.emailStream.toString(),
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget buildPasswordField() {
    return TextField(
      obscureText: true,
      onChanged: (String? val){
        authBloc.changePassword(val!);
      },
      decoration: InputDecoration(
        labelText: "Your password",
        hintText: "********",
        errorText: authBloc.passwordStream.toString(),
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget buildSubmitButton() {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(16),
          primary: Colors.green,
        ),
          onPressed: (){},
          child: Text("Submit"),
      ),
    );
  }

  Widget buildGenderField() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(4),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: DropdownButton(
        items: [
          DropdownMenuItem(child: Text("Male"), value: "Male"),
          DropdownMenuItem(child: Text("Female"), value: "Female"),
          DropdownMenuItem(child: Text("Others"), value: "Others"),
          DropdownMenuItem(child: Text("Rather Not Say"), value: "Rather Not Say"),
        ],
        onChanged: (val){},
        style: TextStyle(color: Colors.white),
        value: "Male",
        underline: Container(),
        isExpanded: true,
        hint: Text("Select your gender"),
      ),
    );
  }

  // Widget buildGenderField() {}
}
