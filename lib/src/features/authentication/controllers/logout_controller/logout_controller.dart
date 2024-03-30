import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

logOut() async {
  await GoogleSignIn().signOut();
  await FirebaseAuth.instance.signOut();
}
