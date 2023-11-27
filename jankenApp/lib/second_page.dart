import 'dart:math';
import 'counter.dart';
import 'package:button/first_page.dart';
import 'package:button/main.dart';
import 'package:flutter/material.dart';
import 'list.dart';
import 'main.dart';

ResultContents rc = new ResultContents();

class SecondPage extends StatelessWidget {
  SecondPage(this.janken, this.bl);
  final bool bl;
  final int janken;
  final int cpu = Random().nextInt(3);
  final int cpu2 = Random().nextInt(3);

  judge3() {
    if ((cpu + cpu2 + janken) % 3 == 0) {
      return 0;
    } else if (((cpu + cpu2 + janken) % 3 == 1 && cpu != cpu2) ||
        ((cpu + cpu2 + janken) % 3 == 2 && cpu == cpu2)) {
      return 1;
    } else {
      return 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (bl == false) {
      int judge = ((cpu - janken) + 3) % 3;
      return jankenDouble(
        context,
        judge: judge,
        janken: janken,
        cpu: cpu,
      );
    } else {
      int judge = judge3();
      return jankenTripl(
        context,
        judge: judge,
        janken: janken,
        cpu: cpu,
        cpu2: cpu2,
      );
    }
  }
}

Widget jankenImg(BuildContext context,
    {required String img, required String name}) {
  return Column(
    children: [
      Container(
        width: 150,
        height: 150,
        child: Image.asset(img),
      ),
      Container(
        alignment: Alignment(0, 0),
        width: 150,
        height: 30,
        child: Text(
          name,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      )
    ],
  );
}

Widget jankenImg2(BuildContext context,
    {required String img, required String name}) {
  return Column(
    children: [
      Container(
        width: 100,
        height: 100,
        child: Image.asset(img),
      ),
      Container(
        alignment: Alignment(0, 0),
        width: 50,
        height: 30,
        child: Text(
          name,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      )
    ],
  );
}

Widget jankenDouble(BuildContext context,
    {required int judge, required janken, required cpu}) {
  Map rcMap = rc.getContent(judge);
  return Scaffold(
    appBar: AppBar(
      title: const Text('ぽん!'),
    ),
    body: Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Text('mages/' + rcMap.values.toList()[0] + '.png'),
        Image.asset('images/' + rcMap.values.toList()[0] + '.png'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            jankenImg(
              context,
              img: choose[janken],
              name: 'player',
            ),
            jankenImg(
              context,
              img: cchoose[cpu],
              name: 'cpu',
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          rcMap.keys.toList()[0],
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            //ボタンを押した時の挙動
            int count = 0;
            Navigator.popUntil(context, (_) => count++ >= 2);
          },
          child: const Text('タイトルへ'),
        ),
      ],
    )),
  );
}

Widget jankenTripl(BuildContext context,
    {required int judge, required janken, required cpu, required cpu2}) {
  Map rcMap = rc.getContent(judge);

  return Scaffold(
    appBar: AppBar(
      title: const Text('ぽん!'),
    ),
    body: Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'images/' + rcMap.values.toList()[0] + '.png',
          width: 250,
          height: 250,
        ),
        jankenImg2(
          context,
          img: choose[janken],
          name: 'player',
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            jankenImg2(
              context,
              img: cchoose[cpu],
              name: 'CPU',
            ),
            jankenImg2(
              context,
              img: cchoose[cpu2],
              name: 'CPU2',
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          rcMap.keys.toList()[0],
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            //ボタンを押した時の挙動
            int count = 0;
            Navigator.popUntil(context, (_) => count++ >= 2);
          },
          child: const Text('タイトルへ'),
        ),
      ],
    )),
  );
}
