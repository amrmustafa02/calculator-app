import 'package:flutter/material.dart';

import 'MyColors.dart';

// ignore: must_be_immutable
class DigitBtn extends StatelessWidget {
  Color textCol;
  Color color;
  String text;
  int flexBtn;

  DigitBtn(this.text,
      {this.textCol = Colors.black,
      this.color = MyColors.btnCrl,
      this.flexBtn = 1,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flexBtn,
      child: Container(
        margin: const EdgeInsets.all(10),
        height: 75,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: const CircleBorder(), backgroundColor: color),
          onPressed: () {},
          child: Text(
            text,
            style: TextStyle(color: textCol, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
