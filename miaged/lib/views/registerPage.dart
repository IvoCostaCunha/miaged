import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:miaged/views/loginPage.dart';
import 'firebase_options.dart';

class RegisterPage extends StatefulWidget {
  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  String topText = "Miagged";
  String mail = "";
  String password = "";
  bool loading = false;
  final _registerKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final inputMail = Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        onChanged: (value) {
          mail = value;
          setState(() {});
        },
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: 'Mail',
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(50.0))),
      ),
    );

    final inputPass = Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        onChanged: (value) {
          password = value;
          setState(() {});
        },
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Password',
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(50.0))),
      ),
    );

    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    final buttonRegister = Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: ButtonTheme(
        height: 50,
        child: ElevatedButton(
          child: const Text('Register'),
          style: style,
          onPressed: () async {
            try {
              UserCredential userCredential = await FirebaseAuth.instance
                  .createUserWithEmailAndPassword(
                      email: mail, password: password);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            } on FirebaseAuthException catch (e) {
              if (e.code == 'weak-password') {
                Fluttertoast.showToast(
                    msg:
                        'The password is too weak, timeInSecForIosWeb: 2, textColor: Colors.blue');
              } else if (e.code == 'Email already in use') {
                Fluttertoast.showToast(
                    msg: 'The account already exists for that email',
                    timeInSecForIosWeb: 2,
                    textColor: Colors.blue);
              } else if (e.code == 'invalid-email') {
                Fluttertoast.showToast(
                    msg: "The email address isn't valid",
                    timeInSecForIosWeb: 2,
                    textColor: Colors.blue);
              }
            } catch (e) {
              Fluttertoast.showToast(
                  msg: 'Failed to create account',
                  timeInSecForIosWeb: 5,
                  textColor: Colors.red);
              Fluttertoast.showToast(
                  msg: e.toString(),
                  timeInSecForIosWeb: 5,
                  textColor: Colors.orange);
            }
          },
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
          title: const Text('Join us !'),
          backgroundColor: Color.fromRGBO(51, 101, 138, 1)),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: <Widget>[inputMail, inputPass, buttonRegister],
        ),
      ),
    );
  }
}
