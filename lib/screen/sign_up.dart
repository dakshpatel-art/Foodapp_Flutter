import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zoody/screen/Widget/text_field.dart';

class SignUp extends StatefulWidget {
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool loading = false;
  late UserCredential userCredential;
  RegExp regExp = RegExp(SignUp.pattern.toString());
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  void validation() {
    if (firstname.text.trim().isEmpty) {
      globalKey.currentState
          // ignore: deprecated_member_use
          ?.showSnackBar(SnackBar(content: Text("Firstname")));
      return;
    }
    if (lastname.text.trim().isEmpty) {
      // ignore: deprecated_member_use
      globalKey.currentState?.showSnackBar(SnackBar(content: Text("Lastname")));
      return;
    }
    if (email.text.trim().isEmpty) {
      // ignore: deprecated_member_use
      globalKey.currentState?.showSnackBar(SnackBar(content: Text("Email")));
      return;
    }
    if (password.text.trim().isEmpty) {
      // ignore: deprecated_member_use
      globalKey.currentState?.showSnackBar(SnackBar(content: Text("Password")));
      return;
    } else {
      setState(() {
        loading = true;
      });
      sendData();
    }
  }

  Future sendData() async {
    try {
      userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.text, password: password.text);
      await FirebaseFirestore.instance
          .collection("userData")
          .doc(userCredential.user?.uid)
          .set({
        'firstName': firstname.text.trim(),
        'lastName': lastname.text.trim(),
        'email': email.text.trim(),
        'userId': userCredential.user!.uid,
        'password': password.text.trim(),
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
      setState(() {
        loading = false;
      });
    }
    setState(() {
      loading = false;
    });
  }

  Widget button(
      {required String buttonname,
      required Color color,
      required Color textColor,
      required Function ontap}) {
    return Container(
      width: 120,
      // ignore: deprecated_member_use
      child: RaisedButton(
        color: color,
        onPressed: ontap(),
        child: Text(
          buttonname,
          style: TextStyle(fontSize: 20, color: textColor),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Sign UP",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            Container(
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyTextField(
                    controller: firstname,
                    obscureText: false,
                    hinttext: "firstName",
                  ),
                  MyTextField(
                    controller: lastname,
                    obscureText: false,
                    hinttext: "lastName",
                  ),
                  MyTextField(
                    controller: email,
                    obscureText: false,
                    hinttext: "Email",
                  ),
                  MyTextField(
                    controller: password,
                    obscureText: true,
                    hinttext: "Password",
                  ),
                ],
              ),
            ),
            loading
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      button(
                          ontap: () {},
                          buttonname: "Cancel",
                          color: Colors.grey,
                          textColor: Colors.red),
                      SizedBox(
                        width: 10,
                      ),
                      button(
                          ontap: () {
                            validation();
                          },
                          buttonname: "Sign Up",
                          color: Colors.green,
                          textColor: Colors.green),
                    ],
                  ),
          ],
        ),
      )),
    );
  }
}
