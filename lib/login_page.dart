import 'package:flutter/material.dart';
import 'package:tpm_uts/main_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";
  bool isLoginSuccess = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              const SizedBox(height: 50,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                alignment: Alignment.topCenter,
                child: const Text(
                  'Welcome!',
                  style: TextStyle(fontSize: 36),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                alignment: Alignment.topCenter,
                child: const Text(
                  'Untuk masuk silakan login menggunakan username dan password.',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              SizedBox(height: 30,),
              _usernameField(),
              _passwordField(),
              _LoginButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),

      child: TextFormField(
        onChanged: (value) {
          username = value;
        },
        decoration: InputDecoration(
          labelText: 'Username',
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.black,
              )
          ),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextFormField(
        onChanged: (value) {
          password = value;
        },
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Password',
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.black,
              )
          ),
        ),
      ),
    );
  }

  Widget _LoginButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      width: 120,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.black,
        ),
        onPressed: (){
          String text = "";

          if(username == "123200098" && password == "Rowang") {
            setState(() {
              isLoginSuccess = true;
              text = "Login success";
            });
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) {
                  return MainPage();
                })
            );
          }
          else {
            setState(() {
              isLoginSuccess = false;
              text = "Login failed";
            });
          }

          SnackBar snackbar = SnackBar(
            content: Text(text),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        },
        child: Text('Login'),
      ),
    );
  }

}
