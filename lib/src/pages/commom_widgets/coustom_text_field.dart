import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CoustomTextField extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool isSecret;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final bool readyOnly;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final TextInputType? textInputType;

  const CoustomTextField(
      {Key? key,
      required this.icon,
      required this.label,
      this.isSecret = false,
      this.inputFormatters,
      this.initialValue,
      this.readyOnly = false,
      this.validator,
      this.onSaved,
      this.controller,
      this.textInputType})
      : super(key: key);

  @override
  State<CoustomTextField> createState() => _CoustomTextFieldState();
}

class _CoustomTextFieldState extends State<CoustomTextField> {
  bool isObscure = false;
  @override
  void initState() {
    super.initState();
    isObscure = widget.isSecret;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        onSaved: widget.onSaved,
        keyboardType: widget.textInputType,
        readOnly: widget.readyOnly,
        initialValue: widget.initialValue,
        inputFormatters: widget.inputFormatters,
        obscureText: isObscure,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon),
          suffixIcon: widget.isSecret
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon: Icon(
                    isObscure ? Icons.visibility : Icons.visibility_off,
                  ),
                )
              : null,
          labelText: widget.label,
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }
}
