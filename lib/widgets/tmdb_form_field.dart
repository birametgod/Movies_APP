import 'package:flutter/material.dart';

class TmdbFormField extends StatelessWidget {

  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintText;
  final Function validator;
  final bool isPassword;
  final bool isEmail;
  final Function fieldSubmit;
  final TextInputAction inputAction;

  TmdbFormField({
    @required this.controller,
    @required this.hintText,
    @required this.validator,
    @required this.inputAction,
    this.isPassword = false,
    this.isEmail = false,
    this.focusNode,
    this.fieldSubmit
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      validator: validator,
      obscureText: isPassword ? true : false,
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      textInputAction: inputAction,
      onFieldSubmitted: fieldSubmit,
      cursorColor: Colors.white,
      //onSaved: (String value) => value.trim(),
      decoration: InputDecoration(
          focusColor: Colors.white,
          hoverColor: Colors.white,
          hintText: hintText,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(0.0),
          ),
          suffixIcon: isPassword ? Icon(Icons.remove_red_eye, color: Colors.grey): null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0.0),
          )),
    );
  }
}
