import 'package:batch4/FirebaseWork/firebase_service.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FirebaseService firebaseService = FirebaseService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              color: Colors.amber,
              onPressed: () {
                firebaseService.registerUserToFirebase();
              },
              child: Text("Sign Up"),
            ),
            MaterialButton(
              color: Colors.amber,
              onPressed: () {
                firebaseService.signInUserToFirebase();
              },
              child: Text("Sign In"),
            ),
            MaterialButton(
              color: Colors.amber,
              onPressed: () {
                firebaseService.signInWithVGoogleServcie();
              },
              child: Text("Sign in with google"),
            ),
          ],
        ),
      ),
    );
  }
}
