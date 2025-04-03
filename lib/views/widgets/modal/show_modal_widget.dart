import 'package:flutter/material.dart';

class ShowModalDialogWidget extends StatelessWidget {
  final String? image;
  final List<String> data;

  const ShowModalDialogWidget({super.key, required this.data, this.image});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (image != null)
              Image.asset(
                image!,
                height: MediaQuery.of(context).size.height * 0.1, //100,
                width: MediaQuery.of(context).size.width * 0.1,
                fit: BoxFit.fitWidth,
              ),
            ...data.map(
              (text) => Text(
                text,
                style: const TextStyle(
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w300,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
