import 'dart:math';
import 'second_page.dart';
import 'package:flutter/material.dart';
import 'counter.dart';
import 'first_page.dart';

void main() {
  runApp(const MyApp());
}

bool flag = false;
int cnt = 0;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: CheckboxSingle(),
        ),
      ),
    );
  }
}

class CheckboxSingle extends StatefulWidget {
  const CheckboxSingle({Key? key}) : super(key: key);

  @override
  State<CheckboxSingle> createState() => _CheckboxSingleState();
}

class _CheckboxSingleState extends State<CheckboxSingle> {
  bool _isChecked = false;
  void push() {
    flag = _isChecked;
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => FirstPage(flag)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _isChecked ? "3人モードじゃんけん" : "2人モードじゃんけん",
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'じゃんけんアプリ',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.asset('images/result_index.png'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _isChecked ? "3人モード" : "2人モード",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Checkbox(
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = !_isChecked;
                      print(_isChecked);
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                push();
              },
              child: Text('スタート'),
            ),
          ],
        ),
      ),
    );
  }
}
