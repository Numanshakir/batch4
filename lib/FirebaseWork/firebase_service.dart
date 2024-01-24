import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseService {
  registerUserToFirebase() async {
    String email = "test8@yopmail.com";
    String password = "Test@007";

    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    if (userCredential.user != null) {
      print(userCredential.user!.emailVerified);
      print(userCredential.user!.email);
      print(userCredential.user!.uid);
      saveUserInfoToDB(
          uid: userCredential.user!.uid, name: "", email: email, picture: "");
      // FirebaseAuth.instance.sendSignInLinkToEmail(
      //     email: email,
      //     actionCodeSettings: ActionCodeSettings(
      //         url: "http://localhost:3000",
      //         // This must be true.
      //         handleCodeInApp: true));
      // FirebaseAuth.instance.signInWithCredential(userCredential);
    }
  }

  signInUserToFirebase() async {
    String email = "test@yopmail.com";
    String password = "Test@007";
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        print(userCredential.user!.emailVerified);
        print(userCredential.user!.email);
        print(userCredential.user!.uid);

        // FirebaseAuth.instance.signInWithCredential(userCredential);
      }
    } catch (e) {
      print("error ");
      print(e);
    }
  }

  signInWithVGoogleServcie() async {
    GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication? googleAuth =
          await googleSignInAccount.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      if (userCredential.user != null) {
        saveUserInfoToDB(
            uid: userCredential.user!.uid,
            name: userCredential.user!.providerData.first.displayName!,
            email: userCredential.user!.email!,
            picture: userCredential.user!.photoURL!);
      }
    }
  }

  saveUserInfoToDB(
      {required String uid,
      required String name,
      required String email,
      required String picture}) async {
    Map<String, dynamic> data = {
      "name": name,
      "email": email,
      "picture": picture,
      "uid": uid,
    };
    await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .set(data, SetOptions(merge: true));
    print("Added");
  }

  getAllusers() async {
    print("getAllusers");
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance.collection("users").get();

    print(querySnapshot.docs);

    for (int index = 0; index < querySnapshot.docs.length; index++) {
      print(querySnapshot.docs[index].exists);
      print(querySnapshot.docs[index].id);
      print(querySnapshot.docs[index].data());
    }
  }

  getMyInfo() async {
    print("getMyInfo");

    User? user = await FirebaseAuth.instance.currentUser;

    if (user != null) {
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await FirebaseFirestore.instance
              .collection("users")
              .doc(user.uid)
              .get();

      if (documentSnapshot.exists) {
        print(documentSnapshot.data());
      }
    } else {
      print("User Not Found");
    }
  }

  deleteMyInfo() async {
    print("deleteMyInfo");

    User? user = await FirebaseAuth.instance.currentUser;

    if (user != null) {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .delete();
    }
  }

  updateMyInfo() async {
    User? user = await FirebaseAuth.instance.currentUser;

    if (user != null) {
      Map<String, dynamic> data = {
        // if (name.isNotEmpty)
        "name": "Test user",
        "picture": "test",
      };
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .update(data);
    }
  }
}
