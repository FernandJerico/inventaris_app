import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:inventaris_app/app/modules/home/views/home_view.dart';

import '../../modules/history/views/history_view.dart';
import '../../modules/items/views/items_view.dart';
import '../../modules/profile/views/profile_view.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 16),
        child: GNav(
            backgroundColor: Colors.white,
            color: Colors.black,
            activeColor: const Color.fromARGB(255, 0, 0, 0),
            tabBackgroundColor: const Color.fromARGB(255, 226, 222, 222),
            gap: 6,
            onTabChange: (index) {
              print(index);
            },
            padding: const EdgeInsets.all(16),
            tabs: [
              GButton(
                icon: Icons.home,
                text: "Home",
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return HomeView();
                  }));
                },
              ),
              GButton(
                icon: Icons.view_in_ar,
                text: "Items",
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ItemView();
                  }));
                },
              ),
              GButton(
                icon: Icons.history,
                text: "History",
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const HistoryView();
                  }));
                },
              ),
              GButton(
                icon: Icons.person,
                text: "Profile",
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ProfileView();
                  }));
                },
              )
            ]),
      ),
    );
  }
}
