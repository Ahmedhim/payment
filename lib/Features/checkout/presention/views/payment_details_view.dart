import 'package:flutter/material.dart';
import 'package:payment_app/Features/checkout/presention/views/widgets/payment_details_body.dart';

import '../../../../Core/constants.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Payment Details", style: Styles.style25),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_sharp, size: 30),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const PaymentDetailsBody(),
    );
  }
}
