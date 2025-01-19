import 'package:flutter/material.dart';
import 'package:rental_of_vehicle/views/core/app_colors.dart';

class DocumentTypeSelectorDialogWidget extends StatelessWidget {
  final List<String> documentTypes;

  const DocumentTypeSelectorDialogWidget({
    super.key,
    required this.documentTypes,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Selecione o tipo de documento',
        style: TextStyle(
          fontSize: 14,
          fontFamily: 'Inter',
          color: AppColors.black,
        ),
      ),
      content: Column(
          mainAxisSize: MainAxisSize.min,
          children: documentTypes.map((type) {
            return ListTile(
              title: Text(
                type,
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'Inter',
                  color: AppColors.black,
                ),
              ),
              onTap: () => Navigator.pop(context, type),
            );
          }).toList()),
    );
  }
}
