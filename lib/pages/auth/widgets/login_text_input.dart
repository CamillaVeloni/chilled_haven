import 'package:flutter/material.dart';

const Color inputFieldColor = Color.fromARGB(255, 40, 40, 40);

class LoginTextInput extends StatelessWidget {
  final EdgeInsetsGeometry? outsidePadding;
  final String? hintText;
  final String labelText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final void Function()? onEditingComplete;
  final TextEditingController? controller;
  final bool required;
  final String? Function(String?)? validator;
  final bool obscureText;

  const LoginTextInput(
      {Key? key,
      this.outsidePadding,
      this.hintText,
      this.required = false,
      this.controller,
      this.textInputAction,
      this.keyboardType,
      required this.labelText,
      this.obscureText = false,
      this.onEditingComplete, this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: outsidePadding ??
          const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        onEditingComplete: onEditingComplete,
        validator: validator ?? (value) {
          // The validator receives the text that the user has entered.
          if (required && value!.isEmpty) {
            return 'Campo necessário.';
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          labelStyle: const TextStyle(color: inputFieldColor, fontSize: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
        ),
      ),
    );
  }
}
