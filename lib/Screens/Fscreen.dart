import 'package:flutter/material.dart';

class FirstWidget extends StatefulWidget {
  const FirstWidget({Key? key}) : super(key: key);

  @override
  _FirstWidgetState createState() => _FirstWidgetState();
}

class _FirstWidgetState extends State<FirstWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ShareWidget(text: "ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssdfs",),
        ShareWidget(text: "ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssdfs",),
        ShareWidget(text: "ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssdfs",),
        ShareWidget(text: "ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssdfs",),
      ],
    );
  }
}

class ShareWidget extends StatelessWidget {
  final String text;

  const ShareWidget({Key? key, this.text = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width*4/5,
        height: MediaQuery.of(context).size.height/3,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(),
                Column(
                  children: [
                    Text("Name-Surname"),
                    Text("Date"),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15.0,),
            Text(text),
            SizedBox(height: 15.0,),
            Row(
              children: [
                Row(
                  children: [
                    Text("15 likes"),
                    Text("20 comments"),
                  ],
                ),
                Row(
                  children: [
                    TextButton(onPressed: () {}, child: Text("Like")),
                    TextButton(onPressed: () {}, child: Text("Comment")),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15.0,)
          ],
        ),
      ),
    );
  }
}
