import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/user.dart';

Future<bool> registerUser(UserModel u) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  try {
    await auth.createUserWithEmailAndPassword(
        email: u.email, password: u.password);
  }
  on FirebaseAuthException catch (e) {
    if (e.code == "weak-password") {
      print("Seu password é uma bosta!");
      return false;
    }
    else if (e.code == "email-already-in-use") {
      print("este e-mail já está em uso");
      return false;
    }
  }
  return true;
}