import 'package:flutter/material.dart';
import 'package:payment_app/Core/constants.dart';
import 'package:payment_app/Features/checkout/presention/views/widgets/mycart_body.dart';

class MycartView extends StatelessWidget {
  const MycartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("My Cart", style: Styles.style25),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_sharp, size: 30),
          onPressed: () {},
        ),
      ),
      body: const MycartBody(),
    );
  }
}
