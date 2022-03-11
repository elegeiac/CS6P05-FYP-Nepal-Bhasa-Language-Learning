import 'package:flutter/material.dart';
import 'package:nepalbhasafyp/presentation/colors.dart';

class customPassTextFormField extends StatefulWidget {
  // const customPassTextFormField({Key? key}) : super(key: key);
  final String? hint;
  final TextEditingController? controller;
  final Function(String?)? save;
  final Widget? suffix;

  final Function? onSaved;

  customPassTextFormField({
    Key? key,
    this.save,
    this.suffix,
    this.hint,
    this.controller,
    this.onSaved,
  });

  @override
  State<customPassTextFormField> createState() =>
      _customPassTextFormFieldState();
}

class _customPassTextFormFieldState extends State<customPassTextFormField> {
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
        width: size.width * 0.8,
        child: TextFormField(
          onSaved: widget.save,
          controller: widget.controller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field cannot be empty!';
            }
            return null;
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: hidePassword,
          decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(hidePassword == true
                    ? Icons.visibility_off
                    : Icons.visibility, color: AppColor.MAROON,),
                onPressed: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
              ),
              hintText: widget.hint,
              hintStyle: TextStyle(fontSize: 14, color: AppColor.GREY),
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              filled: true,
              fillColor: AppColor.CREAM,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ))),
        ),
      ),
    );
  }
}
