import 'package:flutter/material.dart';

class testField extends StatefulWidget {
  const testField({Key? key}) : super(key: key);

  @override
  State<testField> createState() => _testFieldState();
}

class _testFieldState extends State<testField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.red,
          hintText: "Oshriya is an idiot",
          suffixIcon: IconButton(
            onPressed: () {},
            icon: Icon(Icons.visibility),
          ),
        ),
      ),
    );
  }
}
