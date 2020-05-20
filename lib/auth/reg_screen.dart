import 'package:care_4u/patient_list.dart';
import 'package:flutter/material.dart';
import 'package:care_4u/components/RoundedButton.dart';
import 'package:care_4u/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:care_4u/first.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'reg_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  bool spinningProgress = false;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: spinningProgress,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    height: 120.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration:
                      kdecoration.copyWith(hintText: 'Enter your email'),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                    obscureText: true,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      password = value;
                    },
                    decoration:
                        kdecoration.copyWith(hintText: 'Enter your password')),
                RoundButton(
                  field: "Register",
                  func: () async {
                    setState(() {
                      spinningProgress = true;
                    });

                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email.trim(), password: password);
                      if (newUser != null) {
                        Navigator.pushNamed(context, Patients.id);
                      }

                      setState(() {
                        spinningProgress = false;
                      });
                    } catch (e) {
                      print(e);
                    }
                  },
                  color: Colors.pink,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
