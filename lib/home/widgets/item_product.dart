import 'package:flutter/material.dart';

class ItemProduct extends StatelessWidget {
  const ItemProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.1,
        width: 75,
        margin: const EdgeInsets.only(right: 50),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Image.asset(
                'assets/item1.png',
              ),
            ),
            const Positioned(
                bottom: 0,
                right: -2,
                child: Icon(
                  Icons.add_circle_outline_rounded,
                  color: Colors.green,
                  size: 20,
                ))
          ],
        ));
  }
}
