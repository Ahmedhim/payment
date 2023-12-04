import 'package:flutter/material.dart';

class CustomPaymentItem extends StatefulWidget {
  const CustomPaymentItem(
      {super.key, required this.image, this.isActive = false});
  final String image;
  final bool isActive;
  @override
  State<CustomPaymentItem> createState() => _CustomPaymentItemState();
}

class _CustomPaymentItemState extends State<CustomPaymentItem> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border:
              Border.all(color: widget.isActive ? Colors.green : Colors.black)),
      child: Image.asset(widget.image),
    );
  }
}
