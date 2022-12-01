import 'package:flutter/material.dart';

class Stock extends StatelessWidget {
  const Stock({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12),
      height: 86.97,
      width: 151.08,
      decoration: BoxDecoration(
          color: Color.fromARGB(199, 14, 35, 94),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: const [
          Text(
            "Stock",
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "5000",
            style: TextStyle(
              fontSize: 32,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
