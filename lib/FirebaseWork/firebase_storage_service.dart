import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  FirebaseStorage storage = FirebaseStorage.instance;

  uploadToStorage(String path) {
    print("uploadToStorage");

    String fileName = path.split("/").last;
    //Create a reference to the location you want to upload to in firebase
    Reference reference = storage.ref().child("/Images/${fileName}");

    UploadTask uploadTask = reference.putFile(File(path));

    uploadTask.snapshotEvents.listen((event) async {
      print("event");
      print(event.totalBytes);

      if (event.state == TaskState.success) {
        print(await reference.getDownloadURL());
      }
    });
  }
}
