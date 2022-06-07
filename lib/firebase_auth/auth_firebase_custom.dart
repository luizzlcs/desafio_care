import 'package:desafio_care/firebase_auth/auth_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebaseCustom implements AuthInterface {
  @override
  Future login(String email, String pass) async {
    if (email != null && pass != null) {
      try {
        var result = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: pass);
        return "loged";
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          return 'User not found in register';
        } else if (e.code == 'wrong-password') {
          return "Wrong password provided for that user.";
        }
      }
    }
    return 'E-mail e senha não podem ser nulos';
  }

  @override
  Future register(String email, String pass) async {
    if (email != null && pass != null) {
      try {
        var credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: pass,
        );

        return 'Register user.';
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          return 'The password provided is less than five characters long.';
        } else if (e.code == 'email-already-in-use') {
          return 'The account already exists for that email.';
        }
      }
    }
    return 'Not registrad, ivalid inputs!';
  }

  @override
  Future logout() async {
    try {
      var logout = await FirebaseAuth.instance
        ..signOut();
    } on FirebaseAuthException catch (e) {
      return 'not loged';
    }
    return '';
  }

  bool validInput(String email, String pass) {
    return email.isEmpty && pass.isEmpty && pass.length >= 6;
  }
}
