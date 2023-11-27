import 'dart:ffi';
import 'package:button/first_page.dart';
import 'package:button/main.dart';
import 'package:button/second_page.dart';
import 'package:flutter/material.dart';
import 'list.dart';

class FirstPage extends StatelessWidget {
  int nameInt = -1;
  FirstPage(this.flag);
  final bool flag;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('最初はグー、じゃんけん...'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/janken_boys.png"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                jankenBtn(
                  context,
                  jankenImg: choose[0],
                  nameint: nameInt = 0,
                ),
                jankenBtn(
                  context,
                  jankenImg: choose[1],
                  nameint: nameInt = 1,
                ),
                jankenBtn(
                  context,
                  jankenImg: choose[2],
                  nameint: nameInt = 2,
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

Widget jankenBtn(BuildContext context,
    {required String jankenImg, required int nameint}) {
  return Center(
    child: GestureDetector(
      onTap: () {
        int nameInt = nameint;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SecondPage(
              nameInt,
              flag,
            ),
          ),
        );
      },
      child: Container(
        width: 100,
        height: 100,
        child: Image.asset(jankenImg),
      ),
    ),
  );
}
