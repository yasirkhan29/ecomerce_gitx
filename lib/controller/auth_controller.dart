import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomerce/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  // loading
  var isloading = false.obs;

// textcontrollers
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  // login method
  Future<UserCredential?> loginMethod({context}) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  // singup method

  Future<UserCredential?> signupMethod({email, password, context}) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  // storing data method

  storeUserData(
      {required String email,
      required String password,
      required String name}) async {
    DocumentReference store =
        firestore.collection('usersCollection').doc(currentUser!.uid);
    store.set({
      'name': name,
      'password': password,
      'email': email,
      'imagUrl': '',
      'id': currentUser!.uid,
      'cart_count': 00,
      'wishlist_count': 00,
      'order_count': 00,
    });
  }

  // signout
  signoutMethod(context) async {
    try {
      await auth.signOut();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
