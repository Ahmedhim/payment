import 'package:flutter/material.dart';
import 'package:payment_app/Core/widgets/custom_credit_card.dart';
import 'package:payment_app/Features/checkout/presention/views/widgets/payment_list_item.dart';

class PaymentDetailsBody extends StatelessWidget {
  const PaymentDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 15),
          SizedBox(
            height: 62,
            child: PaymentListItem(),
          ),
          CustomCreditCard(),
        ],
      ),
    );
  }
}
