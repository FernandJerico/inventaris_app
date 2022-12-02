import 'package:flutter/material.dart';

class TotalItem extends StatelessWidget {
  const TotalItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12),
      height: 86.97,
      width: 151.08,
      decoration: BoxDecoration(
          color: const Color.fromARGB(199, 14, 35, 94),
          borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Column(
          children: const [
            Text(
              "Total Item",
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "150",
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
