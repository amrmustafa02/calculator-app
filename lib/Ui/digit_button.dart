import 'package:flutter/material.dart';

import 'MyColors.dart';

// ignore: must_be_immutable
class DigitBtn extends StatelessWidget {
  Function onUserClick;

  Color textCol;
  Color color;
  String text;
  int flexBtn;

  DigitBtn(this.text, this.onUserClick,
      {this.textCol = Colors.black,
      this.color = MyColors.btnCrl,
      this.flexBtn = 1,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flexBtn,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 60,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: const CircleBorder(), backgroundColor: color),
          onPressed: () {
            onUserClick(text);
          },
          child: Text(
            text,
            style: TextStyle(color: textCol, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
