import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zoody/screen/Widget/text_field.dart';

class LoginPage extends StatefulWidget {
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loading = false;
  RegExp regExp = RegExp(LoginPage.pattern.toString());
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  late UserCredential userCredential;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  // ignore: override_on_non_overriding_member
  Future loginAuth() async {
    try {
      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text, password: password.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // ignore: deprecated_member_use
        globalKey.currentState?.showSnackBar(
          SnackBar(
            content: Text("No user found for that email."),
          ),
        );
      } else if (e.code == 'wrong-password') {
        // ignore: deprecated_member_use
        globalKey.currentState?.showSnackBar(
          SnackBar(
            content: Text("No user found for that password."),
          ),
        );
        setState(() {
          loading = false;
        });
      }
      setState(() {
        loading = false;
      });
    }
  }

  void validation() {
    if (email.text.trim().isEmpty && password.text.trim().isEmpty) {
      globalKey.currentState
          // ignore: deprecated_member_use
          ?.showSnackBar(SnackBar(content: Text("All is empty")));
    }
    if (email.text.trim().isEmpty) {
      globalKey.currentState
          // ignore: deprecated_member_use
          ?.showSnackBar(SnackBar(content: Text("Email is empty")));
      return;
    }
    if (password.text.trim().isEmpty) {
      globalKey.currentState
          // ignore: deprecated_member_use
          ?.showSnackBar(SnackBar(content: Text("password is empty")));
      return;
    } else {
      setState(() {
        loading = true;
      });
      loginAuth();
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 170),
            child: Text(
              "Login In",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Column(
            children: [
              MyTextField(
                controller: email,
                hinttext: "Email",
                obscureText: false,
              ),
              SizedBox(
                height: 30,
              ),
              MyTextField(
                  controller: password,
                  hinttext: "Password",
                  obscureText: true),
            ],
          ),
          loading
              ? CircularProgressIndicator()
              : Container(
                  height: 60,
                  width: 200,
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    onPressed: () {
                      validation();
                    },
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "New User?",
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                "Register now.?",
                style: TextStyle(color: Colors.red),
              )
            ],
          )
        ],
      ),
    );
  }
}
