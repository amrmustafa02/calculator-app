import 'package:calculator/MyColors.dart';
import 'package:flutter/material.dart';

import 'digit_button.dart';
import 'operator_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Spacer(),
          const Text(
            "132",
            style: TextStyle(fontSize: 40, color: Colors.black),
          ),
          const Text(
            "132",
            style: TextStyle(fontSize: 20, color: MyColors.textColor),
          ),
          const SizedBox(height: 5,),

          Row(
            children: [
              DigitBtn("AC",color: Colors.red.shade200,textCol: Colors.red,),
              DigitBtn("C",color: Colors.red.shade200,textCol: Colors.red,),
              DigitBtn("%",color: MyColors.oprCrl,textCol: Colors.white,),
              DigitBtn("x",color: MyColors.oprCrl,textCol: Colors.white,),
            ],
          ),
          Row(
            children: [
              DigitBtn("7"),
              DigitBtn("8"),
              DigitBtn("9"),
              DigitBtn("/",color: MyColors.oprCrl,textCol: Colors.white,),
            ],
          ),
          Row(
            children: [
              DigitBtn("4"),
              DigitBtn("5"),
              DigitBtn("6"),
              DigitBtn("-",color: MyColors.oprCrl,textCol: Colors.white,),
            ],
          ),
          Row(
            children: [
              DigitBtn("1"),
              DigitBtn("2"),
              DigitBtn("3"),
              DigitBtn("+",color: MyColors.oprCrl,textCol: Colors.white,),
            ],
          ),
          Row(
            children: [
              RoundedButton("0",flexBtn: 2,),
              DigitBtn(".",flexBtn: 1,),
              DigitBtn("=",color: Colors.green,flexBtn: 1,textCol: Colors.white,),
            ],
          ),

        ],
      ),
    );
  }
}
