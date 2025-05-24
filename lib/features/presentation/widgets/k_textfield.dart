import 'package:flutter/material.dart';
import 'package:movie_tracker/core/constants/colors/app_colors.dart';

class KTextField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? hintText;
  final String? prefixText;
  final String? labelText;
  final int? maxLength;
  final String? Function(String?)? validator;
  final bool? isEnabled;
  final bool upperCase;
  final TextStyle? labelStyle;
  final int maxLines;
  final TextCapitalization textCapitalization;
  final bool? isDense;
  final bool? autofocus;
  final bool? obscureText;

  const KTextField({
    super.key,
    required this.controller,
    this.keyboardType,
    this.hintText,
    this.prefixText,
    this.labelText,
    this.maxLength,
    this.validator,
    this.isEnabled,
    this.upperCase = false,
    this.labelStyle,
    this.maxLines = 1,
    this.textCapitalization = TextCapitalization.none,
    this.isDense,
    this.autofocus,
    this.obscureText,
  });

  @override
  State<KTextField> createState() => _KTextFieldState();
}

class _KTextFieldState extends State<KTextField> {
  bool active = false;

  @override
  void initState() {
    active = widget.controller.text.isNotEmpty;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      showCursor: true,
      obscureText: widget.obscureText ?? false,
      autofocus: widget.autofocus ?? false,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      textInputAction: TextInputAction.done,
      textCapitalization: widget.textCapitalization,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      enabled: widget.isEnabled,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      validator: widget.validator ??
          (value) {
            if (value != null && value.isNotEmpty) {
              return null;
            }
            return '';
          },
      decoration: InputDecoration(
        isDense: widget.isDense,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: Theme.of(context).textTheme.bodyMedium!.color,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        labelText: widget.labelText,
        labelStyle: widget.labelStyle,
        alignLabelWithHint: true,
        fillColor: AppColors.gray,
        filled: true,
        counterText: '',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusColor: Theme.of(context).primaryColor,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        errorMaxLines: 2,
        prefixStyle: TextStyle(
          color: Theme.of(context).textTheme.bodyMedium!.color,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      style: TextStyle(
        color: Theme.of(context).textTheme.bodyMedium!.color,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
