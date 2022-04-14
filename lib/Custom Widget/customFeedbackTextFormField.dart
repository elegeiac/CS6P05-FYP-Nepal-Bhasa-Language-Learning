import 'package:flutter/material.dart';
import 'package:nepalbhasafyp/presentation/colors.dart';

class CustomFeedbackTextFormField extends StatelessWidget {
  final String? hint;
  final TextEditingController? controller;
  final Function(String?)? save;
  final Widget? suffix;

  final Function? onSaved;

  const CustomFeedbackTextFormField({
    Key? key,
    this.save,
    this.suffix,
    this.hint,
    this.controller,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        width: size.width * 0.8,
        child: TextFormField(
          keyboardType: TextInputType.multiline,
          maxLines: 5,
          onSaved: this.save,
          controller: this.controller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field cannot be empty!';
            }
            return null;
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
              suffix: suffix,
              hintText: this.hint,
              hintStyle: TextStyle(fontSize: 14, color: AppColor.GREY),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 14, horizontal: 10),
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
