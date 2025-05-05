import 'package:flutter/material.dart';
import 'package:result_nepal/utils/custom_text_style.dart';
import '../../utils/colors.dart';

class CustomTextField extends StatelessWidget {
  final Function(String)? onValueChange;
  final FocusNode? focusNode;
  final String hint;
  final IconData? preIconData; // Changed from String
  final IconData? suffixIconData; // Changed from String
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final Color? border;
  final Color? fillColor;
  final bool? readOnly;
  final bool? showError;
  final bool? autofocus;
  final String? labelText;
  final Function()? onTap;
  final Function(String)? onSubmitted;
  final int? maxCharacters;
  final TextCapitalization textCapitalization;
  final Function()? onTapSuffix;
  final bool obscureText;
  final Widget? suffixIcon;
  final Color? suffixIconColor;

  const CustomTextField({
    Key? key,
    this.fillColor,
    required this.hint,
    this.preIconData,
    this.suffixIconData,
    this.onValueChange,
    this.controller,
    this.validator,
    required this.textInputAction,
    required this.textInputType,
    this.border,
    this.readOnly = false,
    this.showError = true,
    this.textCapitalization = TextCapitalization.sentences,
    this.onTap,
    this.onSubmitted,
    this.autofocus = false,
    this.maxCharacters,
    this.focusNode,
    this.labelText,
    this.suffixIcon,
    this.onTapSuffix,
    this.obscureText = false,
    this.suffixIconColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      focusNode: focusNode,
      maxLength: maxCharacters,
      autofocus: autofocus!,
      textCapitalization: textCapitalization,
      onFieldSubmitted: onSubmitted,
      onTap: onTap,
      readOnly: readOnly ?? false,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      maxLines: 1,
      validator: validator,
      controller: controller,
      onChanged: onValueChange,
      decoration: InputDecoration(
        label: labelText != null
            ? Text(
                labelText!,
                style: CustomTextStyles.f16W400(
                  color: AppColors.primaryColor,
                ),
              )
            : null,
        fillColor: fillColor ?? Colors.transparent,
        filled: fillColor != null,
        prefixIcon: preIconData != null
            ? Icon(preIconData, color: AppColors.secondaryTextColor)
            : null,
        suffixIcon: suffixIcon ??
            (suffixIconData != null
                ? IconButton(
                    icon: Icon(
                      suffixIconData,
                      color: suffixIconColor,
                    ),
                    onPressed: onTapSuffix,
                    splashRadius: 20,
                  )
                : null),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: border ?? AppColors.secondaryTextColor,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: border ?? AppColors.errorColor,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: border ?? AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: border ?? AppColors.errorColor,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        errorStyle: showError!
            ? const TextStyle(fontSize: 12)
            : const TextStyle(fontSize: 0),
        hintText: hint,
        hintStyle:
            CustomTextStyles.f16W400(color: AppColors.secondaryTextColor),
      ),
      style: CustomTextStyles.f16W400(
          color: (readOnly ?? false) ? AppColors.secondaryTextColor : null),
    );
  }
}
