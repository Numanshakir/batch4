import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseService {
  registerUserToFirebase() async {
    String email = "test@yopmail.com";
    String password = "Test@007";

    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    if (userCredential.user != null) {
      print(userCredential.user!.emailVerified);
      print(userCredential.user!.email);
      print(userCredential.user!.uid);
      FirebaseAuth.instance.sendSignInLinkToEmail(
          email: email,
          actionCodeSettings: ActionCodeSettings(
              url: "http://localhost:3000",
              // This must be true.
              handleCodeInApp: true));
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
        print(userCredential.user!.emailVerified);
        print(userCredential.user!.email);
        print(userCredential.user!.uid);

        // FirebaseAuth.instance.signInWithCredential(userCredential);
      }
    }
  }
}
