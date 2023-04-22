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
        margin: const EdgeInsets.only(bottom: 15),
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
                  handleErrors,
                  color: MyColors.oprCrl,
                  textCol: Colors.white,
                ),
                DigitBtn(
                  "×",
                  handleErrors,
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
                  handleErrors,
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
                  handleErrors,
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
                  handleErrors,
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
                  handleErrors,
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
      evaluateEquation();
    });
  }

  void onClickRemoveLastChar(_) {
    setState(() {
      if (operationsText.isNotEmpty) {
        operationsText = operationsText.substring(0, operationsText.length - 1);
        evaluateEquation();
      }
    });
  }

  void onClickRemoveAll(_) {
    setState(() {
      operationsText = "";
      result = "0";
    });
  }

  void onClickEqual(_) {
    resultColor = Colors.black;
    setState(() {
      // check if equation empty
      if (operationsText.isEmpty) {
        return;
      }
      if (evaluateEquation()) {
        operationsText = result;
      }
    });
  }

  void handleErrors(String operation) {
    setState(() {
      if (operation == '.') {
        handleDot();
        return;
      }

      if (operation == '-') {
        if (operationsText[operationsText.length - 1] != '-') {
          operationsText += '-';
        }
        return;
      }


      // if operation is after operation
      if (operationsText[operationsText.length - 1] == '+' ||
          operationsText[operationsText.length - 1] == '×' ||
          operationsText[operationsText.length - 1] == '-' ||
          operationsText[operationsText.length - 1] == '%' ||
          operationsText[operationsText.length - 1] == '÷' ||
          operationsText.isEmpty) {
        return;
      }

      operationsText += operation;
    });
  }

  void handleDot() {
    for (int i = operationsText.length - 1; i >= 0; i--) {
      if (operationsText[i] == '.') {
        return;
      }
      if (operationsText[i] == '+' ||
          operationsText[i] == '-' ||
          operationsText[i] == '×' ||
          operationsText[i] == '÷') {
        operationsText += '.';
        return;
      }
    }
  }

  bool evaluateEquation() {
    // replace all x with *
    // replace all ÷ with /
    // to make correct expression
    String expression = operationsText;
    expression = expression.replaceAll('×', '*');
    expression = expression.replaceAll('÷', '/');

    try {
      Parser parser = Parser();
      Expression exp = parser.parse(expression);
      ContextModel contextModel = ContextModel();
      result = '${exp.evaluate(EvaluationType.REAL, contextModel)}';

      // handle if result is integer
      // if last char i result is 0
      // and before it is dot operation
      // 18.0 then then remove (.0)
      if (result.length >= 2) {
        if (result[result.length - 1] == '0' &&
            result[result.length - 2] == '.') {
          result = result.substring(0,result.length-2);
        }
      }

      return true;
    }
    // check if expression is not correct ,then show message error to user
    catch (e) {
      return false;
    }
  }
}
