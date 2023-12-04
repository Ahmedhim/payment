import 'package:flutter/material.dart';
import 'package:payment_app/Core/constants.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({super.key, required this.text, required this.ontab});
  final String text;
  final void Function() ontab;
  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontab,
      child: Container(
        width: double.infinity,
        height: 73,
        decoration: BoxDecoration(
            color: const Color(0Xff34A853),
            borderRadius: BorderRadius.circular(12)),
        child: Center(
            child: Text(
          widget.text,
          style: Styles.style22,
        )),
      ),
    );
  }
}
