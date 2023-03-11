import 'package:flutter/material.dart';

Widget defaultButton({
  Color background = Colors.indigo,
  double radius = 12,
  required Function function,
  required String text,
}) =>
    Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
      child: TextButton(
        onPressed: ()
        {
          function();
        },
        child: Text(text,
          style: const TextStyle(color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );

Widget defaultText(
   String text
)=>
     Text(text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,),
    );