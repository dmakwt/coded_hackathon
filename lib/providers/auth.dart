import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth {
  final auth = FirebaseAuth.instance;

  bool isLoggedIn() {
    return auth.currentUser != null;
  }

  String? userId() {
    return auth.currentUser?.uid;
  }

  String? email() {
    return auth.currentUser?.email;
  }

  void signup(BuildContext context, String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => ChatScreen(),
      //     ));
    } on FirebaseAuthException catch (e) {
      // 4
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //     content: Text('The password provided is too weak.'),
        //     backgroundColor: Colors.red,
        //   ),
        // );
      } else if (e.code == 'email-already-in-use') {
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //     content: Text('The account already exists for that email.'),
        //     backgroundColor: Colors.red,
        //   ),
        // );
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text('Error'),
      //     backgroundColor: Colors.red,
      //   ),
      // );
    }
  }

  void login(BuildContext context, String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => ChatScreen(),
      //   ),
      // );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //     content: Text('The password provided is too weak.'),
        //     backgroundColor: Colors.red,
        //   ),
        // );
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //     content: Text('The account already exists for that email.'),
        //     backgroundColor: Colors.red,
        //   ),
        // );
      }
    } catch (e) {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text('Error'),
      //     backgroundColor: Colors.red,
      //   ),
      // );
      print(e);
    }
  }

  void logout(BuildContext context) async {
    await auth.signOut();
    // Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => AuthScreen(),
    //     ));
  }
}
