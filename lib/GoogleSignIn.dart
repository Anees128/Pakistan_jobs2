import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_signin_button/button_builder.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';



class googleSignIn extends StatefulWidget {
  @override
  _googleSignInState createState() => _googleSignInState();
}

class _googleSignInState extends State<googleSignIn> {
  final String title = "Sign Up with google";

  get _auth => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this.title),
        ),
        backgroundColor: Colors.grey[400],
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //For Google
                Padding(
                    padding: EdgeInsets.all(2.0),
                    child: SignInButton(
                      Buttons.Google,
                      text: "Sign in with Google",
                      onPressed: () async {
                        // sign in Google with a returning user profile
                        UserCredential userCredential =
                            await signInWithGoogle();
                        final snapShot = await FirebaseFirestore.instance
                            .collection("userData")
                            .doc(userCredential.user.uid)
                            .get();
                        if (snapShot == null || !snapShot.exists) {
                          await FirebaseFirestore.instance
                              .collection("userData")
                              .doc(userCredential.user.uid)
                              .set({'NoOfDecks': 0});
                        }
                      },
                    )),
                // FOr Facebook
                Padding(
                    padding: EdgeInsets.all(2.0),
                    child: SignInButton(Buttons.Facebook,
                        text: "Sign in with Facebook", onPressed: () async {})),
                // FOr Twitter
                Padding(
                    padding: EdgeInsets.all(2.0),
                    child: SignInButton(Buttons.Twitter,
                        text: "Sign in with Twitter", onPressed: () {})),
              ]),
        ));
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}