import 'package:flutter/material.dart';
import 'package:rental_of_vehicle/views/core/app_colors.dart';

class CustomTextFormFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?)? validator;
  final bool readOnly;
  final VoidCallback? onTap;
  final TextInputType keyBoardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onButtonTap;
  final bool isPasswordField;
  final bool? passwordIconPrefix;

  const CustomTextFormFieldWidget({
    super.key,
    required this.controller,
    required this.labelText,
    this.validator,
    this.readOnly = false,
    this.onTap,
    this.keyBoardType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.onButtonTap,
    this.isPasswordField = false,
    this.passwordIconPrefix = false,
  });

  @override
  State<CustomTextFormFieldWidget> createState() =>
      _CustomTextFormFieldWidgetState();
}

class _CustomTextFormFieldWidgetState extends State<CustomTextFormFieldWidget> {
  bool hasError = false;
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyBoardType,
      readOnly: widget.readOnly,
      onTap: widget.onTap,
      obscureText: widget.isPasswordField ? !_isPasswordVisible : false,
      validator: (value) {
        final error = widget.validator?.call(value);
        setState(() {
          hasError = error != null;
        });
        return error;
      },
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: TextStyle(
          fontFamily: 'Inter',
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: hasError ? AppColors.red700 : AppColors.green,
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.darkLeafGreen),
        ),
        prefixIcon: _buildPrefixIcon(),
        suffixIcon: _buildSuffixIcon(),
      ),
    );
  }

  Widget? _buildPrefixIcon() {
    if (widget.isPasswordField && widget.passwordIconPrefix == true) {
      return _passwordVisibilityIcon();
    }
    return widget.prefixIcon;
  }

  Widget? _buildSuffixIcon() {
    if (widget.isPasswordField && (widget.passwordIconPrefix != true)) {
      return _passwordVisibilityIcon();
    }
    return widget.suffixIcon;
  }

  Widget _passwordVisibilityIcon() {
    return IconButton(
        onPressed: () {
          setState(() {
            _isPasswordVisible = !_isPasswordVisible;
          });
        },
        icon:
            Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off));
  }
}
