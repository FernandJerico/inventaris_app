import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../routes/app_pages.dart';

class AuthController extends GetxController {
  // ignore: todo
  //TODO: Implement AuthController
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  UserCredential? _userCredential;
  FirebaseAuth auth = FirebaseAuth.instance;
  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((value) => _userCredential = value);

    // firebase
    CollectionReference users = firestore.collection('users');

    final checkUsers = await users.doc(googleUser?.email).get();
    if (!checkUsers.exists) {
      users.doc(googleUser?.email).set({
        'uid': _userCredential!.user!.uid,
        'name': googleUser?.displayName,
        'email': googleUser?.email,
        'photo': googleUser?.photoUrl,
        'createAt': _userCredential!.user!.metadata.creationTime.toString(),
        'lastLoginAt':
            _userCredential!.user!.metadata.lastSignInTime.toString(),
      });
    } else {
      users.doc(googleUser?.email).set({
        'lastLoginAt':
            _userCredential!.user!.metadata.lastSignInTime.toString(),
      });
    }
    Get.offAllNamed(Routes.BOTTOM_NAVBAR);
  }

  Future logout() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> streamUsers(String email) {
    return firestore.collection('users').doc(email).snapshots();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> streamItem(String itemId) {
    return firestore.collection('item').doc(itemId).snapshots();
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
