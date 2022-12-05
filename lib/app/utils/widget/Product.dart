import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  const Product({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.only(top: 7),
        height: 80,
        width: 480,
        decoration: BoxDecoration(
          color: Color.fromARGB(232, 255, 255, 255),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 7, bottom: 7),
              child: SizedBox(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: const Image(
                      image: NetworkImage(
                    'https://i.imgur.com/APmrQQB.jpeg',
                  )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Beng-Beng',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Color.fromRGBO(0, 0, 0, 67),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Id :',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w900,
                              color: Color.fromRGBO(0, 0, 0, 67),
                            ),
                          ),
                          Text(
                            ' 8196142770',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w900,
                              color: Color.fromRGBO(0, 0, 0, 67),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 100),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '50',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Color.fromRGBO(0, 0, 0, 67),
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Rp.',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w900,
                              color: Color.fromRGBO(0, 0, 0, 67),
                            ),
                          ),
                          Text(
                            '100.000',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w900,
                              color: Color.fromRGBO(0, 0, 0, 67),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
