import 'package:flutter/material.dart';

Text text(String text, double fontSize, Color color, FontWeight fontWeight,
    double letterSpacing) {
  return Text(
    text,
    style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing),
  );
}

TextField textField(
    IconData icon, String hintText, TextEditingController controller) {
  return TextField(
    decoration: InputDecoration(
        filled: true,
        fillColor: Colors.blueGrey[50],
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        hintText: hintText),
    controller: controller,
  );
}
