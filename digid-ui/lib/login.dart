import 'package:flutter/material.dart';
import 'dart:ui';

import './home.dart';
import './user.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final User user = new User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Image(
                  image: AssetImage('assets/Icon.png'),
                  width: MediaQuery.of(context).size.height * 0.30,
                ),
              ),
              Container(
                child: Image(
                  image: AssetImage('assets/Title.png'),
                  width: MediaQuery.of(context).size.height * 0.40,
                ),
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      child: TextField(
                        decoration: InputDecoration(hintText: 'Username'),
                      ),
                      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
                      width: MediaQuery.of(context).size.height * 0.40,
                    ),
                    Container(
                      child: TextField(
                        decoration: InputDecoration(hintText: 'Password'),
                      ),
                      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
                      width: MediaQuery.of(context).size.height * 0.40,
                    ),
                    Container(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Home(user: user)),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(0.0),
                          primary: Colors.transparent,
                          shadowColor: Colors.transparent,
                          textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.height * 0.20,
                          height: MediaQuery.of(context).size.height * 0.07,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color.fromARGB(255, 43, 154, 115), Color.fromARGB(255, 47, 97, 165)],
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          ),
                          child: Text("LOGIN"),
                        ),
                      ),
                      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
                    )
                  ],
                ),
                margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.05),
              )
            ],
          ),
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
