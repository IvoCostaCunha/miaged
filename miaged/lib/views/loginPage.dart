import 'package:flutter/material.dart';
import 'registerPage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'mainPage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;



class LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';

  Future<bool> isAuthentified(String email, String password) async {
  try {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential != null;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found' || e.code == 'wrong-password') {
      return false;
    }
    throw e;
  }
}

  @override
  Widget build (BuildContext context) {
    final inputMail = Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'Mail',
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
        onChanged: (value) {
          setState(() {
            email = value;
          });
        },
      ),
    );

    final inputPass = Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Password',
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
        onChanged: (value) {
          setState(() {
            password = value;
          });
        },
      ),
    );

    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    final buttonLogin = Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: ButtonTheme(
        height: 50,
        child: ElevatedButton(
          child: const Text('Login'),
          style: style,
          onPressed: () async {
            if (await isAuthentified(email, password)) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MainPage()));
            } else {
              Fluttertoast.showToast(
                    msg: 'Wrong password/mail combo !',
                    timeInSecForIosWeb: 2,
                    textColor: Colors.orange);
            }
          },
        ),
      ),
    );

    final buttonRegister = Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: ButtonTheme(
        height: 50,
        child: ElevatedButton(
          child: const Text('Register'),
          style: style,
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RegisterPage()),
          ),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(51, 101, 138, 1),
        title: const Text('Welcome to our shop !'),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: <Widget>[
            inputMail,
            inputPass,
            buttonLogin,
            buttonRegister,
          ],
        ),
      ),
    );
  }
}
