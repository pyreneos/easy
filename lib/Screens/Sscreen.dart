import 'package:flutter/material.dart';

class SecondWidget extends StatefulWidget {
  const SecondWidget({Key? key}) : super(key: key);

  @override
  _SecondWidgetState createState() => _SecondWidgetState();
}

class _SecondWidgetState extends State<SecondWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            SizedBox(
              height: 25.0,
            ),
            Center(
              child: Text(
                "Achievements",
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Achievements(title: "1", colour: Color(0x807F7B7B)),
                Achievements(title: "2", colour: Color(0x807F7B7B)),
                Achievements(title: "3", colour: Color(0x807F7B7B)),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Achievements(title: "1", colour: Color(0x807F7B7B)),
                Achievements(title: "2", colour: Color(0x807F7B7B)),
                Achievements(title: "3", colour: Color(0x807F7B7B)),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Achievements(title: "1", colour: Color(0x807F7B7B)),
                Achievements(title: "2", colour: Color(0x807F7B7B)),
                Achievements(title: "3", colour: Color(0x807F7B7B)),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Achievements(title: "1", colour: Color(0x807F7B7B)),
                Achievements(title: "2", colour: Color(0x807F7B7B)),
                Achievements(title: "3", colour: Color(0x807F7B7B)),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Achievements(title: "1", colour: Color(0x807F7B7B)),
                Achievements(title: "2", colour: Color(0x807F7B7B)),
                Achievements(title: "3", colour: Color(0x807F7B7B)),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Achievements(title: "1", colour: Color(0x807F7B7B)),
                Achievements(title: "2", colour: Color(0x807F7B7B)),
                Achievements(title: "3", colour: Color(0x807F7B7B)),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        )
      ],
    );
  }
}

class Achievements extends StatelessWidget {
  final String title;
  final Color colour;

  const Achievements({Key? key, required this.title, required this.colour})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: colour,
        ),
        Text(title)
      ],
    );
  }
}
