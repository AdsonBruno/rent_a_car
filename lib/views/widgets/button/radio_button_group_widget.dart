import 'package:flutter/material.dart';
import 'package:rental_of_vehicle/views/core/app_colors.dart';

class CustomRadioGroup<T> extends StatelessWidget {
  final String title;
  final List<T> options;
  final T? selectedOption;
  final bool showError;
  final String? Function()? validate;
  final void Function(T?) onOptionSelected;
  final String Function(T) labelBuilder;

  const CustomRadioGroup({
    super.key,
    required this.title,
    required this.options,
    this.selectedOption,
    required this.showError,
    required this.onOptionSelected,
    required this.labelBuilder,
    this.validate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            color: showError ? AppColors.red700 : AppColors.green,
            fontWeight: FontWeight.w300,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: options
                .map((option) => Column(
                      children: [
                        Text(
                          labelBuilder(option),
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Inter',
                            color:
                                showError ? AppColors.red700 : AppColors.green,
                          ),
                        ),
                        Radio<T>(
                          activeColor: AppColors.green,
                          value: option,
                          fillColor: MaterialStateProperty.resolveWith<Color>(
                            (states) =>
                                showError ? AppColors.red700 : AppColors.green,
                          ),
                          groupValue: selectedOption,
                          onChanged: (value) {
                            onOptionSelected(value);
                          },
                        ),
                      ],
                    ))
                .toList(),
          ),
        ),
        if (showError && validate != null && validate!() != null)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              validate!()!,
              style: const TextStyle(
                color: AppColors.red700,
                fontSize: 13,
              ),
            ),
          ),
      ],
    );
  }
}
