import 'package:flutter/material.dart';
import 'package:payment_app/Core/widgets/custom_dash_line.dart';
import 'package:payment_app/Features/checkout/presention/views/widgets/credit_card_info.dart';
import 'package:payment_app/Features/checkout/presention/views/widgets/payment_info.dart';

import '../../../../../Core/constants.dart';

class ThankYouBody extends StatelessWidget {
  const ThankYouBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      child: Stack(clipBehavior: Clip.none, children: [
        Container(
          decoration: ShapeDecoration(
            color: const Color(0xFFD9D9D9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 40),
                const Text(
                  'Thank you!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                Text(
                  'Your transaction was successful',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.800000011920929),
                    fontSize: 20,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                const SizedBox(height: 42),
                const PaymentInfo(text1: "Date", text2: "01/24/2023"),
                const SizedBox(height: 20),
                const PaymentInfo(text1: "Time", text2: "10:15 AM"),
                const SizedBox(height: 20),
                const PaymentInfo(text1: "To", text2: "Ahmed Hammam"),
                const SizedBox(height: 25),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 40,
                ),
                const Row(
                  children: [
                    Text(
                      "Total",
                      style: Styles.style24,
                    ),
                    Spacer(),
                    Text(
                      r"$50.97",
                      style: Styles.style24,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                const CreditCardInfo(),
              ],
            ),
          ),
        ),
        Positioned(
            bottom: MediaQuery.sizeOf(context).height * .2,
            left: -20,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            )),
        Positioned(
            bottom: MediaQuery.sizeOf(context).height * .2,
            right: -20,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            )),
        const Positioned(
          left: 0,
          right: 0,
          top: -40,
          child: CircleAvatar(
            radius: 40,
            backgroundColor: Color(0xFFD9D9D9),
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.green,
              child: Icon(Icons.check, color: Colors.white, size: 50),
            ),
          ),
        ),
        Positioned(
            right: 20 + 8,
            left: 20 + 8,
            bottom: MediaQuery.sizeOf(context).height * .2 + 20,
            child: const CustomDashLine()),
        Positioned(
          right: 0,
          left: 20,
          bottom: MediaQuery.sizeOf(context).height * .1,
          child: Row(
            children: [
              Image.asset("assets/qrcode.png"),
              Container(
                  width: 150,
                  height: 40,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFD9D9D9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'PAID',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF34A853),
                      fontSize: 24,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ))
            ],
          ),
        ),
      ]),
    );
  }
}
