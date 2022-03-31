import 'package:easy/data/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({Key? key}) : super(key: key);

  @override
  _RegisterWidgetState createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final email = TextEditingController();
  final password = TextEditingController();
  final name = TextEditingController();
  final surname = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    email.dispose();
    password.dispose();
    name.dispose();
    surname.dispose();
    super.dispose();
  }

  Future signup() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim());
      await DatabaseService(uid: userCredential.user!.uid)
          .updateUserData(name.text.trim(), surname.text.trim());
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        const snack = SnackBar(
          content: Text('The password provided is too weak.'),
          duration: Duration(
            seconds: 1,
          ),
        );
        return ScaffoldMessenger.of(context).showSnackBar(snack);
      } else if (e.code == 'email-already-in-use') {
        const snack = SnackBar(
          content: Text('The account already exists for that email.'),
          duration: Duration(
            seconds: 1,
          ),
        );
        return ScaffoldMessenger.of(context).showSnackBar(snack);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 15.0,
          ),
          Text("E-mail:"),
          TextField(
            controller: email,
          ),
          SizedBox(
            height: 15.0,
          ),
          Text("Password:"),
          TextField(
            controller: password,
          ),
          SizedBox(
            height: 15.0,
          ),
          Text("Name"),
          TextField(
            controller: name,
          ),
          SizedBox(
            height: 15.0,
          ),
          Text("Surname"),
          TextField(
            controller: surname,
          ),
          SizedBox(
            height: 15.0,
          ),
          Center(
            child: ElevatedButton.icon(
              onPressed: signup,
              icon: Icon(Icons.app_registration),
              label: Text("Registar"),
            ),
          ),
        ],
      ),
    );
  }
}
