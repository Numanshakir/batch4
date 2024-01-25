import 'dart:io';

import 'package:batch4/FirebaseWork/firebase_service.dart';
import 'package:batch4/FirebaseWork/firebase_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FirebaseService firebaseService = FirebaseService();

  String imagePath = "";

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
            if (imagePath.isNotEmpty)
              Image(height: 100, image: FileImage(File(imagePath))),
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
            MaterialButton(
              color: Colors.amber,
              onPressed: () {
                firebaseService.getAllusers();
              },
              child: Text("Get All users"),
            ),
            MaterialButton(
              color: Colors.amber,
              onPressed: () {
                firebaseService.getMyInfo();
              },
              child: Text("Get My info"),
            ),
            MaterialButton(
              color: Colors.amber,
              onPressed: () {
                firebaseService.deleteMyInfo();
              },
              child: Text("Delete My info"),
            ),
            MaterialButton(
              color: Colors.amber,
              onPressed: () {
                firebaseService.updateMyInfo();
              },
              child: Text("Update My info"),
            ),
            MaterialButton(
              color: Colors.amber,
              onPressed: () {
                firebaseService.socketIOConnection();
              },
              child: Text("Socket"),
            ),
            MaterialButton(
              color: Colors.amber,
              onPressed: () {
                uploadFile();
              },
              child: Text("Upload Image"),
            ),
          ],
        ),
      ),
    );
  }

  uploadFile() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      print(file.path);
      setState(() {
        imagePath = file.path;
      });

      FirebaseStorageService().uploadToStorage(imagePath);
    }
  }
}
