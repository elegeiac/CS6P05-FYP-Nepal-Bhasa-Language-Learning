import 'package:flutter/material.dart';
import 'package:nepalbhasafyp/presentation/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hint;
  final TextEditingController? controller;
  final Function(String?)? save;

  final Function? onSaved;

  const CustomTextFormField({
    Key? key,
    this.save,
    this.hint,
    this.controller,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 5, 10, 10),
        height: size.height * 0.07,
        width: size.width * 0.8,
        child: TextFormField(
          onSaved: this.save,
          controller: this.controller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          // onSaved: this.onSaved,
          decoration: InputDecoration(
              hintText: this.hint,
              hintStyle: TextStyle(fontSize: 14, color: AppColor.GREY),
              filled: true,
              fillColor: AppColor.CREAM,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ))),
        ),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: AppColor.BLACK,
            blurRadius: 15,
            offset: const Offset(0, 5),
          )
        ]),
      ),
    );
  }
}
