import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final String labelText;
  final String label;
  final Widget? suffixIcon;
  final int? maxLines;
  const CommonTextField({
    super.key,
    required this.labelText,
    required this.label,
    this.suffixIcon,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText, style: TextStyle(fontSize: 17)),
        SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            alignLabelWithHint: true,
            suffixIcon: suffixIcon,
            filled: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            labelText: label,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey, width: 2.0),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          ),
          maxLines: maxLines,
        ),
        SizedBox(height: 50),
      ],
    );
  }
}
