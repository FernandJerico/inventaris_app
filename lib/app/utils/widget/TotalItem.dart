import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TotalItem extends StatefulWidget {
  @override
  State<TotalItem> createState() => _TotalItemState();
}

class _TotalItemState extends State<TotalItem> {
  // TotalItem({
  final Stream<QuerySnapshot> countItem = FirebaseFirestore.instance
      .collection('item')
      .where('created', isEqualTo: FirebaseAuth.instance.currentUser!.email)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12),
      height: 86.97,
      width: 160,
      decoration: BoxDecoration(
          color: const Color.fromARGB(199, 14, 35, 94),
          borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Column(
          children: [
            Text(
              "Total Item",
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            StreamBuilder<QuerySnapshot>(
                stream: countItem,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot2) {
                  // final data2 = snapshot2.requireData;

                  if (snapshot2.hasError) {
                    return Text("error");
                  }
                  if (snapshot2.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
                  }
                  final int documents = snapshot2.data!.docs.length;
                  // final int documents = snapshot2.data!.docs.length;
                  return Text(
                    ' ${documents}',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
