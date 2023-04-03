import 'package:flutter/material.dart';

// ignore: camel_case_types
class welcomePage extends StatelessWidget {
  Widget button(
      {required String name, required Color color, required Color textColors}) {
    return Container(
      height: 45,
      width: 300,
      // ignore: deprecated_member_use
      child: RaisedButton(
        color: color,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.green, width: 2),
            borderRadius: BorderRadius.circular(30)),
        onPressed: () {},
        child: Text(
          name,
          style: TextStyle(color: textColors),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.black,
              child: Center(
                child: Image.asset('images/1.jpg'),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Welcome To Zoody",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  Column(
                    children: [
                      Text("Order food from our restaurant and"),
                      Text("Make reservation in")
                    ],
                  ),
                  button(
                      name: "login",
                      color: Colors.green,
                      textColors: Colors.white),
                  button(
                      name: "SignUP",
                      color: Colors.white,
                      textColors: Colors.green),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
