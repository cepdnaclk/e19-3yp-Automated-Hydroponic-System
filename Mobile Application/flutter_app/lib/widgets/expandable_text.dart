//import 'dart:html';

import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  const ExpandableText({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;

  double textHeight = 350;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt()+1, widget.text.length);
    }
    else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty ? Text(
        firstHalf,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          //color: Colors.grey,
        ),
      ) : Column(
        children: [
          Text(
            hiddenText? (firstHalf + "...") : (firstHalf + secondHalf),
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              height: 1.8,
              //color: Colors.grey,
            ),
          ),
          
          SizedBox(height:10.0),
          InkWell(
            onTap: () {
              setState(() {
                hiddenText = !hiddenText;
              });
            },
            child: Row(
              children: [
                Text(
                  hiddenText ? "Show More" : "Show Less",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 10,
                    color: Color(0xFF0D7817),
                  ),
                ),
                Icon(hiddenText ? Icons.arrow_drop_down : Icons.arrow_drop_up, color: Color(0xFF0D7817) ,)
              ]
              ),
          )
        ],
      ),
    );
  }
}