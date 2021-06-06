import 'package:flutter/material.dart';
import 'package:login_bloc_arch/src/bloc/auth_bloc.dart';
import 'package:login_bloc_arch/src/bloc/auth_bloc_provider.dart';
import 'package:login_bloc_arch/src/screens/second_screen.dart';

class LoginScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = AuthBlocProvider.of(context);
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildEmailField(authBloc),
          SizedBox(height: 16),
          buildPasswordField(authBloc),
          SizedBox(height: 16),
          buildGenderField(authBloc),
          SizedBox(height: 16),
          buildSubmitButton(authBloc),
        ],
      ),
    );
  }

  Widget buildEmailField(AuthBloc authBloc) {
    return StreamBuilder(
      stream: authBloc.emailStream, // stream listen
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return TextField(
          keyboardType: TextInputType.emailAddress,
          onChanged: authBloc.changeEmail,
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

  Widget buildPasswordField(AuthBloc authBloc) {
    // final AuthBloc authBloc = AuthBlocProvider.of(context);
    return StreamBuilder(
      stream: authBloc.passwordStream,
      builder: (context, AsyncSnapshot<String> snapshot) {
        return TextField(
          obscureText: true,
          onChanged: authBloc.changePassword,
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

  Widget buildSubmitButton(AuthBloc authBloc) {
    return StreamBuilder(
      stream: authBloc.loadingStatusStream,
      initialData: false,
      builder: (context, AsyncSnapshot<bool> loadingSnapshot) {
        return StreamBuilder(
          stream: authBloc.buttonStream  ,
          builder: (context, AsyncSnapshot<bool> snapshot) {
            return Container(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(18),
                  primary: Colors.green,
                ),
                  onPressed: snapshot.hasData && (!loadingSnapshot.data!) ?  () {
                  _onSubmit(authBloc, context);
                  }  : null,
                  child: loadingSnapshot.data! ? showCircularProgressIndicator() : Text("Submit"),
              ),
            );
          }
        );
      }
    );
  }

  Future _onSubmit(AuthBloc authBloc, BuildContext context) async {
    authBloc.getData();
    authBloc.changeLoadingStatus(true);
    final response = await authBloc.submitData();
    authBloc.changeLoadingStatus(false);
    if(response == null){
      // todo show a snackbar message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Sign up failed")),
      );
    }
    else{
      // todo navigate to the other screen
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_){
          return SecondScreen();
        })
      );
    }
  }

  Widget buildGenderField(AuthBloc authBloc) {
    return StreamBuilder(
      stream: authBloc.genderStream,
      builder: (context, AsyncSnapshot<String> snapshot) {
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

  showCircularProgressIndicator() {
    return SizedBox(
      child: CircularProgressIndicator(
        strokeWidth: 2,
      ),
      width: 18,
      height: 18,
    );
  }
}
