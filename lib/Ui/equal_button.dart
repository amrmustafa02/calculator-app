import 'package:calculator/Ui/MyColors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RoundedButton extends StatelessWidget {
  Function onUserCLick;
  Color color;
  String text;
  int flexBtn;
  Color textCol;

  RoundedButton(this.text, this.onUserCLick,
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
        height: 60,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              backgroundColor: color),
          onPressed: () {
            onUserCLick(text);
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
