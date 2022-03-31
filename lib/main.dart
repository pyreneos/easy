import 'package:easy/Screens/ProfilePage.dart';
import 'package:easy/Screens/Register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'Screens/pack.dart';
import 'firebase_options.dart';
//main
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseDatabase.instanceFor(app: Firebase.apps.first,databaseURL: "https://easy-b1669-default-rtdb.europe-west1.firebasedatabase.app/");
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();
//myapp
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: "Easy Greasy",
      home: MainWidget(),
      debugShowCheckedModeBanner: false,
      routes: {
        "/p": (context) => ProfileWidget(),
        "/r": (context) => RegisterWidget(),
      },
    );
  }
}
//login part
class MainWidget extends StatelessWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshots) {
            if (snapshots.hasData) {
              return HomeWidget();
            } else {
              return LoginWidget();
            }
          },
        ),
      );
}

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController1.dispose();
    myController2.dispose();
    super.dispose();
  }
  @override
  void initState(){
    super.initState();
  }
  Future signin() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: myController1.text.trim(),
          password: myController2.text.trim());
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => Center(
                child: CircularProgressIndicator(),
              ));
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-email") {
        const snack = SnackBar(
          content: Text("Invalid E-mail. Please check again."),
          duration: Duration(
            seconds: 1,
          ),
        );
        return ScaffoldMessenger.of(context).showSnackBar(snack);
      }
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      children:[ Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30.0,
          ),
          Center(child: Image.asset("assets/oil recycle.png",width: 150.0,height: 150.0,),),
          SizedBox(
            height: 15.0,
          ),
          Text("E-mail:"),
          TextField(
            controller: myController1,
          ),
          SizedBox(
            height: 15.0,
          ),
          Text("Password:"),
          TextField(
            controller: myController2,
          ),
          Center(
            child: ElevatedButton.icon(
              onPressed: signin,
              icon: Icon(Icons.login),
              label: Text("Login"),
            ),
          ),
          Center(
            child: ElevatedButton.icon(
              onPressed:(){Navigator.pushNamed(context, "/r");},
              icon: Icon(Icons.app_registration),
              label: Text("Registar"),
            ),
          ),
        ],
      ),
      ],
    );
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int selectedIndex = 0; //navbar index variable

  void _onItemTapped(int index) => setState(() {
        selectedIndex = index;
      });

  final screens = <Widget>[
    //Sayfa değiştirmek için
    FirstWidget(),
    SecondWidget(),
    ThirdWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Easy Greasy"),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.white,
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/p");
              },
              child: Text("EX"),
            ),
          ),
          SizedBox(
            width: 20.0,
          )
        ],
      ),
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'info',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'settings',
          ),
        ],
      ),
    );
  }
}
