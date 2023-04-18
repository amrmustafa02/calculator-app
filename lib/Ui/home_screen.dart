import 'dart:math';

import 'package:calculator/Ui/MyColors.dart';
import 'package:calculator/Ui/resutl_widget.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'digit_button.dart';
import 'equal_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String result = "";
  String operationsText = "";
  Color resultColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Calculator",
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Spacer(),
            ResultWidget(result, operationsText, resultColor),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                DigitBtn(
                  "AC",
                  onClickRemoveAll,
                  color: Colors.red.shade200,
                  textCol: Colors.red,
                ),
                DigitBtn(
                  "C",
                  onClickRemoveLastChar,
                  color: Colors.red.shade200,
                  textCol: Colors.red,
                ),
                DigitBtn(
                  "%",
                  onUserClickOnDigit,
                  color: MyColors.oprCrl,
                  textCol: Colors.white,
                ),
                DigitBtn(
                  "×",
                  onUserClickOnDigit,
                  color: MyColors.oprCrl,
                  textCol: Colors.white,
                ),
              ],
            ),
            Row(
              children: [
                DigitBtn("7", onUserClickOnDigit),
                DigitBtn(
                  "8",
                  onUserClickOnDigit,
                ),
                DigitBtn(
                  "9",
                  onUserClickOnDigit,
                ),
                DigitBtn(
                  "÷",
                  onUserClickOnDigit,
                  color: MyColors.oprCrl,
                  textCol: Colors.white,
                ),
              ],
            ),
            Row(
              children: [
                DigitBtn(
                  "4",
                  onUserClickOnDigit,
                ),
                DigitBtn(
                  "5",
                  onUserClickOnDigit,
                ),
                DigitBtn(
                  "6",
                  onUserClickOnDigit,
                ),
                DigitBtn(
                  "-",
                  onUserClickOnDigit,
                  color: MyColors.oprCrl,
                  textCol: Colors.white,
                ),
              ],
            ),
            Row(
              children: [
                DigitBtn(
                  "1",
                  onUserClickOnDigit,
                ),
                DigitBtn(
                  "2",
                  onUserClickOnDigit,
                ),
                DigitBtn(
                  "3",
                  onUserClickOnDigit,
                ),
                DigitBtn(
                  "+",
                  onUserClickOnDigit,
                  color: MyColors.oprCrl,
                  textCol: Colors.white,
                ),
              ],
            ),
            Row(
              children: [
                RoundedButton(
                  "0",
                  flexBtn: 2,
                ),
                DigitBtn(
                  ".",
                  onUserClickOnDigit,
                  flexBtn: 1,
                ),
                DigitBtn(
                  "=",
                  onClickEqual,
                  color: Colors.green,
                  flexBtn: 1,
                  textCol: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void onUserClickOnDigit(String text) {
    setState(() {
      operationsText += text;
    });
  }

  void onClickRemoveLastChar(_) {
    setState(() {
      if (operationsText.isNotEmpty) {
        operationsText = operationsText.substring(0, operationsText.length - 1);
      }
    });
  }

  void onClickRemoveAll(_) {
    setState(() {
      operationsText = "";
    });
  }

  void onClickEqual(_) {
    resultColor = Colors.black;
    setState(() {
      // check if equation empty
      if (operationsText.isEmpty) {
        result = "0";
        return;
      }

      // replace all x with *
      // replace all ÷ with /
      // to make correct expression
      String expression = operationsText;
      expression = expression.replaceAll('×', '*');
      expression = expression.replaceAll('÷', '/');

      // evaluate expression
      try {
        Parser parser = Parser();
        Expression exp = parser.parse(expression);
        ContextModel contextModel = ContextModel();
        result = '${exp.evaluate(EvaluationType.REAL, contextModel)}';
      }
      // check if expression is not correct ,then show message error to user
      catch (e) {
        resultColor = Colors.red;
        result = "Not correct equation";
      }
    });
  }

  void handleErrors(_) {}
}
