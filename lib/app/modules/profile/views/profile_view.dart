import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventaris_app/app/modules/home/views/home_view.dart';
import 'package:inventaris_app/app/utils/widget/Stock.dart';
import 'package:ionicons/ionicons.dart';

import '../../../utils/widget/BottomNavbar.dart';
import '../../../utils/widget/TotalItem.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final user = FirebaseAuth.instance.currentUser!;

  ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var profileInfo = Expanded(
      child: Column(children: [
        Container(
          height: 100,
          width: 100,
          margin: const EdgeInsets.only(top: 15),
          child: Stack(
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/avatar.jpg'),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Ionicons.pencil,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Fernand Jerico',
          style: GoogleFonts.montserrat(fontSize: 30),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          user.email!,
          style: GoogleFonts.montserrat(fontSize: 17),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 40,
          width: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Theme.of(context).colorScheme.secondary,
          ),
          child: Center(
            child: Text(
              'Edit Profile',
              style: GoogleFonts.montserrat(fontSize: 15),
            ),
          ),
        )
      ]),
    );

    var header = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: (() {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return HomeView();
            }));
          }),
          child: const Icon(
            Icons.keyboard_arrow_left_outlined,
            size: 30,
          ),
        ),
        profileInfo,
        const SizedBox(
          width: 10,
        ),
      ],
    );
    return Scaffold(
      backgroundColor: const Color.fromRGBO(239, 242, 247, 1),
      bottomNavigationBar: const BottomNavbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            header,
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 2, left: 8),
                  child: Row(
                    children: const [
                      TotalItem(),
                      SizedBox(
                        width: 5,
                      ),
                      Stock(),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: const EdgeInsets.only(top: 25),
                    height: 80,
                    width: 300,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(199, 14, 35, 94),
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            print("object");
                            ProfileView();
                          },
                          child: const Text(
                            "Saldo:  Rp. 1.500.000",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
