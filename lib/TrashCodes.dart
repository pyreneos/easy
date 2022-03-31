import 'package:flutter/material.dart';

/*
class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final screens = <Widget> [
    MainWidget(widget: global.BotNavBarWidget()),
  ];
  @override
  Widget build(BuildContext context) {
    return screens[global.selectedIndex];
  }
}
 */
/*

 */
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
            Text(text),
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
            SizedBox(height: 15.0,)
          ],
        ),
      ),
    );
  }
}
