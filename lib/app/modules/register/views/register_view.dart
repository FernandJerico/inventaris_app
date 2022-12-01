import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  late final VoidCallback showLoginView;
  RegisterView({
    Key? key,
    required this.showLoginView,
  }) : super(key: key);
  // text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();

  Future signUp() async {
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
    }
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmpasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(239, 242, 247, 100),
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            //logo login
            SizedBox(
                height: 225,
                width: 225,
                child: Image.asset('assets/images/register_page.png')),
            //hello again
            Text(
              'New Here?',
              style: GoogleFonts.bebasNeue(fontSize: 45),
            ),

            const Text(
              'Signing up is easy. It only takes a few steps',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //email textfield
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(98, 144, 142, 1)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Email',
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            //password textfield
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                obscureText: true,
                controller: _passwordController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(98, 144, 142, 1)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Password',
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            //confirm password textfield
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                obscureText: true,
                controller: _confirmpasswordController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(98, 144, 142, 1)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Confirm Password',
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            //sign in button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: GestureDetector(
                onTap: signUp,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(98, 144, 142, 1),
                      borderRadius: BorderRadius.circular(15)),
                  child: const Center(
                      child: Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            //not a member? register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account?',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: showLoginView,
                  child: const Text(
                    ' Login Now',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            // sign in with google account
          ]),
        ),
      ),
    );
  }
}
