
import 'package:easy/data/UserData.dart';
import 'package:easy/data/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 5,
            ),
            Text("Your Profile")
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Center(
                child: CircleAvatar(
                  radius: 80.0,
                  backgroundColor: Colors.grey,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TexWid(
                title: "Name: ",
                data: "",
              ),
              TexWid(
                title: "Surname: ",
                data: "",
              ),
              TexWid(
                title: "Username: ",
                data:"",
              ),
              TexWid(
                title: "E-mail:",
                data: FirebaseAuth.instance.currentUser!.email,
              ),
              TexWid(
                title: "Achievements: ",
                data: "",
              ),
              TexWid(
                title: "GreenPoints: ",
                data: "0 GP",
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Center(
            child: TextButton(
              onPressed: () {},
              child: Text("Be an Active Member"),
            ),
          ),
        ],
      ),
    );
  }
}


class TexWid extends StatelessWidget {
  final String title;
  final String? data;

  const TexWid({Key? key, required this.title, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            SizedBox(
              width: 25.0,
            ),
            Text(
              title + data!,
              style: TextStyle(fontSize: 24.0),
            ),
          ],
        )
      ],
    );
  }
}
