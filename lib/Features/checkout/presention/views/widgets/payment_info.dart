import 'package:flutter/material.dart';

class PaymentInfo extends StatefulWidget {
  const PaymentInfo({super.key, required this.text1, required this.text2});
  final String text1, text2;
  @override
  State<PaymentInfo> createState() => _PaymentInf0State();
}

class _PaymentInf0State extends State<PaymentInfo> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.text1,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
        const Spacer(),
        Text(
          widget.text2,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        )
      ],
    );
  }
}
