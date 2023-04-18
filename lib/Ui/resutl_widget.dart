import 'package:flutter/material.dart';

import 'MyColors.dart';

// ignore: must_be_immutable
class ResultWidget extends StatelessWidget {
  String result = "";
  String operationsText = "";
  Color resultColor = Colors.black;

  ResultWidget(this.result,this.operationsText,this.resultColor,{super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            alignment: Alignment.topRight,
            margin: const EdgeInsets.all(10),
            child: Text(
              operationsText,
              style: const TextStyle(fontSize: 20, color: MyColors.textColor),
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Text(
              result,
              style:  TextStyle(fontSize: 35, color: resultColor),
            ),
          ),
        ),
      ],
    );
  }
}
